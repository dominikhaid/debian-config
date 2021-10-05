#!/usr/bin/env bash

# NOTE:
# This doesn't work as is on Windows. You'll need to create an equivalent `.bat` file instead
#
# NOTE:
# If you're not using Linux you'll need to adjust the `-configuration` option
# to point to the `config_mac' or `config_win` folders depending on your system.

JAR="$HOME/dev/java/jars/eclipse/plugins/org.eclipse.equinox.launcher_*.jar"

GRADLE_HOME=$GRADLE_HOME "$JAVA_HOME/bin/java" \
	-Declipse.application=org.eclipse.jdt.ls.core.id1 \
	-Dosgi.bundles.defaultStartLevel=4 \
	-Declipse.product=org.eclipse.jdt.ls.core.product \
	-Dlog.protocol=true \
	-Dlog.level=ALL \
	-Xms1g \
	-Xmx2G \
	-javaagent:"$HOME/dev/java/jars/plugins/lombok.jar" \
	-Xbootclasspath/a:"$HOME/dev/java/plugins/lombok.jar" \
	-jar $(echo "$JAR") \
	-configuration "$HOME/dev/java/jars/eclipse/config_linux" \
	-data "${1:-$HOME/dev/java/.cache}" \
	--add-modules=ALL-SYSTEM \
	--add-opens java.base/java.util=ALL-UNNAMED \
	--add-opens java.base/java.lang=ALL-UNNAMED
