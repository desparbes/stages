SRC=src
BUILD=build

.PHONY: build

all: build

build: $(SRC)/*.java
	javac -d $(BUILD) $^

launch:
	cd $(BUILD) && java Interface

clean:
	rm $(BUILD)/*.class


