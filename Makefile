all: build

build: Parser.java Display.java Interface.java
	javac $^

launch:
	java Interface

clean:
	rm *.class


