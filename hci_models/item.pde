float INITIAL_ITEM_HEIGHT = 1.0;
float LEARNING_RATE = 0.2;

class Item {
  
  float item_height;
  char content;
  float expertise;
  
  Item(float h, char c){
    this.item_height = h;
    this.content = c;
    this.expertise = 0; // range from 0 to 1
  }
  
  float get_expertise(){
    return this.expertise;
  }
  
  void add_expertise(){
    this.expertise = this.expertise + LEARNING_RATE > 1.0 ? 1.0 : this.expertise + LEARNING_RATE;
  }
  
}
