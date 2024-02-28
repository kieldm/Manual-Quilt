public void headline(boolean theFlag){
  headlineMode = theFlag;

  if(theFlag){
    xCountHold = xCount;
    yCountHold = yCount;

    splitInputIntoArray(); 
    if (xCountSlider != null) {
      xCountSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
      yCountSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
      headlineToggle.setColorActive(color(#6497F9)); 
      justifyRadio.setVisible(true);
    }
  } else {
    xCount = xCountHold;
    yCount = yCountHold;
    if (xCountSlider != null) {
      xCountSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255)).setColorValue(color(255));
      yCountSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255)).setColorValue(color(255));
      headlineToggle.setColorActive(color(#374760));
      justifyRadio.setVisible(false);
    }
  }
}

public void justifyMode(int n){ justifyMode = n; }

public void canvasWidth(String theText){
  coreCanvasW = int(theText);
  if(coreCanvasW < 10){ coreCanvasW = 10; }
  
  canvasResizer();
 }

public void canvasHeight(String theText){
  coreCanvasH = int(theText);
  if(coreCanvasH < 10){ coreCanvasH = 10; }
  
  canvasResizer();
}

public void canvasResizer(){
  coreCanvas = createGraphics(int(coreCanvasW), int(coreCanvasH), P3D);  // create at actual size
  coreCanvas.smooth(4);

  // figure out display dimensions so it's scaled to proper display (displayCore) size
  if(coreCanvasW > coreCanvasH){    //////////// HORZ COMP
    coreRatio = coreCanvasH/coreCanvasW;
    if(coreCanvasW > boardWidth){
      displayCoreW = boardWidth;
      displayCoreH = displayCoreW * coreRatio;
    } else if(coreCanvasH > boardHeight){
      displayCoreH = boardHeight;
      displayCoreW = displayCoreH/coreRatio;
    } else {
      displayCoreW = coreCanvasW;
      displayCoreH = coreCanvasH;
    }
  } else {                          //////////// VERT COMP
    coreRatio = coreCanvasW/coreCanvasH;
    if(coreCanvasH > boardHeight){
      displayCoreH = boardHeight;
      displayCoreW = displayCoreH * coreRatio;
    } else if(coreCanvasW > boardWidth){
      displayCoreW = boardWidth;
      displayCoreH = displayCoreW/coreRatio;
    } else {
      displayCoreW = coreCanvasW;
      displayCoreH = coreCanvasH;
    }
  }
  imageScale = round((displayCoreH/coreCanvasH) * 100);
}

