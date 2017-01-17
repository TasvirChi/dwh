<?php
require_once 'Configuration.php';
require_once 'KettleRunner.php';
require_once 'DWHInspector.php';
require_once 'MySQLRunner.php';
require_once 'BorhanTestCase.php';
require_once 'CycleProcessTestCase.php';
require_once 'CDNBandwidthHttpTestCase.php';

class AkamaiVodHttpTest extends CDNBandwidthHttpTestCase
{
	private $invalidIgnoredStrings = array(".borhan.com/flash/bae/",".borhan.com/crossdomain.xml",".borhan.com/content/uiconf",".borhan.com/swf/plugins");

	public static function setUpBeforeClass()
	{
		parent::setUpBeforeClass();
	}
	

	protected function getFetchParams()
	{
		global $CONF;
		
		return array(self::GENERATE_PARAM_FETCH_LOGS_DIR=>$CONF->BandwidthUsageAkamaiLogsDir,
					self::GENERATE_PARAM_FETCH_WILD_CARD=>$CONF->BandwidthUsageAkamaiWildCard,
					'FetchMethod' =>$CONF->BandwidthUsageAkamaiFetchMethod,
					'ProcessID'=>$CONF->BandwidthUsageAkamaiProcessID,
					'FetchJob'=>$CONF->EtlBasePath.'/common/fetch_files.kjb',
					'FetchFTPServer'=>$CONF->BandwidthUsageAkamaiFTPServer,
					'FetchFTPPort'=>$CONF->BandwidthUsageAkamaiFTPPort,
					'FetchFTPUser'=>$CONF->BandwidthUsageAkamaiFTPUser,
					'FetchFTPPassword'=>$CONF->BandwidthUsageAkamaiFTPPassword,
					'TempDestination'=>$CONF->ExportPath.'/dwh_inbound/bandwidth_usage',
					self::GENERATE_PARAM_IS_ARCHIVED=>'True');
	}

        protected function getProcessParams()
        {
                global $CONF;

                return array('ProcessID'=>$CONF->BandwidthUsageAkamaiProcessID,
                             'ProcessJob'=>$CONF->EtlBasePath.'/bandwidth_usage/process/bandwidth_usage_process_cycle.kjb',
                             'BandwidthSourceName'=>'akamai_vod_http');
        }

        protected function getTransferParams()
        {
                global $CONF;

                return array(self::TRANSFER_PARAM_PROCESS_ID=>$CONF->BandwidthUsageAkamaiProcessID);
        }

	protected function getBWRegex()
	{
		return '/^.*\t\/[^\.]+\.borhan\.com.*\/p\/([0-9]+)\/[^\t]*\t\d+\t(\d+)\t.*$/';
	}
	
        protected function getBandwidthSourceID()
        {
                return 4;
        }


	protected function ignoredInvalidBWLine($line)
        {
                foreach ($this->invalidIgnoredStrings as $ignoredString)
                {
                        if (strpos($line, $ignoredString))
                        {
                                return true;
                        }
                }
                return false;
        }

	public function testGenerate()
	{
		parent::testGenerate();
	}

	public function testProcess()
	{
		parent::testProcess();
	}
	
	public function testTransfer()
	{
		parent::testTransfer();
	}

	public function testAggregation()
	{
		parent::testAggregation(4);
	}	

}
?>
