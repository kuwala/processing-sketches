import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ProcessingTest extends PApplet {

public void setup() {
  frameRate(10);
}

public void draw() {
  background(0,0,0);
  rect(random(100),random(100),random(100),random(100));
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ProcessingTest" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