public void scrubMode(boolean theFlag){
  scrubMode = theFlag;

  if(scrubSlider != null){
    if(theFlag){
      scrubSlider.setVisible(true);
      scrubToggle.setColorActive(color(#6497F9));
    } else {
      scrubSlider.setVisible(false);
      scrubToggle.setColorActive(color(#374760));
    }
  }
}
public void scrubber(float n){
  if(animateCamera || animateColor){
    scrubbed = int(map(n, 0, 1, 0, 2 * loopLength));
  } else {
    scrubbed = int(map(n, 0, 1, 0, loopLength));  
  }
}

public void animateColor(boolean theFlag){
  boolean toggle = theFlag;
  animateColor = theFlag;
      
  if(swatchButton[0] != null){
    for(int m = 0; m < 10; m++){
      swatchAnimButton[m].setVisible(toggle);
    }
  }
  if(animateColorToggle != null){
    if(theFlag){
      animateColorToggle.setColorActive(color(#6497F9));
    } else {
      animateColorToggle.setColorActive(color(#374760));   
    }
  }
}
  
public void swatch0(){ resetSwatch(); swatchSel[0] = true; bkgdColor = #ffffff; foreColor = #000000;}
public void swatch1(){ resetSwatch(); swatchSel[1] = true; bkgdColor = #000000; foreColor = #ffffff;}  
public void swatch2(){ resetSwatch(); swatchSel[2] = true; bkgdColor = #fef9f3; foreColor = #000000;}  
public void swatch3(){ resetSwatch(); swatchSel[3] = true; bkgdColor = #fff3d2; foreColor = #FF7B5E;}  
public void swatch4(){ resetSwatch(); swatchSel[4] = true; bkgdColor = #ff7b5e; foreColor = #fff3d2;}  
public void swatch5(){ resetSwatch(); swatchSel[5] = true; bkgdColor = #d8f4f7; foreColor = #202a79;}
public void swatch6(){ resetSwatch(); swatchSel[6] = true; bkgdColor = #6497f9; foreColor = #d8f4f7;}
public void swatch7(){ resetSwatch(); swatchSel[7] = true; bkgdColor = #fef9f3; foreColor = #186767;}  
public void swatch8(){ resetSwatch(); swatchSel[8] = true; bkgdColor = #186767; foreColor = #d8f4f7;}  
public void swatch9(){ resetSwatch(); swatchSel[9] = true; bkgdColor = color(255, 255, 255, 0); foreColor = #ffffff;}  

public void swatchAnim0(){ resetSwatchAnim(); swatchAnimSel[0] = true; bkgdColorAnim = #ffffff; foreColorAnim = #000000;}
public void swatchAnim1(){ resetSwatchAnim(); swatchAnimSel[1] = true; bkgdColorAnim = #000000; foreColorAnim = #ffffff;}  
public void swatchAnim2(){ resetSwatchAnim(); swatchAnimSel[2] = true; bkgdColorAnim = #fef9f3; foreColorAnim = #000000;}  
public void swatchAnim3(){ resetSwatchAnim(); swatchAnimSel[3] = true; bkgdColorAnim = #fff3d2; foreColorAnim = #FF7B5E;}  
public void swatchAnim4(){ resetSwatchAnim(); swatchAnimSel[4] = true; bkgdColorAnim = #ff7b5e; foreColorAnim = #fff3d2;}  
public void swatchAnim5(){ resetSwatchAnim(); swatchAnimSel[5] = true; bkgdColorAnim = #d8f4f7; foreColorAnim = #202A79;}
public void swatchAnim6(){ resetSwatchAnim(); swatchAnimSel[6] = true; bkgdColorAnim = #6497f9; foreColorAnim = #d8f4f7;}
public void swatchAnim7(){ resetSwatchAnim(); swatchAnimSel[7] = true; bkgdColorAnim = #fef9f3; foreColorAnim = #186767;}  
public void swatchAnim8(){ resetSwatchAnim(); swatchAnimSel[8] = true; bkgdColorAnim = #186767; foreColorAnim = #d8f4f7;}  
public void swatchAnim9(){ resetSwatchAnim(); swatchAnimSel[9] = true; bkgdColorAnim = color(255, 255, 255, 0); foreColorAnim = #ffffff;}  

public void coreScale(float n){ coreScale = n; }
public void xCount(int n){ xCount = n; }
public void yCount(int n){ yCount = n; }
public void xSpace(float n){ xSpace = n; }
public void ySpace(float n){ ySpace = n; }

public void waveDimension(boolean theFlag){        //////// SORRY ALAN! I'LL CLEAN THIS UP LATER
  wave3D = theFlag;
  if(waveDimensionToggle != null){
    if(theFlag){
      waveDimensionToggle.setColorActive(color(#6497F9));
      cameraRotXSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255)).setColorValue(color(255));
      cameraRotYSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255)).setColorValue(color(255));
      cameraRotZSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255)).setColorValue(color(255));
      cameraPosXSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255)).setColorValue(color(255));
      waveSizeSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255)).setColorValue(color(255));
      animateCameraToggle.setLock(false);
    } else {
      waveDimensionToggle.setColorActive(color(#374760));
      cameraRotXSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
      cameraRotYSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
      cameraRotZSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
      cameraPosXSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
      waveSizeSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
      animateCameraToggle.setLock(true);
    }
  }
}
public void radialWave(boolean theFlag){
  radialWave = theFlag;
  if(radialWaveToggle != null){
    if(theFlag){
      radialWaveToggle.setColorActive(color(#6497F9));
      yWaveOffsetSlider.setVisible(false);
      xWaveOffsetSlider.setVisible(false);
      radialOffsetSlider.setVisible(true);
    } else {
      radialWaveToggle.setColorActive(color(#374760));
      yWaveOffsetSlider.setVisible(true);
      xWaveOffsetSlider.setVisible(true);
      radialOffsetSlider.setVisible(false);
    }
  }
}

public void yWaveOffset(float n){ yWaveOffset = n; } 
public void xWaveOffset(float n){ xWaveOffset = n; }
public void radialOffset(float n){ radialOffset = n; }
public void loopLength(int n){
  loopLength = n;
  waveSpeed = (TWO_PI)/loopLength;
}  
public void waveSize(float n){ waveSize = n; }

public void cameraRotX(float n){ cameraRotX = n; }
public void cameraRotY(float n){ cameraRotY = n; }
public void cameraRotZ(float n){ cameraRotZ = n; }
public void cameraPosX(float n){ cameraPosX = n; }

public void animateRotX(float n){ animateRotX = n; }
public void animateRotY(float n){ animateRotY = n; }
public void animateRotZ(float n){ animateRotZ = n; }
public void animateZoomZ(float n){ animateZoomZ = n; }
public void animatePosX(float n){ animatePosX = n; }

public void animateCamera(boolean theFlag){
  animateCamera = theFlag;

  boolean toggle = true;
  int cfo = 70;
  int ccl = 100;
  int ccl2 = 120;

  if (theFlag) {
    toggle = false;
    cfo = 200;
    ccl = 255;
    ccl2 = 255;
  }

  if (animateRotXSlider != null) {
    animateRotXSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl)).setColorValue(color(ccl2));
    animateRotYSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl)).setColorValue(color(ccl2));
    animateRotZSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl)).setColorValue(color(ccl2));
    animateZoomZSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl)).setColorValue(color(ccl2));
    animatePosXSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl)).setColorValue(color(ccl2));
    if(theFlag){
      animateCameraToggle.setColorActive(color(#6497F9));
    } else {
      animateCameraToggle.setColorActive(color(70));
    }
  }
}

public void resetCamera(){
  println("CAMERA RESET!");

 if(cameraRotXSlider != null) {
   cameraRotXSlider.setValue(0);
   cameraRotYSlider.setValue(0);
   cameraRotZSlider.setValue(0);
   cameraPosXSlider.setValue(0);
   animateRotXSlider.setValue(0);
   animateRotYSlider.setValue(0);
   animateRotZSlider.setValue(0);
   animateZoomZSlider.setValue(0);
   animatePosXSlider.setValue(0);
 }
}

public void exportSVG(){
  svgFlag = new Field();
  textMode(SHAPE);
  
  windowResize(int(coreCanvasW), int(coreCanvasH));
  exportSVGtoggle = true;
}

public void exportSeq(){
  exportSeqToggle = true;
  seqTag = "quiltSeq_" + day() + minute() + second();
  seqCount = 0;
  seqCap = loopLength;
  if(animateCamera || animateColor){
    seqCap *= 2;
  }
}

public void exportMP4(){
  exportMP4toggle = true;
  
  String tempTag = "quiltMotion" + hour() + "_" + minute() + "_" + second();
  videoExport = new VideoExport(this, "export/mp4/" + tempTag + ".mp4", coreCanvas);
     
  videoExport.setQuality(97, 1 );
  videoExport.setFrameRate(30);
  videoExport.startMovie();
  
  seqCount = 0;
  seqCap = loopLength;
  
  if(animateCamera || animateColor){
    seqCap *= 2;
  }
}

public void splitInputIntoArray(){
  if(mainInputText.getText().length() == 0){
    mainInputText.setText(" ");
    coreString = " ";
  }
  coreString = mainInputText.getText();
  
  coreStringArray = coreString.split("\\|");
  
  yCount = coreStringArray.length;
  int measurer = 0;
  for(int m = 0; m < coreStringArray.length; m++){
    if(coreStringArray[m].length() > measurer){
      xCount = coreStringArray[m].length();
      measurer = coreStringArray[m].length();
    }
  }
}
