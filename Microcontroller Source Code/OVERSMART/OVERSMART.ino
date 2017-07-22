/*
MySQL table
CREATE TABLE skp_test.iot_sensor (
Num integer primary key auto_increment,
TEMPRATURE  float,
HUMIDITY  float,
OBSTACLEcm float,
CH4ppm float,
RatioCH4 float,
RawValueCH4 float,
COppm float,
RatioCO float,
RawValueCO float,
MotionAxisX float,
MotionAxisY float,
MotionAxisZ float,
Emergency float,
recorded timestamp
);



CREATE TABLE skp_test.iot_update (
Num integer primary key auto_increment,
Username char(40),
TEMPRATURE  float,
HUMIDITY  float,
OBSTACLEcm float,
CH4ppm float,
RatioCH4 float,
RawValueCH4 float,
COppm float,
RatioCO float,
RawValueCO float,
MotionAxisX float,
MotionAxisY float,
MotionAxisZ float,
Emergency float,
recorded timestamp
);

 */




//espconnection declaration
#include <ESP8266WiFi.h> 
#include <WiFiClient.h>
#include <MySQL_Connection.h> 
#include <MySQL_Cursor.h>



IPAddress server_addr(192,168,43,8); // IP of the MySQL server here
char user[] = "sarath"; // MySQL user login username
char password[] = "12345678"; // MySQL user login password

// WiFi card example
char ssid[] = "SAR"; // your SSID
char pass[] = "12345678"; // your SSID Password

const IPAddress ipadd(192,168,43,9);     //-------these 3 require-------------- 
const IPAddress ipgat(192,168,43,1);       //--32 more bytes than const uint8_t--
const IPAddress ipsub(255,255,255,0);     //------------------------------------

//*************************************************************************************************
char INSERT_DATA[] ="INSERT INTO skp_test.iot_sensor  (TEMPRATURE,HUMIDITY ,OBSTACLEcm,CH4ppm,RatioCH4 ,RawValueCH4,COppm,RatioCO,RawValueCO,MotionAxisX,MotionAxisY,MotionAxisZ,Emergency) VALUES ('%s',%s,'%s',%s,'%s',%s,'%s',%s,'%s',%s,'%s','%s','%s')";
char INSERT_UPDATE[]="UPDATE skp_test.iot_update SET Username='%s',TEMPRATURE='%s',HUMIDITY='%s',OBSTACLEcm= '%s',CH4ppm='%s',RatioCH4='%s',RawValueCH4='%s',COppm='%s',RatioCO='%s',RawValueCO='%s',MotionAxisX= '%s',MotionAxisY= '%s',MotionAxisZ= '%s',Emergency='%s'  WHERE Num=1";

char query[128];
char query1[128];

char temperature[10];
char humidity[10];
float Soundsense[10];
char ultra[10];
char CH4[10];
char ratioCH4[10];
char rawValCH4[10];
char CO[10];
char ratioCO[10];
char rawValCO[10];
char MotionX[10];
char MotionY[10];
char MotionZ[10];
char emg[10];
//************************************************************************************************
// Notice the "%lu" - that's a placeholder for the parameter we will
// supply. See sprintf() documentation for more formatting specifier
// options
const char querysl_POP[] = "SELECT num FROM vibration_test.level WHERE value > %lu;";
char querysl[128];



//*************************************************************************************************
WiFiClient client;
MySQL_Connection conn((Client *)&client);

//**************************************************************************************************
  //gas sensor mq4
  int sensorValue_CH4;
  float sensor_volt;
  float RS_gas; // Get value of RS in a GAS
  float ratio; // Get ratio RS_GAS/RS_air MQ4
  
  //gas sensor mq7
  int sensorValue_mq7;
  float sensor_volt_mq7;
  float RS_gas_mq7; // Get value of RS in a GAS
  float ratio_mq7; // Get ratio_mq7 RS_gas_mq7/RS_air

