Condition currentCondition;


void setup() {
  
  currentCondition = new Condition("Starting Condition", 250, 10, 3);
  
  PFont myFont = createFont("Arial", 32, true); 
  textFont(myFont);
  textAlign(CENTER);  
  size(1080, 1080);
}

void draw() {
  background(200);
  noStroke();
}

void mouseClicked() {
 
}
