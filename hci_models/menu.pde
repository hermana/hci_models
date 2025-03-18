class Menu{

  int numItems;
  int cacheSize;
  ArrayList<Item> items;
  ArrayList<Item> cache;
  char[] menuContentList;
  
  Menu(int num_items, int cache_size){
    this.numItems = num_items;
    this.cacheSize = cache_size;
    this.menuContentList = new char[this.numItems];
    this.items = new ArrayList<Item>();
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

}