//ultrasonic sensor declarations
/*
********************************************
14CORE ULTRASONIC DISTANCE SENSOR CODE TEST
********************************************
*/
#define TRIGGER 3
#define ECHO    16



//sound sensor declatation

int pushButton = 4;
String SoundVal;
 

//emergency read
int emergency;


//declaration for temprture and  humidity sensor
#include <dht.h>
#define dht_apin 5 // Analog Pin sensor is connected to
dht DHT;


//ADXL335 declaration
const int xPin = 5;
const int yPin = 6;
const int zPin = 7; 
float acrossX;
float acrossY;
float acrossZ;

///mux

int pin_Out_S0 = 12;
int pin_Out_S1 = 13;
int pin_Out_S2 = 14;
int pin_In_Mux1 = A0;
int Mux1_State[8] = {0};

void setup() {
//**************************************************************************************
Serial.begin(115200);

// Begin WiFi section
WiFi.begin(ssid, pass);
WiFi.config(ipadd, ipgat, ipsub);
// Wait for connection
while ( WiFi.status() != WL_CONNECTED ) {
delay ( 20 );
Serial.print ( "." );
}
Serial.println ( "" );
Serial.print ( "Connected to " );
Serial.println ( ssid );
Serial.print ( "IP address: " );
Serial.println ( WiFi.localIP() );
// End WiFi section
Serial.println("DB - Connecting...");
while (conn.connect(server_addr, 3306, user, password) != true) {
delay(20);
Serial.print ( "." );


}

//**************************************************************************************

  
  pinMode(pin_Out_S0, OUTPUT);
  pinMode(pin_Out_S1, OUTPUT);
  pinMode(pin_Out_S2, OUTPUT);
  //pinMode(pin_In_Mux1, INPUT);
 
//  pinMode(blinkPin,OUTPUT);         // pin that will blink to your heartbeat!

  

 // make the pushbutton's pin an input and 16 as output for sound sensor
  pinMode(pushButton, INPUT);
  //pinMode(0,OUTPUT); //for sound sensor and ultrasonic sensor


  //gas sensor sensor declaratio
   pinMode(0,OUTPUT);

   //ultrasonic setup
     pinMode(TRIGGER, OUTPUT);
     pinMode(ECHO, INPUT);

//emergency press setup
pinMode(15,INPUT);
 
  
   // pinMode(0,OUTPUT);
  
}

