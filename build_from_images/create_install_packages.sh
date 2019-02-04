rm *.zip


cd opal_poll && zip -r "../opal_poll_install$1.zip" *
cd ../queue && zip -r "../queue_install$1.zip" *
cd ../analysis && zip -r "../analysis_install$1.zip" *