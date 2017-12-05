rm -rf ~/.conan/data/Protobuf/3.5.0 || true
conan install Protobuf/3.5.0@pkarasev/dev --build Protobuf