void loop() {
  //**************************************************************
//temprature sensor declataions digital
//Start of Program 
 
  DHT.read11(dht_apin);
 

 
    Serial.print("Current humidity = ");
 
    Serial.print(DHT.humidity);
 
    Serial.print("%  ");

 if(DHT.humidity>48)
 {
  
  digitalWrite(0,HIGH);
  
  }
    else
    {
       digitalWrite(0,LOW);
      
      }
      
    Serial.print("temperature = ");
 
    Serial.print(DHT.temperature); 
 
    Serial.println("C  ");

    if(DHT.temperature>30)
    {
      
      digitalWrite(0,HIGH);
      
      }
      else
    {
       digitalWrite(0,LOW);
      
      }
    
    Serial.print("\n");

    //delay(30);

//****************************************************************    
 long duration, distance;
  digitalWrite(TRIGGER, LOW);  
  delayMicroseconds(20); 
  
  digitalWrite(TRIGGER, HIGH);
  delayMicroseconds(10); 
  
  digitalWrite(TRIGGER, LOW);
  duration = pulseIn(ECHO, HIGH);
  distance = (duration/2) / 29.1;
  if(distance<10)
  {
    digitalWrite(0,HIGH);
    //delay(1000);
    
    }
    else
    {
       digitalWrite(0,LOW);
      
      }
  
 
  Serial.print("Centimeter:");
   Serial.println(distance);
  //delay(1000);


//**************************************************************************



//sound sensor declaration

 // read the input pin:
  int buttonState = digitalRead(pushButton);
  // print out the state of the button:
  //Serial.println(buttonState);
  if(buttonState==LOW)
  {
    
    digitalWrite(0,HIGH);
    
   // delay(5000);
    SoundVal=String ("LOUD"); 
  
    
    }
else
{
  Serial.println("NORMAL SOUND");
  SoundVal=String ("NORMAL SOUND");
   
  }



//*****************************************************************************

emergency=digitalRead(15);
if(emergency==HIGH)
{
  Serial.println("Emergency");
  Serial.println(emergency);
   digitalWrite(0,HIGH);
  }
//****************************************************************************  
  updateMux1();
  for(int i = 0; i < 8; i ++) {
   if(i==0)
   {
    
  
 sensorValue_CH4 = Mux1_State[i];
    sensor_volt=(float)sensorValue_CH4/1024*5.0;
    RS_gas = (5.0-sensor_volt)/sensor_volt; // omit *RL

    //Replace the name "R0" with the value of R0 in the demo of First Test 
    ratio = RS_gas/3.60;  // ratio = RS/R0
 
    if(sensorValue_CH4>250)
    {
      
      digitalWrite(0,HIGH);
      }
    Serial.print("sensorValue = ");
     Serial.println(sensorValue_CH4);
    Serial.print("sensor_volt = ");
    Serial.println(sensor_volt);
    Serial.print("RS_ratio = ");
    Serial.println(RS_gas);
    Serial.print("Rs/R0 = ");
    Serial.println(ratio);
    Serial.print ( "CH4 ppm :");
    Serial.println(get_CH4(ratio));
    
    Serial.print("\n");
    //delay(30);
  
    
 

    }
    
    else if(i==1)
    {
   
   

    sensorValue_mq7 = Mux1_State[i];
    sensor_volt_mq7=(float)sensorValue_mq7/1024*5.0;
    RS_gas_mq7 = (5.0-sensor_volt_mq7)/sensor_volt_mq7; // omit *RL

    //-Replace the name "R0" with the value of R0 in the demo of First Test 
    ratio_mq7 = RS_gas_mq7/0.11;  // ratio_mq7 = RS/R0
    
    if(sensorValue_mq7>300)
    {
      
      digitalWrite(0,HIGH);
      }
    Serial.print("sensorValue_mq7 = ");
     Serial.println(sensorValue_mq7);
    Serial.print("sensor_volt_mq7 = ");
    Serial.println(sensor_volt_mq7);
    Serial.print("RS_ratio_mq7 = ");
    Serial.println(RS_gas_mq7);
    Serial.print("Rs/R0 = ");
    Serial.println(ratio_mq7);
    Serial.print ( "CO ppm :");
    Serial.println(get_CO(ratio_mq7));
    
    Serial.print("\n");
     //delay(30);
  
   }
   /*
else if(i==2)
   {

 
   
        
    }
    
 else if(i==3)
    {

 

          
          
     }
 else if(i==4)
      {
           
      }
      */
 else if(i==5)
 {    
            Serial.print("Motion X-axis= ");
     acrossX= ((Mux1_State[i])-507);
     Serial.print(acrossX);
     Serial.println("\t");               
      Serial.print("\n");   
       //delay(30);   
                  
  }
  else if(i==6)
  {
          Serial.print("Motion Y-axis= ");
          acrossY= ((Mux1_State[i])-512);
          Serial.print(acrossY);
          Serial.println("\t");
          Serial.print("\n");  
       //delay(30);       
         
   }
 else if(i==7)
  {   

          Serial.print("Motion Z-axis= "); 
          acrossZ= ((Mux1_State[i])-615);
          Serial.print(acrossZ);
          Serial.println("\t");
          Serial.print("\n");  
         //delay(30); 
                       
    }
         
                  
  }
//***********************************MySQL***********************INSERT AND SELECT**********

Serial.println("Recording data.");



    // Initiate the query class instance
    MySQL_Cursor *cur_mmm = new MySQL_Cursor(&conn);
    // Save
    dtostrf(DHT.temperature, 1, 1, temperature);
    dtostrf(DHT.humidity, 1, 1, humidity);
    dtostrf(distance, 1, 1, ultra);
    dtostrf(get_CH4(ratio), 1, 1, CH4);
    dtostrf(ratio, 1, 1, ratioCH4);
    dtostrf(sensorValue_CH4, 1, 1, rawValCH4);
    dtostrf(get_CO(ratio_mq7), 1, 1, CO);
    dtostrf(ratio_mq7, 1, 1, ratioCO);
    dtostrf(sensorValue_mq7, 1, 1, rawValCO);
    dtostrf(acrossX, 1, 1, MotionX);
    dtostrf(acrossY, 1, 1, MotionY);
    dtostrf(acrossZ, 1, 1, MotionZ);
    dtostrf(emergency, 1, 1,emg);
  
    sprintf(query, INSERT_DATA,temperature,humidity,ultra,CH4,ratioCH4,rawValCH4,CO, ratioCO,rawValCO,MotionX, MotionY,MotionZ, emg);
    
    // Execute the query
    cur_mmm->execute(query);
    // Note: since there are no results, we do not need to read any data
    // Deleting the cursor also frees up memory used
    delete cur_mmm;

 // Initiate the query class instance
    MySQL_Cursor *cur_up = new MySQL_Cursor(&conn);
    //Quary to update
     sprintf(query1, INSERT_UPDATE,"Sarathkumar",temperature,humidity,ultra,CH4,ratioCH4,rawValCH4,CO, ratioCO,rawValCO,MotionX, MotionY,MotionZ, emg);

       // Execute the query
    cur_up->execute(query1);
    // Note: since there are no results, we do not need to read any data
    // Deleting the cursor also frees up memory used
    delete cur_up;

    //****************************************************************************************************************
Serial.println("> Running SELECT with dynamically supplied parameter");

  // Initiate the queryslslslsl class instance
  MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
  // Supply the parameter for the queryslslslsl
  // Here we use the queryslslslsl_POP as the format string and queryslslslsl as the
  // destination. This uses twice the memory so another option would be
  // to allocate one buffer for all formatted queries or allocate the
  // memory as needed (just make sure you allocate enough memory and
  // free it when you're done!).
  sprintf(querysl, querysl_POP, 220);
  // Execute the queryslslslsl
  cur_mem->execute(querysl);
  // Fetch the columns and print them
  column_names *cols = cur_mem->get_columns();

   Serial.println();
   // Read the rows and print them
   row_values *row = NULL;
  do {
    row = cur_mem->get_next_row();
    if (row != NULL)
    {

    Serial.println("not a null");
    digitalWrite(0,HIGH);
    delay(1000);
    digitalWrite(0,LOW);
    digitalWrite(0,HIGH);
    digitalWrite(0,LOW);
    digitalWrite(0,HIGH);
    digitalWrite(0,LOW);
    digitalWrite(0,HIGH);
    digitalWrite(0,LOW);
    digitalWrite(0,HIGH);
    
    
    }
    else
    {
      Serial.println("is a null");
       digitalWrite(0,LOW);
      
      }
    
  } while (row != NULL);
  // Deleting the cursor also frees up memory used
  delete cur_mem;



   //******************************************************************************************************************
  
}





// get CHH4 ppm
float get_CH4 (float ratio){
  float ppm = 0.0;
  ppm = 10 * pow (ratio, -3.178);
return ppm;
}


// get CO ppm
float get_CO (float ratio_mq7){
  float ppm = 0.0;
 ppm = 37143 * pow (ratio_mq7, -3.178);
return ppm;
}







void updateMux1 () {
  for (int i = 0; i < 8; i++){
    digitalWrite(pin_Out_S0, HIGH && (i & B00000001));
    digitalWrite(pin_Out_S1, HIGH && (i & B00000010));
    digitalWrite(pin_Out_S2, HIGH && (i & B00000100));
    Mux1_State[i] = analogRead(pin_In_Mux1);
  }
}

