
int cryingX=0;
int cryingY=0;
int guyX=50;
int guyY=450;
float velocity=0;
float gravity = 2.5;
PImage person;
PImage background;
float spikeX[];
float spikeY[];
PImage spike;
int numSpikes=4;
PImage crying;
float score=0;
float point=1;
int start;



void setup()

{

  background(255, 255, 255);
  size(500, 500);

  person=loadImage("person.png");
  spike=loadImage("spike.jpg");
  crying=loadImage ("crying.jpg");
  
  start=millis();
  

  spikeX = new float [numSpikes];
  spikeY = new float [numSpikes];

  for (int i=0; i<numSpikes; i++)
  {
    spikeY[i]=450;
    spikeX[i]=(float) random(width, 1500);
  }
}

void draw()

{
  background(255, 255, 255);
  fill(0);
  exist();
  move();

  for (int i=0; i<numSpikes; i++)
  {
    image(spike, spikeX[i], spikeY[i], 50, 50);
    spikeX[i]=spikeX[i]-5;
    if (spikeX[i]<-5)
    {
      spikeX[i]=800;
    }
    float D=dist(guyX, guyY, spikeX[i], spikeY[i]);

    if (D<35)
    {
      background(0);
      noLoop();
      guyY=1000;

      spikeY[i]=1000;
      image(crying, cryingX, cryingY, 500, 500);
    }
    if (spikeX[i]<0) {

      score=score+point;
    }
    fill(18,252,90);
    textSize(30);
    text("score " +score, 350, 100);
  }

  int timer= millis()-start;
  text(((int)timer/1000), 40, 100);

  if (timer>30000)
  {
    background(0);
    fill(255, 255, 255);
    text("Time UP", width/2, 400);

    fill(255, 255, 255);
    text((int)score, width/2, 500);
  }
}



void exist()
{
  image(person, guyX, guyY, 50, 50);
}

void jump()
{
  if (guyY == 450)
  {
    velocity=-30;
  }
}

void move()
{
  guyY += velocity;
  velocity += gravity;
  guyY= constrain(guyY, 0, 450);
}


void keyPressed()

{

  if ( key == ' ')
  {
    jump();
  }
}
