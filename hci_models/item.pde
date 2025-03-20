float INITIAL_ITEM_HEIGHT = 1.0;
float LEARNING_RATE = 0.2;

float MAX_ITEM_HEIGHT = 10.0;
float MIN_ITEM_HEIGHT = 0.1;

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
  
  void scale_up(float x){
    float upscaled_size = this.item_height+(this.item_height*x);
    this.item_height = upscaled_size > MAX_ITEM_HEIGHT ? MAX_ITEM_HEIGHT : upscaled_size;
  }
  
  void scale_down(float x){
    float downscaled_size = this.item_height - (this.item_height*x);
    this.item_height = downscaled_size < MIN_ITEM_HEIGHT ? MIN_ITEM_HEIGHT : downscaled_size;
  }
  
}
