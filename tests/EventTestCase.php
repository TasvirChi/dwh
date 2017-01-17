<?php
require_once 'Configuration.php';
require_once 'KettleRunner.php';
require_once 'DWHInspector.php';
require_once 'MySQLRunner.php';
require_once 'BorhanTestCase.php';
require_once 'CycleProcessTestCase.php';
require_once 'ComparedTable.php';

abstract class EventTestCase extends CycleProcessTestCase
{
	const BW_REGEX = '/^.* "GET \/p\/(\d+)\/.*" 200 (\d+) .*$/';

	public function testGenerate()
	{
		parent::testGenerate();
	}

	public function testProcess()
	{
		parent::testProcess();

		global $CONF;

                $cycleID = DWHInspector::getCycle('LOADED');
		
		$files = DWHInspector::getFiles($cycleID);
		foreach($files as $fileID)
		{
			$filename =  $CONF->ProcessPath."/".$cycleID.'/'.DWHInspector::getFileName($fileID);
		
			// compare rows in ds_events to rows in file
                        $this->assertEquals(DWHInspector::countRows('borhandw_ds.ds_events',$fileID),$this->countRows($filename, array($this, 'validBDPLine')));

                        // compare plays in ds_events to plays in file
                        $this->assertEquals(DWHInspector::countRows('borhandw_ds.ds_events',$fileID,' and event_type_id=3'),$this->countPlays($filename));
						
                        // compare per entry
                        $entries = $this->countPerEntry($filename);
                        $this->assertEquals(count($entries), DWHInspector::countDistinct('borhandw_ds.ds_events',$fileID,'entry_id'));

                        foreach($entries as $entry=>$val)
                        {
                                $res = DWHInspector::countRows('borhandw_ds.ds_events',$fileID," and entry_id='".$entry."'");
                                $this->assertEquals($res, $val);
                        }

                        // compare bdp events per partner
                        $bdpEventsPartners = $this->countBDPEventsPerPartner($filename);     
                        $this->assertEquals(count($bdpEventsPartners), DWHInspector::countDistinct('borhandw_ds.ds_events',$fileID,'partner_id'));

                        foreach($bdpEventsPartners as $partner=>$val)
                        {
                                $res = DWHInspector::countRows('borhandw_ds.ds_events',$fileID," and partner_id='".$partner."'");
                                $this->assertEquals($res, $val);
                        }

			// compare rows in ds_bandwidth_usage to rows in file
                        $this->assertEquals(DWHInspector::countRows('borhandw_ds.ds_bandwidth_usage',$fileID),$this->countRows($filename, array($this, 'validBWLine')));

                        // compare bandwidth_bytes in ds_bandwidth_usage to bandwidth bytes consumed in file
			$dbBytes = DWHInspector::sumRows('borhandw_ds.ds_bandwidth_usage',$fileID,"bandwidth_bytes");
                        $this->assertEquals(is_null($dbBytes) ? 0 : $dbBytes, $this->sumBytes($filename, array($this, 'validBWLine'), self::BW_REGEX));

			// compare bw consumption per partner
                        $bwPartners = $this->countBWEventsPerPartner($filename); 
                        $this->assertEquals(count($bwPartners), DWHInspector::countDistinct('borhandw_ds.ds_bandwidth_usage',$fileID,'partner_id'));

                        foreach($bwPartners as $partner=>$val)
                        {
                                $res = DWHInspector::sumRows('borhandw_ds.ds_bandwidth_usage',$fileID,'bandwidth_bytes', ' and partner_id=\''.$partner.'\'');
                                $this->assertEquals($res, $val);
                        }	

			// make sure there are very little invalid lines
			$this->assertEquals($this->countInvalidLines($filename, 
									array($this, 'validBDPLine'), 
									array($this, 'ignoredInvalidBDPLine'))+
					    $this->countInvalidLines($filename, 
									array($this, 'validBWLine'), 
									array($this, 'ignoredInvalidBWLine')),
					DWHInspector::countRows('borhandw_ds.invalid_ds_lines',$fileID));
		}
	}
	
	public function validBDPLine($line)
	{
		return (strpos($line,'service=stats')!==false && 
			strpos($line,'action=collect')!==false && 
			(strpos($line,'event%3AentryId=')!==false || strpos($line,'event:entryId=')!==false)) 
			|| 
			(strpos($line,'collectstats')!==false);
	}

	public function ignoredInvalidBDPLine($line)
	{
		return (strpos($line,'service=stats')==false || strpos($line,'action=collect')==false);
	}

	public function ignoredInvalidBWLine($line)
        {
		return !$this->validBWLine($line);	
        }

	public function validBWLine($line)
        {
                return (preg_match(self::BW_REGEX, $line) > 0);
        }	
	
	private function countPlays($file)
	{
		$lines = file($file);
		$counter = 0;
		foreach($lines as $line)
		{
			$line = urldecode($line);
			if($this->validBDPLine($line) && preg_match('/eventType\=3[ \&]/', $line) > 0)
			{
				$counter++;
			}
		}
		return $counter;
	}
	
	private function countPerEntry($file)
	{
		return $this->countPerRegex($file, '/^.*entryId=([^& "]*).*/',array($this, 'validBDPLine'));
	}
	
	private function countBDPEventsPerPartner($file)
	{
		return $this->countPerRegex($file, '/^.*partnerId=([^& "]*).*/',array($this, 'validBDPLine'));
	}
	
