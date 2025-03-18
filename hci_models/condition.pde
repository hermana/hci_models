class Condition{

    String name;
    int numTrials;
    int menuSize;
    int menuCacheSize;
    Menu menu;
  
  
    Condition(String condition_name, int num_trials, int menu_size, int menu_cache_size){
    this.name = condition_name;
    this.numTrials = num_trials;
    this.menuSize = menu_size;
    this.menuCacheSize = menu_cache_size;
    this.menu = new Menu(this.menuSize, this.menuCacheSize);
  }
  
}
