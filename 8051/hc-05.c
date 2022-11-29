#include <8051.h>
#define DHT11_DATA P0_0
#include "uart.c"
#include "DHT11.c"
#define A_IA P2_0
#define A_IB P2_1
// ISR Prototypes ===================================================
void UART_ISR(void) __interrupt 4; // ISR for UART Interrupt
int state=0;
char str[30];
void main(void)
{
int i,j;
unsigned char Humidity;
unsigned char Temperature;

IE = 0x90;
uart_initialize();

while(1)
	{
	for(i=0;i<1000;i++){
		for(j=0;j<150;j++){
			if(state==1){
				A_IB=0;
				A_IA=1;for(i=0;i<30;i++);
				A_IA=0;for(i=30;i<100;i++);
			}
			else if(state==0){
				A_IA=A_IB=0;
			}
		}
	}
	EA = 0;
	ES = 0;
	DHT11_Read(&Humidity,&Temperature);
	uart_put_integer(Temperature);
	uart_put_string("\r\n");
	if(state==1){
		A_IB=0;
		A_IA=1;for(i=0;i<30;i++);
		A_IA=0;for(i=30;i<100;i++);
	}
	else if(state==0){
		A_IA=A_IB=0;
	}
	for(i=0;i<1000;i++){
		for(j=0;j<150;j++){
			if(state==1){
				A_IB=0;
				A_IA=1;for(i=0;i<30;i++);
				A_IA=0;for(i=30;i<100;i++);
			}
			else if(state==0){
				A_IA=A_IB=0;
			}
		}
	}
	EA = 1;
	ES = 1;
	}

}

void UART_ISR(void) __interrupt 4
{
int s;
 if(RI == 1)
    {
        RI = 0;
        s = SBUF;
        SBUF = s;
        if(state==0){
        	state = 1;
        }
        else if(state==1){
        	state = 0;
        }
    }
    else if(TI == 1)
    {
        TI = 0;
    }

}

