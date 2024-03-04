class SvgWindow extends PApplet {    

  private String sketchPath;

  public SvgWindow(String sketchPath) {
    super();
    this.sketchPath = sketchPath + "/export/svg";
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  @Override
  public String sketchPath() {
      return sketchPath;
  }

  public void settings() {
    size(int(coreCanvasW), int(coreCanvasH), P3D);
    smooth(8);
    
    pixelDensity(pixelRes);  
  }

  public void setup() {       
    surface.setTitle("SVG Window");
    surface.setResizable(false);
    surface.setLocation(10, 10);
    surface.setVisible(false);
    
    textMode(SHAPE);
  }

  public void draw() {
    String saveTag = "testVector" + day() + minute() + second() + ".svg";
    beginRaw(SVG, saveTag);
       
    background(bkgdColorActual);

    scale(1.0/float(pixelRes));  ///////// scale to save correct resolution

    if(!swatchSel[8]){
      push();          /////////// draws background rect that's the same size as canvas size
        noStroke();
        fill(bkgdColorActual);
        translate(width/2, height/2, 0);

        rectMode(CENTER);
        rect(0, 0, width, height);
      pop();
    }
    
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
        translate(cameraPosX, 0);
        rotateX(cameraRotX);
        rotateY(cameraRotY);
        rotateZ(cameraRotZ);    
      }
  
      //SCALE
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
          if(headlineMode){
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
  
              
              if(!headlineMode){
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
              }
            pop();
            
            counter ++;
          }
        }
      pop();
    pop();
  
    endRaw();
      
    noLoop();    
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
