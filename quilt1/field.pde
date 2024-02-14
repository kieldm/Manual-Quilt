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

    coreCanvas.fill(foreColor);
    coreCanvas.noStroke();
    
    coreCanvas.textFont(genFont);
    coreCanvas.textSize(pgTextSize);
    coreCanvas.textAlign(CENTER);
    
    coreCanvas.push();
      coreCanvas.translate(-(xCount - 1) * xSpace/2, -(yCount - 1) * ySpace/2);
      for(int m = 0; m < yCount; m++){
        for(int n = 0; n < xCount; n++){
          float x = n * xSpace;
          float y = m * ySpace;
                      
          coreCanvas.push();
            coreCanvas.translate(x, y);
            
            if(wave3D){
              float fullWave =  sinEngine2(m, yWaveOffset, n, xWaveOffset, waveSpeed, 1) * waveSize;
              float fullWaveAbove =  sinEngine2(m - 1, yWaveOffset, n, xWaveOffset, waveSpeed, 1) * waveSize;
              float fullWaveBelow =  sinEngine2(m + 1, yWaveOffset, n, xWaveOffset, waveSpeed, 1) * waveSize;
              float fullWavePre =  sinEngine2(m, yWaveOffset, n - 1, xWaveOffset, waveSpeed, 1) * waveSize;
              float fullWavePost =  sinEngine2(m, yWaveOffset, n + 1, xWaveOffset, waveSpeed, 1) * waveSize;
              float rotX = atan2(fullWaveBelow - fullWaveAbove, 2 * ySpace);
              float rotY = atan2(fullWavePre - fullWavePost, 2 * xSpace);          
              coreCanvas.translate(0, 0, fullWave);
              coreCanvas.rotateY(rotY);
              coreCanvas.rotateX(rotX);
            } else {
              float waver = sinEngine2(m, yWaveOffset, n, xWaveOffset, waveSpeed, 1);
              float fullWave = map(waver, -1, 1, 0.1, 1);
              coreCanvas.scale(fullWave);
            }
            
            if(fillField){
              //if(drawOn && m < drawCap){
                coreCanvas.text(coreString.charAt(counter%coreString.length()), 0, pgTextSize * 0.7/2);            
              //}
            } else {
              if(n < coreStringArray[m].length()){
                coreCanvas.text(coreStringArray[m].charAt(n), 0, pgTextSize * 0.7/2);               
              }
            }
          coreCanvas.pop();
          
          counter ++;
        }
      }
    coreCanvas.pop();
  }
}
