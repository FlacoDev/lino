#define trigPin_front 0
#define echoPin_front 1
#define trigPin_left  2
#define echoPin_left  3
#define trigPin_right 4
#define echoPin_right 5

#define rightMotor 10
#define leftMotor  9

//directions
#define FORWARD 1
#define RIGHT   2
#define LEFT    3

long durationF, durationL, durationR,  distanceF, distanceL, distanceR;

void setup()
{
  pinMode(trigPin_front, OUTPUT);
  pinMode(echoPin_front, INPUT);
  pinMode(trigPin_left, OUTPUT);
  pinMode(echoPin_left, INPUT);
  pinMode(trigPin_right, OUTPUT);
  pinMode(echoPin_right, INPUT);
  
  pinMode(rightMotor, OUTPUT);
  pinMode(leftMotor, OUTPUT);
}

void go(int direction)
{
  switch(direction)
    {
    case FORWARD:
      digitalWrite(rightMotor, HIGH);
      digitalWrite(leftMotor, HIGH);
      break;
    case RIGHT:
      digitalWrite(leftMotor, LOW);
      digitalWrite(rightMotor, HIGH);
      break;
    case LEFT:
      digitalWrite(rightMotor, LOW);
      digitalWrite(leftMotor, HIGH);
      break;
    }
}

void stop()
{
  digitalWrite(leftMotor, LOW);
  digitalWrite(rightMotor, LOW);
}

void loop()
{
  go(FORWARD);

  digitalWrite(trigPin_front, LOW);
  digitalWrite(trigPin_left, LOW);
  digitalWrite(trigPin_right, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin_front, HIGH);
  digitalWrite(trigPin_left, HIGH);
  digitalWrite(trigPin_right, HIGH);
  delayMicroseconds(10);

  digitalWrite(trigPin_front, LOW);
  digitalWrite(trigPin_left, LOW);
  digitalWrite(trigPin_right, LOW);

  durationF = pulseIn(echoPin_front, HIGH, 1000000);
  durationL = pulseIn(echoPin_left, HIGH, 1000000);
  durationR = pulseIn(echoPin_right, HIGH, 1000000);
 
  distanceF = (durationF/58.2);
  distanceL = (durationL/58.2);
  distanceR = (durationR/58.2);

  if(distanceF < 10 || distanceL < 10 || distanceR < 10)
    {
      stop();
    }
    
    delay(50);
}