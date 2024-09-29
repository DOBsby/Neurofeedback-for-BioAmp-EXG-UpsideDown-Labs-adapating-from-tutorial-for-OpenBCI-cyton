//Importing the necessary libs. 1st for USB, others for OSC to NM
import processing.serial.*;
import oscP5.*;
import netP5.*;

// -------------GLOBALS BELOW---------------------------------
//creates an object of class OscP5 listening on port twelveK
//idk what "this" is
OscP5 oscP5 = new OscP5(this,12000);
/*creates an object of class/type NetAdress called myRemoteLocation 
to hold the IP address and port*/
String myOSCaddress = "/EXG";
String myUSBport = "COM7";
int ChosenBaud = 115200;
NetAddress myRemoteLocation;
OscMessage myMessage = new OscMessage(myOSCaddress);
Serial myPort;        // The serial port
float inByte;         // Incoming serial data


boolean newData = false;
// -------------GLOBALS ABOVE---------------------------------

void setup() {
  
  frameRate(99);  //MAX FREQ being used is 30Hz
  myPort = new Serial(this, myUSBport, ChosenBaud);  

  // A serialEvent() is generated when a newline character is received :
  myPort.bufferUntil('\n');
  
  
    
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",4545);  //NM uses 4545
   //<>//
  //noLoop();
}
void draw () {
  if(newData)
  {
      oscP5.send(myMessage, myRemoteLocation); 
      myMessage = new OscMessage(myOSCaddress);  //clear it after it's sent
      newData=false;
  }
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  println(inString);
  if (inString != null) {
    inString = trim(inString);                // trim off whitespaces.
    inByte = float(inString);           // convert to a number.
    //inByte = map(inByte, 0, 1023, 0, height); //map to the screen height.
    myMessage.add(inByte);
    newData = true; 

  }
}
