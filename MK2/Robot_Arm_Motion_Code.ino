#include <Servo.h>

// Create servo objects
Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

// Initial positions of the servos
int pos1 = 0;
int pos2 = 0;

void setup() {
  Serial.begin(9600);

  // Attach the servos to their respective pins
  servo1.attach(10);
  servo2.attach(12);
  servo3.attach(11);
  servo4.attach(8);
  servo5.attach(9);

  Serial.println("done attaching");

  delay(3000);

  Serial.println("done delay");

  servo3.write(90);
  Serial.println("S1 Ready");
  servo2.write(120);
  Serial.println("S1 Done");
  delay(3000);
 



  delay(2500);
  



  
  
  
  // Set initial positions
  //servo1.write(90);
  Serial.println("test");

  delay(50);
  //servo2.write(140);
  //servo3.write(40);

  //delay(5000);
  
  
  
}

void loop() {
  // Move each servo 10 degrees
  //pos1 = (pos1 + 10) % 180; // Ensure position stays within 0-179 degrees
  //pos2 = (pos2 + 10) % 180; // Ensure position stays within 0-179 degrees
  
  // Write new positions to the servos
  //servo1.write(180);
  //delay(1000);
  //servo2.write(120);
  
  // Wait for the servo to reach the position
  //delay(50000); // Adjust delay as needed
}
