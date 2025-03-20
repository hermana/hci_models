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
    this.cache = new ArrayList<Item>();
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

  void add_to_cache(Item i){
    i.item_height = INITIAL_ITEM_HEIGHT;
    if(this.cache.size() >= this.cacheSize){
      this.cache.remove(this.cacheSize-1);
    }
    this.cache.add(0, i);
  }

  boolean inCache(char t){
    if(this.cache.size()>0){
      for(Item i: this.cache){
        if(i.content == t){
          return true;
        }
      }
    }
    return false;
  }


  float getDistanceFromTopOfCache(char t){
    float distance = 0;
    if(this.cache.size()>0){
      for(Item i: this.cache){
        if(i.content == t){
          return distance;
        }
        distance += i.item_height;
      }
    }
    return distance;
  }

  float getDistanceFromTopOfMenu(char t){
    float distance = 0;
    for(Item i: this.items){
      if(i.content == t){
        return distance;
      }
      distance += i.item_height;
    }
    return distance;
  }

  int get_model_estimate(char t){
    for(Item i: this.items){
      if(i.content == t){
        boolean isInCache = this.inCache(t); 
        // If this item is not in the cache, this will be the height of the cache
        float distanceFromTopOfCache = this.getDistanceFromTopOfCache(t);
        float distanceFromTopOfMenu = this.getDistanceFromTopOfMenu(t);
        int estimate = this.model.get_estimate(isInCache, i.get_expertise(), this.cacheSize, distanceFromTopOfCache, numItems, distanceFromTopOfMenu, i.item_height);   
        if(!isInCache){
          i.add_expertise();
        }
        this.add_to_cache(i);
        return estimate;        
      }
    }
      return -1; //Item not found - shouldn't happen
  }
  
  void scale_menu(char t, float x){
    for(Item i: this.items){
      if(i.content == t){
        i.scale_up(x);
      }else{
        i.scale_down((x/float(this.items.size())-1.0));
      }
    }
  }
  
  float get_item_height(char t){
    for(Item i: this.items){
      if(i.content == t){
        return i.item_height;
      }
    }
    return -1.0;
  }
  
  float get_item_expertise(char t){
    for(Item i: this.items){
      if(i.content == t){
        return i.expertise;
      }
    }
    return -1.0;
  }

}
