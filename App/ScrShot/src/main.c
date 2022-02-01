#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdint.h>
#include <linux/fb.h>
#include <linux/input.h>

//
//	Rumble ON(1) / OFF(0)
//
void rumble(uint32_t val) {
	int fd;
	const char str_export[] = "48";
	const char str_direction[] = "out";
	char value[1];
	value[0] = ((val&1)^1) + 0x30;

	fd = open("/sys/class/gpio/export",O_WRONLY);
		if (fd > 0) {
			write(fd, str_export, 2);
			close(fd);
		}
	fd = open("/sys/class/gpio/gpio48/direction",O_WRONLY);
		if (fd > 0) {
			write(fd, str_direction, 3);
			close(fd);
		}
	fd = open("/sys/class/gpio/gpio48/value",O_WRONLY);
		if (fd > 0) {
			write(fd, value, 1);
			close(fd);
		}
}

//
//	Screenshot (640x480, rotate180)
//
void screenshot(void) {
	const uint8_t bmpheader[] = {		// 640x480 RGB888 32bit BMP Header
		0x42,0x4D,0x36,0xC0,0x12,0x00,0x00,0x00,0x00,0x00,0x36,0x00,0x00,0x00,0x28,0x00,
		0x00,0x00,0x80,0x02,0x00,0x00,0xE0,0x01,0x00,0x00,0x01,0x00,0x20,0x00,0x00,0x00,
		0x00,0x00,0x00,0x00,0x00,0x00,0x12,0x0B,0x00,0x00,0x12,0x0B,0x00,0x00,0x00,0x00,
		0x00,0x00,0x00,0x00,0x00,0x00 };
	char		screenshotname[32];
	uint32_t	linebuffer[640], i, x, y, pix1, pix2;
	int		fd, fd_fb;
	struct		fb_var_screeninfo vinfo;

	for (i=0; i<100; i++) {
		snprintf(screenshotname,sizeof(screenshotname),"/mnt/SDCARD/screenshot%02d.bmp",i);
		if ( access(screenshotname, F_OK) != 0 ) break;
	} if (i > 99) return;

	fd_fb = open("/dev/fb0", O_RDWR);
	ioctl(fd_fb, FBIOGET_VSCREENINFO, &vinfo);

	fd = creat(screenshotname, 777);
	if (fd > 0) {
		write(fd,bmpheader,sizeof(bmpheader));
		lseek(fd_fb,640*vinfo.yoffset*4,SEEK_SET);
		for (y=480; y>0; y--) {
			read(fd_fb,linebuffer,sizeof(linebuffer));
			for (x=320; x>0; x--){
				pix1 = linebuffer[320-x] | 0xFF000000;
				pix2 = linebuffer[320+x-1]  | 0xFF000000;
				linebuffer[320+x-1] = pix1;
				linebuffer[320-x] = pix2;
			}
			write(fd,linebuffer,sizeof(linebuffer));
		}
		close(fd);
		sync();
	}
	close(fd_fb);
}

//
//	Screenshot Sample Main
//
#define	BUTTON_MENU	KEY_ESC
#define	BUTTON_POWER	KEY_POWER
#define	BUTTON_L2	KEY_TAB
#define	BUTTON_R2	KEY_BACKSPACE
int main() {
	int			input_fd;
	struct input_event	ev;
	uint32_t		val;
	uint32_t		l2_pressed = 0;
	uint32_t		r2_pressed = 0;

	// Prepare for Poll button input
	input_fd = open("/dev/input/event0", O_RDONLY);

	while( read(input_fd, &ev, sizeof(ev)) == sizeof(ev) ) {
		val = ev.value;
		if (( ev.type != EV_KEY ) || ( val > 1 )) continue;
//		printf("code: %d val: %d\n",ev.code,val);
		if (( ev.code == BUTTON_L2 )||( ev.code == BUTTON_R2 )) {
			if ( ev.code == BUTTON_L2 ) {
				l2_pressed = val;
			} else if ( ev.code == BUTTON_R2 ) {
				r2_pressed = val;
			}
			if (l2_pressed & r2_pressed) {
				rumble(1);
				screenshot();
				usleep(500000);	//0.5s
				rumble(0);
				l2_pressed = r2_pressed = 0;
			}
		}
	}

	// Quit
	close(input_fd);

	return 0;
}
