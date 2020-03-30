PImage phone;
PImage output;
float dannyError = 0.01;

/*
Music Track Names:
QuadTree
ErrorCorrectionError
Dithering Strategy
mapsofmaps
pixelate
Floyd-Steinberg
Langtons Ant
Sound Selfie


*/

void setup() {
  size(1024, 512);
  phone = loadImage("./broken_phone.jpg");
  //phone.filter(GRAY);
  output = createImage(444,444, RGB);
  image(phone, 0, 0);

}
int index(int x, int y) {
  return x +  y * phone.width; 
}

void draw() {
  background(0,0,0);
  dannyError = (dannyError + 0.5 ) % 100;

  //rect(random(100),random(100), 10,10);
  phone.loadPixels();
  output.loadPixels();
  for (int y = 0; y < phone.height-1; y ++) {
     for (int x = 0; x < phone.width-1; x++) {
       color pixel = phone.pixels[index(x,y)];
       color outputPixel = output.pixels[index(x,y)];
      
      // Quantize CurrentPixel
      float oldR = red(pixel) + red(outputPixel);
      float oldG = green(pixel) + green(outputPixel);
      float oldB = blue(pixel) + blue(outputPixel);
      int factor = 2;
      int newR = round(factor * oldR / 255) * (255/factor);
      int newG = round(factor * oldG / 255) * (255/factor);
      int newB = round(factor * oldB / 255) * (255/factor);
      output.pixels[index(x,y)] = color(newR, newG, newB);
      
      
      // Erro diffusion onto neihboring pixels
      float errR = oldR - newR + dannyError;
      float errG = oldG - newG + dannyError;
      float errB = oldB - newB + dannyError;
      
      // Right
      int index = index(x+1, y);
      color c = phone.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      output.pixels[index(x+1, y)] = color(r,g,b);
      
      // Left Down
      index = index(x-1, y+1);
      c = phone.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      output.pixels[index(x-1, y+1)] = color(r, g, b);
      
      // Just Down
      index = index(x, y+1);
      c = phone.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      output.pixels[index(x, y+1)] = color(r, g, b);
      
      
      // Right Down
      index = index(x+1, y+1);
      c = phone.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;
      output.pixels[index(x+1, y+1)] = color(r, g, b);
      
      
      
      
    }
  }
  phone.updatePixels();
  output.updatePixels();
  image(phone, 0,0);
  image(output, 444,0);
  
  
}