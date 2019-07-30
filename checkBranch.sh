LATEST_TAG=$(git describe --abbrev=0)
TS_GIT=$(git log -1 --format=%at $LATEST_TAG)
TS_NOW=$(date +%s)
TS_DIFF=$((TS_NOW - TS_GIT))
TS_DIFF_DAYS=$(($TS_DIFF/(3600*24)))

if [[ "$TS_DIFF_DAYS" -lt "1" ]];
then
    echo "smaller value"
else
    echo "larger"
    exit 1
fi