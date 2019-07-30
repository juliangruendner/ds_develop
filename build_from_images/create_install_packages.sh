rm *.zip

cd opal_poll && zip -r "../opal_poll_install_$1.zip" *
cd ../queue && zip -r "../queue_install_$1.zip" *
cd ../analysis && zip -r "../analysis_install_$1.zip" *
cd ../test && zip -r "../test_install_$1.zip" *