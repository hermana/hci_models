class Menu{

  int numItems;
  int cacheSize;
  ArrayList<Item> items;
  ArrayList<Item> cache;
  char[] menuContentList;
  Model model;
  
  Menu(int num_items, int cache_size){
    this.numItems = num_items;
    this.cacheSize = cache_size;
    this.menuContentList = new char[this.numItems];
    this.items = new ArrayList<Item>();
    this.model = new Model();
    this.generateMenuItems();
  }
  
  void generateMenuItems(){
     char menuChar = 'A';
     for(int i=0; i<this.numItems; i++){ 
       this.items.add(new Item(INITIAL_ITEM_HEIGHT, menuChar));
       this.menuContentList[i] = menuChar;
       menuChar++;
     }
  }

  char[] getMenuContentList(){
    return this.menuContentList;
  }

  int get_model_estimate(char t){
    float expertise = 1.0; //FIXME: get expertise
    int distanceFromTopOfCache = 1; //TODO
    int distanceFromTopOfMenu = 1;
    float targetHeight = 1.0; // Get the Item height of Item T
    // int num_menu_items, int distance_from_top_of_menu, float target_height
    return this.model.get_estimate(expertise, this.cacheSize, distanceFromTopOfCache, numItems, distanceFromTopOfMenu, targetHeight);
  }

}
