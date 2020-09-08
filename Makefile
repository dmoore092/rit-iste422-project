all : clean EdgeConnectorTest RunEdgeConvert

clean :
	rm -f *.class
	find . -name \*.class -exec rm {} \;

compile : 
	echo "compiling source files and unit tests..."
	javac -cp lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar -sourcepath src/main/java/*.java src/test/java/*.java -d build

EdgeConnectorTest : compile
	echo "running tests..."
	java -cp lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar:build org.junit.runner.JUnitCore EdgeConnectorTest

RunEdgeConvert: compile
	echo "running application..."
	java -cp build RunEdgeConvert
