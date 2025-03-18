Condition currentCondition;


void setup() {
  
  // FIXME: fractional amounts for height + it's not actually 250 trials, see instructions
  currentCondition = new Condition("Starting Condition", 5, 10, 3);
  
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
