#!/bin/bash
. /etc/kaltura.d/system.ini

<<<<<<< HEAD
$BASE_DIR/bin/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=62 -param:ManualEndUpdateDaysInterval=52 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/bin/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=53 -param:ManualEndUpdateDaysInterval=43 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/bin/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=44 -param:ManualEndUpdateDaysInterval=34 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/bin/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=35 -param:ManualEndUpdateDaysInterval=25 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/bin/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=26 -param:ManualEndUpdateDaysInterval=16 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/bin/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=17 -param:ManualEndUpdateDaysInterval=7 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/bin/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=8 -param:ManualEndUpdateDaysInterval=0 >> /tmp/file_sync_sync_log.log 2>&1
=======
$BASE_DIR/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=62 -param:ManualEndUpdateDaysInterval=52 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=53 -param:ManualEndUpdateDaysInterval=43 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=44 -param:ManualEndUpdateDaysInterval=34 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=35 -param:ManualEndUpdateDaysInterval=25 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=26 -param:ManualEndUpdateDaysInterval=16 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=17 -param:ManualEndUpdateDaysInterval=7 >> /tmp/file_sync_sync_log.log 2>&1
$BASE_DIR/pentaho/pan.sh /file $BASE_DIR/dwh/etlsource/dimensions/tmp/update_file_sync_manually.kjb -param:ManualStartUpdateDaysInterval=8 -param:ManualEndUpdateDaysInterval=0 >> /tmp/file_sync_sync_log.log 2>&1
>>>>>>> d1c3d07d81513494745dc28b9731a23aad0a241a
