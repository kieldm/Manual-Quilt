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
  
          float fullWave =  sinEngine2(m, yWaveOffset, n, xWaveOffset, waveSpeed, 1) * waveSize;
    
          float fullWaveAbove =  sinEngine2(m - 1, yWaveOffset, n, xWaveOffset, waveSpeed, 1) * waveSize;
          float fullWaveBelow =  sinEngine2(m + 1, yWaveOffset, n, xWaveOffset, waveSpeed, 1) * waveSize;
          float fullWavePre =  sinEngine2(m, yWaveOffset, n - 1, xWaveOffset, waveSpeed, 1) * waveSize;
          float fullWavePost =  sinEngine2(m, yWaveOffset, n + 1, xWaveOffset, waveSpeed, 1) * waveSize;
    
          float rotX = atan2(fullWaveBelow - fullWaveAbove, 2 * ySpace);
          float rotY = atan2(fullWavePre - fullWavePost, 2 * xSpace);
                    
          push();
            translate(x, y);
            //translate(0, pgTextSize * 0.7/2);
            //translate(0, 0, xWaver + yWaver);
            translate(0, 0, fullWave);
            
            rotateY(rotY);
            rotateX(rotX);
            
            if(fillField){
              text(coreString.charAt(counter%coreString.length()), 0, pgTextSize * 0.7/2);
              
              //translate(0,0,0.5);
              //text(coreString.charAt(counter%coreString.length()), 0, pgTextSize * 0.7/2);
            } else {
              if(n < coreStringArray[m].length()){
                text(coreStringArray[m].charAt(n), 0, pgTextSize * 0.7/2);
                
                //translate(0,0,0.5);
                //text(coreStringArray[m].charAt(n), 0, pgTextSize * 0.7/2);
              }
            }
          pop();
          
          counter ++;
        }
      }
    pop();
  }
}
