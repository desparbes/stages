all: *.java
	javac $^

clean:
	rm *.class
