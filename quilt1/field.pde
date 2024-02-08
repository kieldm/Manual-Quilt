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
  
          float xWaverPre = sinEngine(n - 1, xWaveOffset, xWaveSpeed, 1) * waveSize;  
          float xWaver = sinEngine(n, xWaveOffset, xWaveSpeed, 1) * waveSize;
          float xWaverPost = sinEngine(n + 1, xWaveOffset, xWaveSpeed, 1) * waveSize;  
        
          float yWaverPre = sinEngine(m - 1, yWaveOffset, yWaveSpeed, 1) * waveSize;
          float yWaver = sinEngine(m, yWaveOffset, yWaveSpeed, 1) * waveSize;
          float yWaverPost = sinEngine(m + 1, yWaveOffset, yWaveSpeed, 1) * waveSize;
  
          float rotX = atan2(yWaverPost - yWaverPre, 2 * ySpace);
          float rotY = atan2(xWaverPre - xWaverPost, 2 * xSpace);
          push();
            translate(x, y);
            //translate(0, pgTextSize * 0.7/2);
            translate(0, 0, xWaver + yWaver);
            
            rotateY(rotY);
            rotateX(rotX);
            
            if(fillField){
              text(coreString.charAt(counter%coreString.length()), 0, pgTextSize * 0.7/2);            
            } else {
              if(n < coreStringArray[m].length()){
                text(coreStringArray[m].charAt(n), 0, pgTextSize * 0.7/2);                
              }
            }
          pop();
          
          counter ++;
        }
      }
    pop();
  }
}
