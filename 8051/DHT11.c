// DHT11 library for SDCC by Chin-Shiuh Shieh on 2021/12/15

// #define DHT11_DATA P0_0

__bit DHT11_Read_Bit()
{
while(DHT11_DATA==0);
TL0=0;
while(DHT11_DATA==1);
if(TL0>50)
	return 1;
else
	return 0;
}

void DHT11_Read(unsigned char * Humidity,unsigned char * Temperature)
{
unsigned char i;
unsigned char readings[40];

TMOD&=0xF1;TMOD|=0x01;TR0=1;

TH0=0;TL0=0;
DHT11_DATA=0;
while(TH0<75);
DHT11_DATA=1;

while(DHT11_DATA==1);
while(DHT11_DATA==0);
while(DHT11_DATA==1);

for(i=0;i<40;i++)
	readings[i]=DHT11_Read_Bit();

while(DHT11_DATA==0);

for(i=0,(*Humidity)=0;i<8;i++)
	{
	(*Humidity)*=2;
	(*Humidity)+=readings[i];
	}
for(i=0,(*Temperature)=0;i<8;i++)
	{
	(*Temperature)*=2;
	(*Temperature)+=readings[i+16];
	}
}


