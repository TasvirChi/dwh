<?php
require_once 'Configuration.php';
require_once 'KettleRunner.php';
require_once 'DWHInspector.php';
require_once 'MySQLRunner.php';

abstract class KalturaTestCase extends PHPUnit_Framework_TestCase
{
	public static function setUpBeforeClass()
	{
		global $CONF;
		#DWHInspector::cleanDB();
		#self::rrmdir($CONF->CyclePath.'/process/');
		#self::rrmdir($CONF->CyclePath.'/originals/');
		
		self::register();
	}
	
	private static function rrmdir($dir) 
	{ 
		if (is_dir($dir)) 
		{		
			$objects = scandir($dir); 
			foreach ($objects as $object) 
			{ 
				if ($object != "." && $object != "..") 
				{ 
					if (filetype($dir."/".$object) == "dir")
					{
						self::rrmdir($dir."/".$object); 
						rmdir($dir."/".$object);
					} else 
					{
						unlink($dir."/".$object); 
					}
				}
			}
			if($objects!=null)
			{
				reset($objects); 			
			}
		} 		
	}

        public static function register()
        {
                KettleRunner::execute('/common/register_etl_server.ktr');
        }

	public function countPerRegex($file, $regex, $validationCallback)
        {
                $lines = file($file);
                $items = array();
                foreach($lines as $line)
                {
                        $line = urldecode($line);
                        if(call_user_func($validationCallback, $line) && preg_match($regex, $line, $matches))
                        {
                                $item = $matches[1];
                                if(!array_key_exists($item,$items))
                                {
                                        $items[$item]=0;
                                }
                                if (count($matches)>2) 
                                {
                                        $items[$item]+=$matches[2];     
                                }
                                else
                                {
                                        $items[$item]++;
                                }
                        }
                }
                return $items;
        }

	public function compareAggregation($groupByColumn, $fact, $factMeasure, $aggr, $aggrMeasure)
        {
                $aggrGroups = DWHInspector::groupBy($groupByColumn, $aggrMeasure, $aggr);
                $factGroups = DWHInspector::groupBy($groupByColumn, $factMeasure, $fact);

                foreach($factGroups as $id=>$measure)
                {
                        if(!array_key_exists($id,$aggrGroups))
                        {
                                $this->assertEquals(0, $measure);
                        } else
                        {
                                $this->assertLessThanOrEqual(0.01, $aggrGroups[$id]-$measure, "For the following group: $id");
                        }
                }
        }
}
?>
