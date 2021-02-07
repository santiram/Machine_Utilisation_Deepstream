APP:= Machine_utilisation

CXX:= g++ -std=c++17

TARGET_DEVICE = $(shell g++ -dumpmachine | cut -f1 -d -)

NVDS_VERSION:=5.0

LIB_INSTALL_DIR?=/opt/nvidia/deepstream/deepstream-$(NVDS_VERSION)/lib/

ifeq ($(TARGET_DEVICE),aarch64)
  CFLAGS:= -DPLATFORM_TEGRA
endif

SRCS:= $(wildcard src/*.c)
SRCS+= $(wildcard src/*.cpp)

INCS:= $(wildcard src/*.h)

PKGS:= gstreamer-1.0 opencv

OBJS:= $(SRCS:.cpp=.o)

CFLAGS+= -I/opt/nvidia/deepstream/deepstream-5.0/sources/includes \
		 -DDS_VERSION_MINOR=0 -DDS_VERSION_MAJOR=5

CFLAGS+= `pkg-config --cflags $(PKGS)`

LIBS:= `pkg-config --libs $(PKGS)`

LIBS+= -L$(LIB_INSTALL_DIR) -L/usr/local/cuda/lib64 -lcudart \
	   -lnvdsgst_meta -lnvds_meta -lnvdsgst_helper -lm -lrt \
       -Wl,-rpath,$(LIB_INSTALL_DIR)

LIBS+= -pthread -O3 -Ofast

LIBS+= -lcurl -lgnutls -luuid -lnvbufsurface -lnvbufsurftransform

LIBS+=  -lopencv_core -lopencv_highgui -lopencv_imgproc -lboost_system -lopencv_imgcodecs -pthread -lz -lssl -lcrypto -lboost_program_options \
		-lboost_filesystem -lboost_date_time -lboost_context -lboost_coroutine -lboost_chrono \
		-lboost_log -lboost_thread -lboost_log_setup -lboost_regex -lboost_atomic

all: Machine_util objdets

objdets: yolov3
Machine_util: $(APP)

%.o: %.cpp $(INCS) Makefile
	$(CXX) -c -o $@ $(CFLAGS) $<

$(APP): $(OBJS) Makefile
	$(CXX) -o $(APP) $(OBJS) $(LIBS)

yolov3:
	cd nvds_customparser_yolov3_machine_utilisation && $(MAKE)

clean:
	cd nvds_customparser_yolov3_machine_utilisation && $(MAKE) clean
	rm -rf $(OBJS) $(APP)
	
