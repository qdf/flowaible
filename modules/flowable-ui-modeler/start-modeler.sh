#!/bin/sh
echo "Building all modeler ui submodules"
export FLOWABLE_COMMON_APP_IDM_URL="http://a.keera.ai:8080/flowable-idm"
mvn -T 1C clean install -DskipTests
STATUS=$?
if [ $STATUS -eq 0 ]
then
	cd flowable-ui-modeler-app

	# Run war
	export MAVEN_OPTS="$MAVEN_OPTS -noverify -Xms512m -Xmx1024m -Xdebug -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8001,server=y,suspend=n"
	mvn clean install -DskipTests spring-boot:run
else
    echo "Error while building root pom. Halting."
fi
	
