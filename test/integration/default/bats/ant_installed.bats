@test "verifying java installation" {
	run java -version
	["status" -eq 0]
}

@test "verifying JAVA_HOME is set" {
	run echo $JAVA_HOME
	["status" -eq 0]
}

@test "verifying ANT_HOME is set" {
	run echo $ANT_HOME
	["status" -eq 0]
}

@test "ant is properly installed" {
	run ant -version
	["status" -eq 0]
}