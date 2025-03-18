class Condition {

    String name;
    int numTrials;
    int menuSize;
    int menuCacheSize;
    Menu menu;
    ArrayList<Trial> trials;
  
    Condition(String condition_name, int num_trials, int menu_size, int menu_cache_size){
    this.name = condition_name;
    this.numTrials = num_trials;
    this.menuSize = menu_size;
    this.menuCacheSize = menu_cache_size;
    this.menu = new Menu(this.menuSize, this.menuCacheSize);
    this.generateTrials();
  }
  
  void generateTrials(){
    this.trials = new ArrayList<Trial>(numTrials);
    char[] menuContents = this.menu.getMenuContentList();
    for(int i=0; i<this.numTrials; i++){ 
      int c = int(random(this.menuSize));
      this.trials.add(new Trial(menuContents[c]));
    }
  }
  
  void doTrials(){
    for(Trial t: this.trials){
      // use the model to get the estimated time for each trial
      t.predictedTime = this.menu.get_model_estimate(t.target); //the estimate in seconds
    }
  }
  
}
