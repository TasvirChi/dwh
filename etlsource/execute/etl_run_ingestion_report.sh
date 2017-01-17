#!/bin/bash
. /etc/borhan.d/system.ini

ROOT_DIR=$BASE_DIR/dwh
MAIL_SUBJECT="Daily Usage Report"
RECIPIENTS="orly.lampert@borhan.com"
ATTACH=/tmp/ingestion_dashboard.pdf
REPORT=ingestion_monthly.rptdesign
OUT=PDF
STARTDATE=$(date --date '1 month ago' +%Y%m01)

while getopts "s:r:f:o:a:q:" o
do      case "$o" in
    s)  MAIL_SUBJECT="$OPTARG";;
    r)  RECIPIENTS="$OPTARG";;
    a)  ATTACH="$OPTARG";;
    f)  REPORT="$OPTARG";;
    o)  OUT="$OPTARG";;
    q)  PREEMPTIVE_SQL_CHECK_FILE="$OPTARG";;
        [?])    echo >&2 "Usage: $0 [-s mail_subject] [-r recipients,comma-seperated] [-f report-file-name] [-o output-format PDF|XLS] [-a attachment-name]"
                exit 1;;
        esac
done

res=0
        export BIRT_HOME=/home/borhan/birt-runtime-4_2_1/
        sh $BIRT_HOME/ReportEngine/genReport.sh -m runrender -f $OUT -p "DateIDParam=$STARTDATE" -o $ATTACH $ROOT_DIR/reports/$REPORT 

