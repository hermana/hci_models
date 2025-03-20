class Condition {

    String name;
    int numTrials;
    int menuSize;
    int menuCacheSize;
    float growthFactor;
    Menu menu;
    ArrayList<Trial> trials;
    Distribution distribution;
  
    Condition(String condition_name, int num_trials, int menu_size, int menu_cache_size, float growth_factor, Distribution d){
    this.name = condition_name;
    this.numTrials = num_trials;
    this.menuSize = menu_size;
    this.menuCacheSize = menu_cache_size;
    this.growthFactor = growth_factor;
    this.distribution = d;
    this.menu = new Menu(this.menuSize, this.menuCacheSize);
    this.generateTrials();
  }
  
  void generateTrials(){
    this.trials = new ArrayList<Trial>(numTrials);
    char[] menuContents = this.menu.getMenuContentList();
    switch(this.distribution){
      case A: // random
        for(int i=0; i<this.numTrials; i++){ 
          int c = int(random(this.menuSize));
          this.trials.add(new Trial(menuContents[c]));
        }      
        break;
      case B: // recency rules
        int previous = 0;
        int second_prev = 0;
        int third_prev = 0;
        int newly_added = 0;
        for (int i = 0; i < this.numTrials; i++) {
          if (i > 0 && random(1) < 0.10) {
            this.trials.add(new Trial(menuContents[previous]));
            newly_added = previous;
          } 
          else if (i > 1 && random(1) < 0.06) {
            this.trials.add(new Trial(menuContents[second_prev]));
            newly_added = second_prev;
          } 
          else if (i > 2 && random(1) < 0.04) {
            this.trials.add(new Trial(menuContents[third_prev]));
            newly_added = third_prev;
          } 
          else {
             int c = int(random(this.menuSize));
             this.trials.add(new Trial(menuContents[c]));
             newly_added = c;
          }
          third_prev = second_prev;
          second_prev = previous;
          previous = newly_added;
         }
        break;
      case C: //semi-zipfian
          float P = 40; // P = 40%, arbitrarily chosen
          for (int i = 0; i < this.numTrials; i++) {
            if (i % 10 == 0) { // 10th item is random
             int c = int(random(this.menuSize));
             this.trials.add(new Trial(menuContents[c]));
            } else {
              float r = random(100); 
              float cumulative_probability = 0;
              for (int rank = 1; rank <= this.menuSize; rank++) {
                cumulative_probability += P / rank; 
                if (r < cumulative_probability) {
                  this.trials.add(new Trial(menuContents[rank-1]));
                  break;
                }
              }
            }
          }
        break;
      default:
        break;
    }
  }
  
  void doTrials(){
    for(Trial t: this.trials){
      // use the model to get the estimated time for each trial
      t.predictedTime = this.menu.get_model_estimate(t.target); //the estimate in seconds
      this.menu.scale_menu(t.target, this.growthFactor);
    }
  }
  
}
