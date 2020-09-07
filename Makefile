all : clean RunEdgeConvert

clean :
	rm -f *.class
	find . -name \*.class -exec rm {} \;

RunEdgeConvert.class :
	echo "compiling source code and unit tests..."
	javac -cp lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar -sourcepath src/main/java/*.java src/test/java/*.java -d build

EdgeConnectorTest : EdgeConnectorTest
	echo "running tests..."
	java -cp lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar:build org.junit.runner.JUnitCore EdgeConnectorTest

RunEdgeConvert: RunEdgeConvert.class
	echo "running application..."
	java -cp build RunEdgeConvert
