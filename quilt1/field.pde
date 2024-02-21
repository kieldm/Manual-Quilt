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
    coreCanvas.push();
      coreCanvas.translate(coreCanvasW/2, coreCanvasH/2);
      
      // ANIMATE CAMERA
      if(animateCamera && wave3D){
        cameraAnimation();
        coreCanvas.translate(animatorPosX, 0, animatorZoomZ);
        
        coreCanvas.rotateX(animatorRotX);
        coreCanvas.rotateY(animatorRotY);
        coreCanvas.rotateZ(animatorRotZ);
      }
          
      // CAMERA
      if(wave3D){
        coreCanvas.rotateX(cameraRotX);
        coreCanvas.rotateY(cameraRotY);
        coreCanvas.rotateZ(cameraRotZ);    
      }
  
      // SCALE
      coreCanvas.scale(coreScale);
    
      int counter = 0;
  
      coreCanvas.fill(foreColorActual);
      coreCanvas.noStroke();
            
      coreCanvas.push();    
        float centerX = (xCount - 1) * xSpace/2;
        float centerY = (yCount - 1) * ySpace/2;
  
        coreCanvas.translate(-centerX, -centerY);
        
        for(int m = 0; m < yCount; m++){
          int start = 0;
          if(!fillField){
            if(justifyMode == 1){
              start = int((xCount - coreStringArray[m].length())/2);          
            } else if(justifyMode == 2){
              start = xCount - coreStringArray[m].length();
            }
          }
          
          for(int n = start; n < xCount; n++){
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
                coreCanvas.textFont(genFont);
                coreCanvas.textSize(pgTextSize);
                coreCanvas.textAlign(CENTER);
                
                coreCanvas.text(coreString.charAt(counter%coreString.length()), 0, pgTextSize * 0.7/2);            
              } else {
                coreCanvas.textFont(genFontHeadline);
                coreCanvas.textSize(pgTextSize);
                coreCanvas.textAlign(CENTER);
                
                if(n - start < coreStringArray[m].length()){
                  coreCanvas.text(coreStringArray[m].charAt(n - start), 0, pgTextSize * 0.7/2);
                }
                //coreCanvas.ellipse(0,0,5,5);
              }
            coreCanvas.pop();
            
            counter ++;
          }
        }
      coreCanvas.pop();
    coreCanvas.pop();
  }
  
  void displaySVG(){
    push();
      translate(coreCanvasW/2, coreCanvasH/2);
      
      // ANIMATE CAMERA
      if(animateCamera && wave3D){
        cameraAnimation();
        translate(animatorPosX, 0, animatorZoomZ);
        
        rotateX(animatorRotX);
        rotateY(animatorRotY);
        rotateZ(animatorRotZ);
      }
          
      // CAMERA
      if(wave3D){
        rotateX(cameraRotX);
        rotateY(cameraRotY);
        rotateZ(cameraRotZ);    
      }
  
      // SCALE
      scale(coreScale);
    
      int counter = 0;
  
      fill(foreColorActual);
      noStroke();
            
      push();    
        float centerX = (xCount - 1) * xSpace/2;
        float centerY = (yCount - 1) * ySpace/2;
  
        translate(-centerX, -centerY);
        
        for(int m = 0; m < yCount; m++){
          int start = 0;
          if(!fillField){
            if(justifyMode == 1){
              start = int((xCount - coreStringArray[m].length())/2);          
            } else if(justifyMode == 2){
              start = xCount - coreStringArray[m].length();
            }
          }
          
          for(int n = start; n < xCount; n++){
            ////////////// PLACE LETTERS IN GRID
            float x = n * xSpace;
            float y = m * ySpace;
                        
            push();
              translate(x, y);
              
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
                  
                  translate(0, 0, fullWave);
                  rotateY(rotY);
                  rotateX(rotX);
                } else {   /////////////// for 2D
                  float distOffset = map(dist(centerX, centerY, x, y), 0, radialOffset, 0, TWO_PI);
                  float waver = sinEngine(1, distOffset, waveSpeed, 1);
                  float fullWave = map(waver, -1, 1, 0.1, 1);
                  
                  scale(fullWave);
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
                  
                  translate(0, 0, fullWave);
                  rotateY(rotY);
                  rotateX(rotX);
                } else {   /////////////// for 2D
                  float waver = sinEngine2(m, yWaveOffset, n, xWaveOffset, waveSpeed, 1);
                  float fullWave = map(waver, -1, 1, 0.1, 1);
                  
                  scale(fullWave);
                }
              }
  
              
              if(fillField){
                textFont(genFont);
                textSize(pgTextSize);
                textAlign(CENTER);
                
                text(coreString.charAt(counter%coreString.length()), 0, pgTextSize * 0.7/2);            
              } else {
                textFont(genFontHeadline);
                textSize(pgTextSize);
                textAlign(CENTER);
                
                if(n - start < coreStringArray[m].length()){
                  text(coreStringArray[m].charAt(n - start), 0, pgTextSize * 0.7/2);
                }
                //coreCanvas.ellipse(0,0,5,5);
              }
            pop();
            
            counter ++;
          }
        }
      pop();
    pop();
  }
  
  void cameraAnimation(){
    float waver = sinEngine(0,0,waveSpeed/2,1);
    animatorRotX = waver * animateRotX;
    animatorRotY = waver * animateRotY;
    animatorRotZ = waver * animateRotZ;
    animatorZoomZ = waver * animateZoomZ;
    animatorPosX = waver * animatePosX;
  }
}
