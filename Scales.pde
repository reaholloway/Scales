
int rows = 8;
int cols = 8;
int mult = 100;  
int off = 50;    
float wid = 50; 
float hgt = 50; 
float inc = 0.8;   
float min = 30;   
float max = 100;    
boolean grow = true;  
float r, g, b, a; 

void mouseClicked() {
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
}

void setup() {
  windowResize(cols * mult, rows * mult);
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  a = 200;
  noStroke();
  ellipseMode(CENTER);
}

void draw() {
  background(145);
  for (int x = 0; x < cols; x++) {    
    for (int y = 0; y < rows; y++) { 
      // scale(x * 50 + off, y * 50 + off);  
      scale(x, y);
    }
  }
incr_size_color();

  if (wid >= max||wid <= min) {  
   if (!grow) {
        r = (int) (Math.random()*256);
        g = (int) (Math.random()*256);
        b = (int) (Math.random()*256);
      }
      grow = !grow;
    }
}

void incr_size_color() {
  if (grow) {     
    wid += inc;
    hgt += inc;
  } else {       
    wid -= inc;
    hgt -= inc;
  }
}

void scale(int x, int y) {
  int tempx = x * mult + off;
  int tempy = y * mult + off;
  fill(r, g, b, a);
  triangle(tempx - wid/2, tempy - hgt/7, tempx + wid/2, tempy - hgt/7, tempx, tempy - hgt);
  ellipse(tempx, tempy, wid, hgt);
}
