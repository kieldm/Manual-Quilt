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

    coreCanvas.fill(foreColorActual);
    coreCanvas.noStroke();
    
    coreCanvas.textFont(genFont);
    coreCanvas.textSize(pgTextSize);
    coreCanvas.textAlign(CENTER);
    
    coreCanvas.push();    
      float centerX = (xCount - 1) * xSpace/2;
      float centerY = (yCount - 1) * ySpace/2;

      coreCanvas.translate(-centerX, -centerY);
      
      for(int m = 0; m < yCount; m++){
        for(int n = 0; n < xCount; n++){
          ////////////// PLACE LETTERS IN GRID
          float x = n * xSpace;
          float y = m * ySpace;
                      
          coreCanvas.push();
            coreCanvas.translate(x, y);
            
            ////////////// CREATE Z MOVEMENT WAVE AND DETERMINE ANGLE FIX
            if(radialWave){ /////////////// for Linear Wave
              if(wave3D){ /////////////// for 3D

                float distOffset = map(dist(centerX, centerY, x, y), 0, radialOffset, 0, TWO_PI);
                float distOffsetAbove = map(dist(centerX, centerY, x, (m - 1) * ySpace), 0, radialOffset, 0, TWO_PI);
                float distOffsetBelow = map(dist(centerX, centerY, x, (m + 1) * ySpace), 0, radialOffset, 0, TWO_PI);
                float distOffsetPre = map(dist(centerX, centerY, (n - 1) * xSpace, y), 0, radialOffset, 0, TWO_PI);
                float distOffsetPost = map(dist(centerX, centerY, (n + 1) * xSpace, y), 0, radialOffset, 0, TWO_PI);
                                
                float fullWave = sinEngine(1, distOffset, waveSpeed, 1) * waveSize;
                float fullWaveAbove = sinEngine(1, distOffsetAbove, waveSpeed, 1) * waveSize;
                float fullWaveBelow = sinEngine(1, distOffsetBelow, waveSpeed, 1) * waveSize;
                float fullWavePre = sinEngine(1, distOffsetPre, waveSpeed, 1) * waveSize;
                float fullWavePost = sinEngine(1, distOffsetPost, waveSpeed, 1) * waveSize;
                
                float rotX = atan2(fullWaveBelow - fullWaveAbove, 2 * ySpace);
                float rotY = atan2(fullWavePre - fullWavePost, 2 * xSpace);        
                
                coreCanvas.translate(0, 0, fullWave);
                coreCanvas.rotateY(rotY);
                coreCanvas.rotateX(rotX);
              } else {   /////////////// for 2D
                float distOffset = map(dist(centerX, centerY, x, y), 0, radialOffset, 0, TWO_PI);
                float waver = sinEngine(1, distOffset, waveSpeed, 1);
                float fullWave = map(waver, -1, 1, 0.1, 1);
                
                coreCanvas.scale(fullWave);
              }
            } else {
              if(wave3D){ /////////////// for 3D
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
              } else {   /////////////// for 2D
                float waver = sinEngine2(m, yWaveOffset, n, xWaveOffset, waveSpeed, 1);
                float fullWave = map(waver, -1, 1, 0.1, 1);
                
                coreCanvas.scale(fullWave);
              }
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
