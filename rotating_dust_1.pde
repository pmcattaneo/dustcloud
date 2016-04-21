// overall rotation
float angle;

// particle size
int size = 3;

// dust count
int limit = 1000;

// array for all dust
Particle[] dust = new Particle[limit];

void setup() {
  size(1600, 900, P3D);
  background(0);
  noStroke();
  smooth();
  
  // Instantiate dust, with random vals for size and pos
  for (int i = 0; i < dust.length; i++){
    dust[i] = new Particle(int(random(-400, 400)), int(random(-400, 400)),
                            int(random(0, size)), int(random(0, size)));
  }
}

void draw() {
  background(0);
  fill(#FCF503, 250);
  
  // Lights
  pointLight(0, 65, 255, 65, 60, 100);
  pointLight(255, 0, 213, -65, -60, -150);
  
  
  // center geometry
  // make the third argument: -200 + mouseX * 0.65
  translate(width/2, height/2, 0);
  
  // Rotate around y and x axes
  rotateY(radians(angle));
  rotateX(radians(angle));
  
  // Draw dust
  for (int i = 0; i < dust.length; i++){
    dust[i].drawParticle();
  }
  
  // Used in rotate function calls above (start with 0.2)
  angle += 0.2;
  
  
}



class Particle {
  
  // Properties
  int x, y, dw, dh;
  
  // Construction
  Particle(int x, int y, int dw, int dh){
    this.x = x;
    this.y = y;
    this.dw = dw;
    this.dh = dw;
  }
  
  
  // Main drawing method
  void drawParticle() {
    /*
    Here I'm going to set up points, which will fade over time like dust
    */
    ellipse(x, y, dw, dh);
    
    endShape();
    
    
    rotateY(radians(1));
    rotateX(radians(1));
    rotateZ(radians(1));
    
  }
}
    
    