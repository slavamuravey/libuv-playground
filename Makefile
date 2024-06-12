.PHONY: build
build: deps
	cmake -S deps/libuv -B deps/libuv/build -DBUILD_TESTING=ON
	cmake --build deps/libuv/build

.PHONY: deps
deps:
	git submodule init && git submodule update
