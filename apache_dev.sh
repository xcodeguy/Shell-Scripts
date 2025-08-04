#!/bin/sh

echo "stopping MACOSX apache server..."
/usr/sbin/apachectl stop

echo "stopping MAMP apache server..."
/Applications/MAMP/bin/apache2/bin/apachectl stop

echo "stopping ZEND apache server..."
/usr/local/zend/apache2/bin/apachectl stop

echo "starting ZEND apache server..."
/usr/local/zend/apache2/bin/apachectl start

echo "done."

