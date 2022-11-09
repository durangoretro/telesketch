#include <system.h>
#include <geometrics.h>
#include <psv.h>

void move(void);

unsigned char x, y;

int main(void) {
    setHiRes(1);
	x=128;
	y=128;    
	
	drawPixel(0,0,0xff);
	drawPixel(0,1,0xff);
	drawPixel(0,1,0xff);
	while(1){
		move();
		waitFrames(1);
	}
    return 0;
}

void move() {
    unsigned char gamepad;
    
    // Read gamepad
    gamepad=readGamepad(0);
    // Move left
    if(gamepad & BUTTON_LEFT && x>0) {
        x--;
		drawPixel(x,y,0xff);
    }
    // Move right
    if(gamepad & BUTTON_RIGHT && x<256) {
        x++;
		drawPixel(x,y,0xff);
    }
	// Move up
    if(gamepad & BUTTON_UP && y>0) {
        y--;
		drawPixel(x,y,0xff);
    }
	// Move down
    if(gamepad & BUTTON_DOWN && y<256) {
        y++;
		drawPixel(x,y,0xff);
    }
	if(gamepad & BUTTON_A) {
		drawFullScreen(0x00);
	}
}
