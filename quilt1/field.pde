class Field {
  Field(){
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
  }
  
  void display(){
    int counter = 0;

    fill(foreColor);
    noStroke();
    
    textFont(genFont);
    textSize(pgTextSize);
    textAlign(CENTER);
    
    push();
      translate(-(xCount - 1) * xSpace/2, -(yCount - 1) * ySpace/2);
      for(int m = 0; m < yCount; m++){
        for(int n = 0; n < xCount; n++){
          float x = n * xSpace;
          float y = m * ySpace;
  
          push();
            translate(x, y);
            translate(0, pgTextSize * 0.7/2);
            
            text(coreString.charAt(counter%coreString.length()), 0, 0);
          pop();
          
          counter ++;
        }
      }
    pop();
  }
}
