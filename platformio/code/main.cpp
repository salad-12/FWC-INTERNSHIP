#include<Arduino.h>//Declaring all variables as integers
int inputAPin = 5;  
 int inputBPin = 6;  
 int xorOutputPin = 8; 
 int inputA = 1;  
 int inputB = 2;  
 int outputY = 9; 

void setup() {
  pinMode(13, OUTPUT);
  pinMode(inputAPin, INPUT);
  pinMode(inputBPin, INPUT);
  pinMode(xorOutputPin, OUTPUT);
  pinMode(inputA, INPUT);
  pinMode(inputB, INPUT);
  pinMode(outputY, OUTPUT);
}

void loop() {
  digitalWrite(13, HIGH);
  delay(1000);
  digitalWrite(13, LOW);
  delay(1000);
  
  int A = digitalRead(inputAPin);
  int B = digitalRead(inputBPin);
  int xorResult = A ^ B;  
  digitalWrite(xorOutputPin, xorResult);  
  delay(100);
  
  int x = digitalRead(inputA);
  int y = digitalRead(inputB);
  int z = x || y;
  digitalWrite(outputY, z);
}
