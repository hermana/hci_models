enum State{
  START_CONDITION, 
  TRIAL, 
  END_CONDITION
}

//TODO
// Heights of items should scale
// 250 trials as specified in the instructions
// Distributions A, B, and C
// should predicted times be floats?
// save the results to CSV file. 

ArrayList<Condition> conditions = new ArrayList<Condition>();
Condition currentCondition;
int conditionIndex;
State state;

void setup() {
  
  // FIXME: fractional amounts for height + it's not actually 250 trials, see instructions
  conditions.add(new Condition("Condition One", 5, 10, 3, 0.5));
  conditions.add(new Condition("Condition Two", 5, 5, 2, 0.1));
  
  conditionIndex = 0;
  currentCondition = conditions.get(conditionIndex);
  
  state = State.START_CONDITION;
  PFont myFont = createFont("Arial", 32, true); 
  textFont(myFont);
  textAlign(CENTER);  
  size(100, 100);
}

void draw() {
  background(200);
  noStroke();
  switch(state){
   case START_CONDITION:
    println("Starting condition " + currentCondition.name);
    state = State.TRIAL;
    break;
   case TRIAL:
     currentCondition.doTrials();
     state = State.END_CONDITION;
     break;
   case END_CONDITION:
     println("Finished condition " + currentCondition.name);
     conditionIndex += 1;
     if(conditionIndex >= conditions.size()){
       println("The experiment has ended.");
       exit();
     }else{
       currentCondition = conditions.get(conditionIndex);
       state = State.START_CONDITION;
     }
     break;
  }
}
