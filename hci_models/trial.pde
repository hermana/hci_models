class Trial {

  int predictedTime; //in seconds
  char target;
  
  Trial(char t){
    this.predictedTime = 0;
    this.target = t;
  }
  
  void setPredictedTime(int time){
    this.predictedTime = time;
  }
}
