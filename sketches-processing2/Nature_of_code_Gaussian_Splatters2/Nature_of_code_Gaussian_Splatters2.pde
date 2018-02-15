void setup() {
  size(800,600);
  background(0,12,25);
  //background(240,240,255);
  noStroke();
  //frameRate(2);
  //fill(color(random(255),random(255),random(255),255));
  fill(color(0,0,0,40));
}


float standDist = 80;
float diam = 10;
float xScale = 10;
float maxDiam = 80;
float minDiam = 1;


/*
struct product {
  int weight;
  double price;
} ;

/*
struct droplet {
  float x;
  float y;
  float d;
  color c;
};

void getDrop() {
  droplet drop;
  float n = randomGaussian();
  float m = randomGaussian();
  
  float mag = sqrt(n*n + m*m);
  float newMag = 20;
  if (mag > 0) {
    newDiam = map(mag,0,1,maxDiam,minDiam);
    //fill(color(0,255,0));
  } 

  
  
  drop.x = width/2 + n * standDist;
  drop.y = height/2 + m * standDist;
  drop.d = newDiaml
  drop.c = color( random(255), random(255), random(255), random(180,255) );
  //return drop;
}*/

int randAlpha() {
  return round(random(180,255)); 
}
int R_MASK = 255<<16;
int G_MASK = 255<<8;
int B_MASK = 255;
int A_MASK = 255<<24;


color getColorFromInt(int i) {
  
  int r = i & R_MASK;
  int g = i & G_MASK;
  int b = i & B_MASK;
  
  return (color(r,g,b,randAlpha()));
}


int count = 0;
void draw() {
  
  
  float n = randomGaussian();
  float m = randomGaussian();
  /*
  print (n);
  print( "  ");
  println (m);
  */
  float mag = sqrt(n*n + m*m);
  //println (mag);
  float newDiam = 30;
  int intColor = 0;
  
  if (m <= 0) {
    newDiam = map(m,-1,0,10,maxDiam);  
    //fill(color(255,0,0));
  }  
  if (mag > 0) {
    newDiam = map(mag,0,2,maxDiam,minDiam);
    //fill(color(0,255,0));
    intColor = (int)map(mag,0,4,0,1231);
    
  } 
  fill (getColorFromInt(intColor));
  
  float x = width/2 + n * standDist;
  float y = height/2 + m * standDist;

  //fill(color(random(255),random(255),random(255),255));
  
  //Draws the Circle
  //fill(color(random(255),random(255),random(255),random(180,255)));
  ellipse(x,y,newDiam,newDiam);
  
  //count ++;
  if (count > 80) {
    background(255);
    count = 0;
    fill(color(random(255),random(255),random(255),255));
    
    for(int i = 0; i < 20; i ++) {
      
    }
  }
  
  
  
}
