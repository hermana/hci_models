class Trial {

  float predictedTime; //in seconds
  char target;
  
  Trial(char t){
    this.predictedTime = 0;
    this.target = t;
  }
  
  void setPredictedTime(float time){
    this.predictedTime = time;
  }
}
