SOURCE_DIR=.
RESCOMP = ../rescomp/workspace/rescomp/target/rescomp.jar
BUILD_DIR = bin
CFG=../dclib/cfg/durango16k.cfg
DCLIB=../dclib/bin
DCINC=../dclib/inc

all: telesketch.bin

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/main.s: $(SOURCE_DIR)/main.c $(BUILD_DIR)
	cc65 -I $(DCINC) $(SOURCE_DIR)/main.c -t none --cpu 6502 -o $(BUILD_DIR)/main.s

$(BUILD_DIR)/main.o: $(BUILD_DIR)/main.s $(BUILD_DIR)
	ca65 -t none $(BUILD_DIR)/main.s -o $(BUILD_DIR)/main.o


telesketch.bin: $(BUILD_DIR) $(BUILD_DIR)/main.o
	ld65 -C $(CFG) $(BUILD_DIR)/main.o $(DCLIB)/geometrics.lib $(DCLIB)/durango.lib $(DCLIB)/system.lib $(DCLIB)/psv.lib -o telesketch.bin	

clean:
	rm -Rf $(BUILD_DIR) telesketch.bin
