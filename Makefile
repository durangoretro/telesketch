DDK?=../dclib/
RESCOMP ?= ../rescomp/workspace/rescomp/target/rescomp.jar
SOURCE_DIR=src
BUILD_DIR = bin
CFG=$(DDK)/cfg/durango16k.cfg
DCLIB=$(DDK)/bin
DCINC=$(DDK)/inc

all: telesketch.dux

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/main.s: $(SOURCE_DIR)/main.c $(BUILD_DIR)
	cc65 -I $(DCINC) $(SOURCE_DIR)/main.c -t none --cpu 6502 -o $(BUILD_DIR)/main.s

$(BUILD_DIR)/main.o: $(BUILD_DIR)/main.s $(BUILD_DIR)
	ca65 -t none $(BUILD_DIR)/main.s -o $(BUILD_DIR)/main.o


telesketch.bin: $(BUILD_DIR) $(BUILD_DIR)/main.o
	ld65 -C $(CFG) $(BUILD_DIR)/main.o $(DCLIB)/durango.lib -o telesketch.bin	

telesketch.dux: telesketch.bin
	java -jar ${RESCOMP} -m SIGNER -n Telesketch -t Telesketch -d "Draw Lines On durango" -i telesketch.bin -o telesketch.dux
clean:
	rm -Rf $(BUILD_DIR) telesketch.bin telesketch.dux
