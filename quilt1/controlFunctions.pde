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

public void widthField(String theText){
  coreCanvasW = int(theText);
  if(coreCanvasW < 10){ coreCanvasW = 10; }
  
  canvasResizer();
 }

public void heightField(String theText){
  coreCanvasH = int(theText);
  if(coreCanvasH < 10){ coreCanvasH = 10; }
  
  canvasResizer();
}

public void canvasResizer(){
  coreCanvas = createGraphics(int(coreCanvasW), int(coreCanvasH), P3D);  // create at actual size
  //coreCanvas.resize(int(coreCanvasW), int(coreCanvasH));
  coreCanvas.smooth(4);

  // figure out display dimensions so it's scaled to proper display (displayCore) size
  if(coreCanvasW > coreCanvasH){    //////////////////////////////////////////////// HORZ COMP
    println("HORIZONTAL COMPOSITION");
  
    coreRatio = coreCanvasH/coreCanvasW;
    if(coreCanvasH > boardHeight && coreCanvasW < boardWidth * coreRatio){
      println("Height FIT");
      displayCoreH = boardHeight;
      displayCoreW = displayCoreH/coreRatio;
    } else if(coreCanvasW > boardWidth){
      println("Width FIT");
      displayCoreW = boardWidth;
      displayCoreH = displayCoreW * coreRatio;
    } else {
      println("Equal FIT");
      displayCoreW = coreCanvasW;
      displayCoreH = coreCanvasH;
    }
  } else {                          //////////////////////////////////////////////// VERT COMP
    println("VERTICAL COMPOSITION");

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
      scrubToggle.setColorActive(uiForeColor);
    } else {
      scrubSlider.setVisible(false);
      scrubToggle.setColorActive(uiAccentColor);
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
  animateColor = theFlag;
      
  if(animateColorToggle != null){
    if(theFlag){
      for(int m = 0; m < 9; m++){
        swatchAnimButton[m].setVisible(true);
      }
      animateColorToggle.setColorActive(uiForeColor);
    } else {
      for(int m = 0; m < 9; m++){
        swatchAnimButton[m].setVisible(false);
      }
      animateColorToggle.setColorActive(uiAccentColor);   
    }
  }
}
  
public void swatch0(){ resetSwatch(); swatchSel[0] = true; bkgdColor = #ffffff; foreColor = #000000;}
public void swatch1(){ resetSwatch(); swatchSel[1] = true; bkgdColor = #000000; foreColor = #ffffff;}  
public void swatch2(){ resetSwatch(); swatchSel[2] = true; bkgdColor = #fff3d2; foreColor = #FF7B5E;}  
public void swatch3(){ resetSwatch(); swatchSel[3] = true; bkgdColor = #ff7b5e; foreColor = #fff3d2;}  
public void swatch4(){ resetSwatch(); swatchSel[4] = true; bkgdColor = #d8f4f7; foreColor = #202a79;}  
public void swatch5(){ resetSwatch(); swatchSel[5] = true; bkgdColor = #6497f9; foreColor = #d8f4f7;}
public void swatch6(){ resetSwatch(); swatchSel[6] = true; bkgdColor = #fef9f3; foreColor = #186767;}
public void swatch7(){ resetSwatch(); swatchSel[7] = true; bkgdColor = #186767; foreColor = #d8f4f7;}  
public void swatch8(){ resetSwatch(); swatchSel[8] = true; bkgdColor = color(255, 255, 255, 0); foreColor = #ffffff;}    

public void swatchAnim0(){ resetSwatchAnim(); swatchAnimSel[0] = true; bkgdColorAnim = #ffffff; foreColorAnim = #000000;}
public void swatchAnim1(){ resetSwatchAnim(); swatchAnimSel[1] = true; bkgdColorAnim = #000000; foreColorAnim = #ffffff;}  
public void swatchAnim2(){ resetSwatchAnim(); swatchAnimSel[2] = true; bkgdColorAnim = #fff3d2; foreColorAnim = #FF7B5E;}  
public void swatchAnim3(){ resetSwatchAnim(); swatchAnimSel[3] = true; bkgdColorAnim = #ff7b5e; foreColorAnim = #fff3d2;}  
public void swatchAnim4(){ resetSwatchAnim(); swatchAnimSel[4] = true; bkgdColorAnim = #d8f4f7; foreColorAnim = #202A79;}  
public void swatchAnim5(){ resetSwatchAnim(); swatchAnimSel[5] = true; bkgdColorAnim = #6497f9; foreColorAnim = #d8f4f7;}
public void swatchAnim6(){ resetSwatchAnim(); swatchAnimSel[6] = true; bkgdColorAnim = #fef9f3; foreColorAnim = #186767;}
public void swatchAnim7(){ resetSwatchAnim(); swatchAnimSel[7] = true; bkgdColorAnim = #186767; foreColorAnim = #d8f4f7;}  
public void swatchAnim8(){ resetSwatchAnim(); swatchAnimSel[8] = true; bkgdColorAnim = color(255, 255, 255, 0); foreColorAnim = #ffffff;}  

public void coreScale(float n){ coreScale = n; }
public void xCount(int n){ xCount = n; }
public void yCount(int n){ yCount = n; }
public void xSpace(float n){ xSpace = n; }
public void ySpace(float n){ ySpace = n; }

public void waveDimension(boolean theFlag){
  wave3D = theFlag;
  if(waveDimensionToggle != null){
    if(theFlag){
      waveDimensionToggle.setColorActive(uiForeColor);
      cameraRotXSlider.setLock(false).setColorForeground(uiForeColor);
      cameraRotYSlider.setLock(false).setColorForeground(uiForeColor);
      cameraRotZSlider.setLock(false).setColorForeground(uiForeColor);
      cameraPosXSlider.setLock(false).setColorForeground(uiForeColor);
      waveSizeSlider.setLock(false).setColorForeground(uiForeColor);
      animateCameraToggle.setLock(false);
    } else {
      waveDimensionToggle.setColorActive(uiAccentColor);
      cameraRotXSlider.setLock(true).setColorForeground(uiAccentColor);
      cameraRotYSlider.setLock(true).setColorForeground(uiAccentColor);
      cameraRotZSlider.setLock(true).setColorForeground(uiAccentColor);
      cameraPosXSlider.setLock(true).setColorForeground(uiAccentColor);
      waveSizeSlider.setLock(true).setColorForeground(uiAccentColor);
      animateCameraToggle.setLock(true);
    }
  }
}

public void radialWave(boolean theFlag){
  radialWave = theFlag;
  if(radialWaveToggle != null){
    if(theFlag){
      radialWaveToggle.setColorActive(uiForeColor);
      yWaveOffsetSlider.setVisible(false);
      xWaveOffsetSlider.setVisible(false);
      radialOffsetSlider.setVisible(true);
    } else {
      radialWaveToggle.setColorActive(uiAccentColor);
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

  if (animateRotXSlider != null) {
    if(theFlag){
      animateCameraToggle.setColorActive(uiForeColor);
      animateRotXSlider.setLock(false).setColorForeground(uiForeColor);
      animateRotYSlider.setLock(false).setColorForeground(uiForeColor);
      animateRotZSlider.setLock(false).setColorForeground(uiForeColor);
      animateZoomZSlider.setLock(false).setColorForeground(uiForeColor);
      animatePosXSlider.setLock(false).setColorForeground(uiForeColor);
    } else {
      animateCameraToggle.setColorActive(uiForeColor);
      animateRotXSlider.setLock(true).setColorForeground(uiAccentColor);
      animateRotYSlider.setLock(true).setColorForeground(uiAccentColor);
      animateRotZSlider.setLock(true).setColorForeground(uiAccentColor);
      animateZoomZSlider.setLock(true).setColorForeground(uiAccentColor);
      animatePosXSlider.setLock(true).setColorForeground(uiAccentColor);
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
  // need to figure out how to save coreCanvas as an SVG
  
  SvgWindow svgWindowSaver = new SvgWindow();
  
  //println("SVG SAVE DOWN! NEEDS FIXING!");
}

public void exportSeq(){
  coreCanvas = createGraphics(int(coreCanvasW/float(pixelRes)), int(coreCanvasH/float(pixelRes)), P3D);  // create at actual size
  //coreCanvas.resize(int(coreCanvasW), int(coreCanvasH));
  coreCanvas.smooth(4);
  
  exportSeqToggle = true;
  seqTag = "quiltSeq_" + day() + minute() + second();
  seqCount = 0;
  seqCap = loopLength;
  if(animateCamera || animateColor){
    seqCap *= 2;
  }
}

public void exportMP4(){
  coreCanvas = createGraphics(int(coreCanvasW/float(pixelRes)), int(coreCanvasH/float(pixelRes)), P3D);  // create at actual size
  //coreCanvas.resize(int(coreCanvasW), int(coreCanvasH));
  coreCanvas.smooth(4);
  
  exportMP4toggle = true;
  
  String tempTag = "quiltMotion" + hour() + "_" + minute() + "_" + second();
  videoExport = new VideoExport(this, "export/mp4/" + tempTag + ".mp4", coreCanvas);
     
  videoExport.setQuality(97, 1);
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
