
#include "MsTimer2.h"


const int Refresh_UARTInterval = 2000;  // 2000 Milli-seconds


byte u08Counter = 0;


void Refresh_UART ()
{
    u08Counter = u08Counter + 1;

    if ((u08Counter % 3) == 0)
    {
        Serial.write (0x01);
    }
    else if ((u08Counter % 6) == 0)
    {
        Serial.write (0x02);
    }
    else if ((u08Counter % 9) == 0)
    {
        Serial.write (0x03);
    }//
}//


void setup ()
{
    MsTimer2::set (Refresh_UARTInterval, Refresh_UART);
    MsTimer2::start ();

    Serial.begin (9600);
}//


void loop ()
{
  // Do nothing
}//

