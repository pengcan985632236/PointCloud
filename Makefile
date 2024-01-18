
CC=gcc
CPP=g++
AR=ar
STRIP=strip
CFLAGS = -I./ -I/usr/local/include/pcl-1.9 -I/usr/include/eigen3 -I/usr/include/vtk-6.3 -g
LDFLAGS = -L./ -L/usr/local/lib -L/usr/lib/x86_64-linux-gnu -lpcl_common -lpcl_io -lpcl_filters -lpcl_features -lpcl_kdtree -lpcl_keypoints -lpcl_ml -lpcl_octree -lpcl_recognition -lpcl_registration -lpcl_sample_consensus -lpcl_search -lpcl_segmentation -lpcl_surface -lpcl_tracking -lpcl_visualization -lboost_system -lvtkCommonDataModel-6.3 -lvtkCommonCore-6.3 -lvtkRenderingCore-6.3 -lvtkCommonMath-6.3
APP = example-service
# SRC = $(wildcard *.cpp Log/*.cpp Lock/*.cpp DBHelper/*.cpp example/*.cpp database/sqlite3/version/*.cpp)
SRC = $(wildcard *.cpp)
OBJ = $(patsubst %.cpp, %.o, $(SRC))
# g++ myfile.cpp -o myprogram -I/path/to/pcl/include -L/path/to/pcl/lib -lpcl_common -lpcl_io -lpcl_filters -lpcl_features -lpcl_kdtree -lpcl_keypoints -lpcl_ml -lpcl_octree -lpcl_recognition -lpcl_registration -lpcl_sample_consensus -lpcl_search -lpcl_segmentation -lpcl_surface -lpcl_tracking -lpcl_visualization

# CFLAGS = -Wall -fpermissive -Wwrite-strings -std=c++0x -I./ -I../../../libs -I../../../libs/boost/include -I../../../libs/mqtt/include -I../../../libs/openssl/include -I../../../libs/sqlite/include -I../../../libs/zklczzdlib -I./Log -I./Lock -g
# LDFLAGS = -L./ -L../../../libs -L../../../libs/cjson -L../../../libs/boost/lib -L../../../libs/redis/lib ../../../libs/mqtt/lib/libpaho-mqtt3as.so.1 ../../../libs/openssl/lib/libcrypto.so.1.0.0 ../../../libs/openssl/lib/libssl.so.1.0.0 -L../../../libs/sqlite/lib -L../../../libs/zklczzdlib -lhiredis  -lpthread -lzklczzd -lcjson -lsqlite3
# without hiredis


all:${OBJ}
	$(CPP) ${OBJ} $(CFLAGS) $(LDFLAGS) -o $(APP)
	$(STRIP) $(APP)
	
%.o: %.cpp
	$(CPP) $(CFLAGS) -c $< -o $@
# Log/%.o: Log/%.cpp
# 	$(CPP) $(CFLAGS) -c $< -o $@
# Lock/%.o: Lock/%.cpp
# 	$(CPP) $(CFLAGS) -c $< -o $@
# DBHelper/%.o: DBHelper/%.cpp
# 	$(CPP) $(CFLAGS) -c $< -o $@
# example/%.o: example/%.cpp
# 	$(CPP) $(CFLAGS) -c $< -o $@
# database/sqlite3/version/%.o: database/sqlite3/version/%.cpp
# 	$(CPP) $(CFLAGS) -c $< -o $@
clean:
	find ./ -name '*.o' -exec rm -rf {} \;
	rm -rf $(APP)
