all: clean build

build:
	processing-java --sketch=${PWD}/quilt1 --output=${PWD}/quilt1/build --force --export

clean:
	rm -rf ${PWD}/quilt1/build

run:
	processing-java --sketch=${PWD}/quilt1  --run
