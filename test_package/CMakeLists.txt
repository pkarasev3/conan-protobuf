project(Protobuf)
cmake_minimum_required(VERSION 2.8)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

if (MSVC)
  add_definitions(/MP)
endif (MSVC)

PROTOBUF_GENERATE_CPP(SRC_FILE HEADER_FILE message.proto)

include_directories(${Protobuf_INCLUDE_DIRS} ${CMAKE_CURRENT_BINARY_DIR}) # CMAKE_CURRENT_BINARY_DIR is where our generated files are (.pb.hpp)
add_executable(${PROJECT_NAME} client.cpp ${SRC_FILE} ${HEADER_FILE})
#if(NOT TARGET protobuf::libprotobuf)
#    message(FATAL_ERROR "WE DIDN'T FIND LIBPROTOBUFS IMPORT TARGET (Protobuf_LIBRARIES = #{Protobuf_LIBRARIES})")
#endif()
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})
