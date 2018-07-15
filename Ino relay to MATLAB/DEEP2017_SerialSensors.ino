int trigPin = 9;
int echoPin = 10;
int irPin = A1;

int ultraValue = 0;
int irValue = 0;
long duration;
int distance;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT);
//  Serial.println("Initialized!");
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available())
  {
    char key = Serial.read();
    if(key == 'r')
    {
      irValue = analogRead(irPin);
      Serial.print("IR: ");
      Serial.println(irValue);
    }
    else if(key == 'u')
    {
      digitalWrite(trigPin, LOW);
      delayMicroseconds(2);
      digitalWrite(trigPin, HIGH);
      delayMicroseconds(10);
      digitalWrite(trigPin, LOW);
      duration = pulseIn(echoPin, HIGH);
      distance= duration*0.034/2;
      Serial.print("Ultrasound: ");
      Serial.println(distance);
    }
  }
}
