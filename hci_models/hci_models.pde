enum State{
  START_CONDITION, 
  TRIAL, 
  END_CONDITION
}

enum Distribution{
 A, // random
 B, //recency rules
 C  // zipfian
}


ArrayList<Condition> conditions = new ArrayList<Condition>();
Condition currentCondition;
int conditionIndex;
State state;

Table results;
String RESULTS_FILENAME = "./results.csv";

void setup() {
  
  conditions.add(new Condition("Condition One", 50, 10, 3, 0.5, Distribution.A));
  //conditions.add(new Condition("Condition Two", 5, 5, 2, 0.1, Distribution.B));
  //conditions.add(new Condition("Condition Three", 5, 5, 2, 0.1, Distribution.C));
  
  conditionIndex = 0;
  currentCondition = conditions.get(conditionIndex);
  
  state = State.START_CONDITION;
  PFont myFont = createFont("Arial", 32, true); 
  textFont(myFont);
  textAlign(CENTER);  
  size(100, 100);
  
  results = new Table();
  results.addColumn("Condition Name");
  results.addColumn("Target Distribution");
  results.addColumn("Trial target");
  results.addColumn("Target size");
  results.addColumn("Item expertise");
  results.addColumn("Predicted Time");

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
     currentCondition.doTrials(results);
     state = State.END_CONDITION;
     break;
   case END_CONDITION:
     println("Finished condition " + currentCondition.name);
     conditionIndex += 1;
     if(conditionIndex >= conditions.size()){
       println("The experiment has ended.");
       saveTable(results, RESULTS_FILENAME, "csv");  
       exit();
     }else{
       currentCondition = conditions.get(conditionIndex);
       state = State.START_CONDITION;
     }
     break;
  }
}
