
#include <stdio.h>
#include <linux/uinput.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <libusb-1.0/libusb.h>
#include <linux/joystick.h>
#include <stdlib.h>
#include <errno.h>
#include <linux/input.h>
#include <linux/joystick.h>
void emit(int fd, int type, int val,int axis)
{
   struct input_event ie;
   ie.type = type;
   ie.value = val;
   ie.code = axis;
write(fd, &ie, sizeof(ie));
}


void processData(int n,int fd)
{
int bits[5];// need the 5 bits
int xaxis;
int yaxis;
int k;
int xreport;
int yreport;
for(k=0; k<5; k++){//getting each bit
    int mask =  1 << k;
    int masked_n = n & mask;
    int thebit = masked_n >> k;
    bits[k] = thebit;
}
xaxis = 2*bits[3] + bits[2];//Calculates xaxis value
yaxis = 2*bits[1] + bits[0];//calculates yaxis value

if(xaxis == 3)// logic for retrieving x-axis value according to specs
{
xreport = 32767;
} else if(xaxis == 2)
{
xreport = 0;
} else if(xaxis == 1)
{
xreport = -32767;
}


if(yaxis == 3)//same as above but for y
{
yreport = -32767;
} else if(yaxis == 2)
{
yreport = 0;
} else if(yaxis == 1)
{
yreport = 32767;
}
//below  emits the events
emit(fd, EV_ABS,yreport, ABS_Y);
emit(fd, EV_ABS,xreport, ABS_X);
emit(fd,EV_SYN,0,SYN_REPORT);
emit(fd,JS_EVENT_BUTTON,bits[4], BTN_0);
emit(fd,EV_SYN,0,SYN_REPORT);
}

int main(void)
{
int r, e =0;
struct libusb_device_handle *handle =  NULL;
struct libusb_context *ctx = NULL;
struct uinput_user_dev uud;
char data;
int nbytes = 0;
uint16_t vend = 0x9A7A;
uint16_t pid = 0xBA17;
int d;
int fd;

// Here we set up user_dev structure for creating js0 file
uud.absmax[ABS_X]=32767;
uud.absmin[ABS_X]=-32767;
uud.absmax[ABS_Y]=32767;
uud.absmin[ABS_Y]=-32767;
uud.absfuzz[ABS_Y] = 0;
uud.absfuzz[ABS_Y] = 0;
uud.absflat[ABS_X] = 0;
uud.absflat[ABS_Y] = 0;
uud.id.bustype = BUS_VIRTUAL;
uud.id.vendor = vend;
uud.id.product = pid;

r = libusb_init(&ctx);//init libusb

if(r < 0)
{
printf("\n Failed to start libusb\n");
return 0;
}
libusb_set_debug(ctx,3);//setting context
handle = libusb_open_device_with_vid_pid(ctx, vend, pid);// opening device

if(handle == NULL)
{
printf("Can't open device");
return 0;
}

if(libusb_kernel_driver_active(handle, 0) == 1)//checking if kernel is connected to device
{
libusb_detach_kernel_driver(handle,0);//detaching kernel
}

e = libusb_claim_interface(handle, 0);//claiming interface
if(e < 0)
{
printf("Cannot claim interface");
return 0;
}

fd = open("/dev/uinput", O_WRONLY | O_NONBLOCK);
memset(&uud, 0, sizeof(uud));
//ioctl for js0 file
ioctl(fd, UI_SET_EVBIT, EV_ABS);
ioctl(fd, UI_SET_EVBIT, EV_KEY);
ioctl(fd, UI_SET_KEYBIT,BTN_0);
ioctl(fd, UI_SET_ABSBIT,ABS_X);
ioctl(fd, UI_SET_ABSBIT, ABS_Y);
strcpy(uud.name, "Chompstick");
write(fd, &uud, sizeof(uud));
ioctl(fd, UI_DEV_CREATE);

while(1)
{
r = libusb_interrupt_transfer(handle,(0x81 | LIBUSB_ENDPOINT_IN) , &data,1, &nbytes,0);
if(r == 0)
{
d = (int) data;
processData(d,fd);// using my helper function to processData
}
if(r == LIBUSB_ERROR_NO_DEVICE)//When device disconnects we stop
	break;
}
r = libusb_release_interface(handle, 0);
libusb_close(handle);
libusb_exit(ctx);
sleep(1);
ioctl(fd,UI_DEV_DESTROY);
close(fd);
return 0;
}
