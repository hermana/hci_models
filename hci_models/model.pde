class Model{

  //constants
  float A = 0.37;
  float B = 0.13;
  float C = 0.3;
  float D = 0.08;
  float F = 0.24;
  float H = 0.08;
 
  Model(){
    //"static" class used for calculation
  }
  
  float _time_cache_visual_search(int cache_size){
    return this.C + this.D*cache_size;
  }
  
  float _time_cache_pointing(float distance_from_top_of_cache){
     return this.A + this.B*(float)(Math.log((distance_from_top_of_cache/INITIAL_ITEM_HEIGHT)+1) / Math.log(2));
  }

  float _time_for_cache(int cacheSize, float distance_from_top_of_cache){
    return this._time_cache_visual_search(cacheSize) + this._time_cache_pointing(distance_from_top_of_cache);
  }
  
  float _time_menu_visual_search(int num_menu_items){
    return this.C + this.D*num_menu_items;
  }
  
  float _time_retrieval(int num_menu_items){
     return this.F + this.H*(float)(Math.log(num_menu_items+1.0)/Math.log(2));
  }
  
  float _time_menu_pointing(float distance_from_top_of_cache, float distance_from_top_of_top_of_menu, float target_height){
    return this.A + this.B*(float)(Math.log(((distance_from_top_of_cache+distance_from_top_of_top_of_menu)/target_height)+1) / Math.log(2));
  }
  
  float _time_for_menu(float expertise, int num_menu_items, float distance_from_top_of_cache, float distance_from_top_of_menu, float target_height){
    return ((1-expertise)*this._time_menu_visual_search(num_menu_items)) + (expertise*this._time_retrieval(num_menu_items)) + this._time_menu_pointing(distance_from_top_of_cache, distance_from_top_of_menu, target_height);
  }
  
  float get_estimate(boolean isInCache, float expertise, int cache_size, float distance_from_top_of_cache, int num_menu_items, float distance_from_top_of_menu, float target_height){
    if(isInCache){
      return this._time_for_cache(cache_size, distance_from_top_of_cache);
    }else{
      return this._time_for_cache(cache_size, distance_from_top_of_cache) + this._time_for_menu(expertise, num_menu_items, distance_from_top_of_menu, distance_from_top_of_cache, target_height);
    }  
  }

}