	private function countBWEventsPerPartner($file)
        {
                return $this->countPerRegex($file, self::BW_REGEX,array($this, 'validBWLine'));
        }

	public function testTransfer()
	{
		parent::testTransfer();
	}

	public function testAggregation()
	{
		// create entries for aggregation according to fact
		DWHInspector::createEntriesFromFact();

		parent::testAggregation();
                $cycleID = DWHInspector::getCycle('DONE');
		$factsToHours = DWHInspector::getAggrDatesAndHours($cycleID);
		$factTable = 'borhandw.dwh_fact_events';
		$minDateID = DWHInspector::getResetAggregationsMinDateID($cycleID, $factTable);
		foreach ($factsToHours[$factTable] as $dateID => $hours)
		{
			if ($dateID < $minDateID)
			{
				continue;
			}
			foreach ($hours as $hourID)
			{
				$this->compareAggregation(array(new ComparedTable('partner_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')), 
					  array(new ComparedTable('partner_id', 'borhandw.dwh_hourly_partner', 'ifnull(count_plays, 0)')),0,
					 'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
				$this->compareAggregation(array(new ComparedTable('entry_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')),
                                          array(new ComparedTable('entry_id', 'borhandw.dwh_hourly_events_entry', 'ifnull(count_plays, 0)')),0,
                                         'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
				$this->compareAggregation(array(new ComparedTable('domain_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')),
                                          array(new ComparedTable('domain_id', 'borhandw.dwh_hourly_events_domain', 'ifnull(count_plays, 0)')),0,
                                         'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
				$this->compareAggregation(array(new ComparedTable('referrer_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')),
                                          array(new ComparedTable('referrer_id', 'borhandw.dwh_hourly_events_domain_referrer', 'ifnull(count_plays, 0)')),0,
                                         'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
				$this->compareAggregation(array(new ComparedTable('location_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')),
                                          array(new ComparedTable('location_id', 'borhandw.dwh_hourly_events_country', 'ifnull(count_plays, 0)')),0,
                                         'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
				$this->compareAggregation(array(new ComparedTable('country_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')),
                                          array(new ComparedTable('country_id', 'borhandw.dwh_hourly_events_country', 'ifnull(count_plays, 0)')),0,
                                         'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
				$this->compareAggregation(array(new ComparedTable('widget_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')),
                                          array(new ComparedTable('widget_id', 'borhandw.dwh_hourly_events_widget', 'ifnull(count_plays, 0)')),0,
                                         'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
				$this->compareAggregation(array(new ComparedTable('os_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')),
                                          array(new ComparedTable('os_id', 'borhandw.dwh_hourly_events_devices', 'ifnull(count_plays, 0)')),0,
                                         'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
				$this->compareAggregation(array(new ComparedTable('browser_id', 'borhandw.dwh_fact_events', 'if(event_type_id=3,1,0)')),
                                          array(new ComparedTable('browser_id', 'borhandw.dwh_hourly_events_devices', 'ifnull(count_plays, 0)')),0,
                                         'event_date_id = ' . $dateID . ' and event_hour_id = ' . $hourID,
                                         'date_id = ' . $dateID . ' and hour_id = ' . $hourID);
			}
		
			$this->compareAggregation(array(new ComparedTable('partner_id', 'borhandw.dwh_fact_bandwidth_usage', '(bandwidth_bytes/1024)')),
									array(new ComparedTable('partner_id', 'borhandw.dwh_hourly_partner_usage', 'ifnull(count_bandwidth_kb, 0)')), 1,
						'activity_date_id = ' . $dateID, 'date_id = ' . $dateID);
			$this->compareAggregation(array(new ComparedTable('bandwidth_source_id', 'borhandw.dwh_fact_bandwidth_usage', '(bandwidth_bytes/1024)')), 
						 array(new ComparedTable('bandwidth_source_id','borhandw.dwh_hourly_partner_usage','ifnull(count_bandwidth_kb,0)')),1
                                               ,'activity_date_id = ' . $dateID, 'date_id = ' . $dateID);
			$this->compareAggregation(array(new ComparedTable('location_id', 'borhandw.dwh_fact_bandwidth_usage', '(bandwidth_bytes/1024)')),
							array(new ComparedTable('location_id', 'borhandw.dwh_hourly_events_devices', 'ifnull(count_bandwidth_kb, 0)')), 1,
						'activity_date_id = ' . $dateID, 'date_id = ' . $dateID);
			$this->compareAggregation(array(new ComparedTable('country_id', 'borhandw.dwh_fact_bandwidth_usage', '(bandwidth_bytes/1024)')),
									  array(new ComparedTable('country_id', 'borhandw.dwh_hourly_events_devices', 'ifnull(count_bandwidth_kb, 0)')), 1,
						  'activity_date_id = ' . $dateID, 'date_id = ' . $dateID);
		}
		$this->compareAggregation(array(new ComparedTable('entry_id', 'borhandw.dwh_hourly_events_entry', 'ifnull(count_plays,0)')),
					  array(new ComparedTable('entry_id', 'borhandw.dwh_entry_plays_views', 'ifnull(plays,0)')));
		$this->compareAggregation(array(new ComparedTable('entry_id', 'borhandw.dwh_hourly_events_entry', 'ifnull(count_loads,0)')),
                                          array(new ComparedTable('entry_id', 'borhandw.dwh_entry_plays_views', 'ifnull(views,0)')));
	}	

}
?>
