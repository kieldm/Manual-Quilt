class ControlApplet extends PApplet {
  public ControlApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(360, 900, P3D);
    smooth(8);
  }

  public void setup() {
    frameRate(30);
      
    surface.setTitle("Controls");
    surface.setResizable(false);
    surface.setLocation(10, 10);
    
    cp5 = new ControlP5(this);
    cp5 = new ControlP5(this);
    cp5 = new ControlP5(this);

    //////////////// CANVAS
    cp5.addTextfield("canvasWidth").setPosition(20, 100).setSize(50, 25).setValue("1080").setAutoClear(false).setCaptionLabel("Width");
    cp5.getController("canvasWidth").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    cp5.getController("canvasWidth").getValueLabel().setPaddingX(3);

    cp5.addTextfield("canvasHeight").setPosition(75, 100).setSize(50, 25).setValue("1080").setAutoClear(false).setCaptionLabel("Height");
    cp5.getController("canvasHeight").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    cp5.getController("canvasHeight").getValueLabel().setPaddingX(3);
    
    //////////////// TEXT
    cp5.addTextfield("mainInput").setPosition(20, 170).setSize(310, 32).setValue("BETTER BY DESIGN").setAutoClear(false).setCaptionLabel("");
    cp5.getController("mainInput").getValueLabel().setPaddingX(2);
    
    cp5.addToggle("fillField").setPosition(20, 205).setSize(60, 20).setValue(true).setCaptionLabel("Fill Field");
    cp5.getController("fillField").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("coreScale").setPosition(20, 240).setSize(310, 14).setRange(0.1, 5).setValue(1.6).setCaptionLabel("Scale");
    cp5.getController("coreScale").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    
    //////////////// COLOR
    cp5.addButton("swatch0").setPosition(20, 300).setSize(50,20).setImage(swatch[0]);
    cp5.addButton("swatch1").setPosition(72, 300).setSize(50,20).setImage(swatch[1]);
    cp5.addButton("swatch2").setPosition(124, 300).setSize(50,20).setImage(swatch[2]);
    cp5.addButton("swatch3").setPosition(176, 300).setSize(50,20).setImage(swatch[3]);
    cp5.addButton("swatch4").setPosition(228, 300).setSize(50,20).setImage(swatch[4]);
    cp5.addButton("swatch5").setPosition(280, 300).setSize(50,20).setImage(swatch[5]);
    cp5.addButton("swatch6").setPosition(20, 325).setSize(50,20).setImage(swatch[6]);
    cp5.addButton("swatch7").setPosition(72, 325).setSize(50,20).setImage(swatch[7]);
    cp5.addButton("swatch8").setPosition(124, 325).setSize(50,20).setImage(swatch[8]);
    cp5.addButton("swatch9").setPosition(176, 325).setSize(50,20).setImage(swatch[9]);
    cp5.addButton("swatch10").setPosition(228, 325).setSize(50,20).setImage(swatch[10]);

    //////////////// FIELD
    cp5.addSlider("xCount").setPosition(20, 380).setSize(150, 14).setRange(1, 50).setValue(16).setCaptionLabel("X Count");
    cp5.getController("xCount").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("yCount").setPosition(20, 410).setSize(150, 14).setRange(1, 50).setValue(30).setCaptionLabel("Y Count");    
    cp5.getController("yCount").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
       
    cp5.addSlider("xSpace").setPosition(180, 380).setSize(150, 14).setRange(1, 100).setValue(30).setCaptionLabel("X Space");
    cp5.getController("xSpace").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("ySpace").setPosition(180, 410).setSize(150, 14).setRange(1, 100).setValue(30).setCaptionLabel("Y Space");    
    cp5.getController("ySpace").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    //////////////// WAVE
    cp5.addToggle("waveDimension").setPosition(20,470).setSize(80,14).setValue(true).setMode(ControlP5.SWITCH).setCaptionLabel("3D Wave");
    cp5.getController("waveDimension").getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(90);
    
    cp5.addSlider("yWaveOffset").setPosition(20, 490).setSize(150, 14).setRange(-PI/4, PI/4).setValue(-0.1).setCaptionLabel("Vertical Offset");    
    cp5.getController("yWaveOffset").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("xWaveOffset").setPosition(180, 490).setSize(150, 14).setRange(-PI/4, PI/4).setValue(0.55).setCaptionLabel("Horizontal Offset");    
    cp5.getController("xWaveOffset").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("waveSize").setPosition(20, 520).setSize(310, 14).setRange(0, 200).setValue(24).setCaptionLabel("Size");    
    cp5.getController("waveSize").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("loopLength").setPosition(20, 550).setSize(310, 14).setRange(60,400).setValue(180).setCaptionLabel("Loop Length");    
    cp5.getController("loopLength").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    //////////////// CAMERA
    cp5.addSlider("cameraRotX").setPosition(20, 620).setSize(150, 14).setRange(-PI/3, PI/3).setValue(0.33).setCaptionLabel("Rotate X");
    cp5.getController("cameraRotX").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("cameraRotY").setPosition(20, 650).setSize(150, 14).setRange(-PI/3, PI/3).setValue(0.33).setCaptionLabel("Rotate Y");
    cp5.getController("cameraRotY").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    cp5.addSlider("cameraRotZ").setPosition(20, 680).setSize(150, 14).setRange(-PI/3, PI/3).setValue(-0.17).setCaptionLabel("Rotate Z");
    cp5.getController("cameraRotZ").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addToggle("animateCamera").setPosition(230,620).setSize(80,14).setValue(false).setMode(ControlP5.SWITCH).setCaptionLabel("Animate");
    cp5.getController("animateCamera").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.LEFT_OUTSIDE).setPaddingX(88);

    cp5.addSlider("animateRotX").setPosition(180, 650).setSize(150, 14).setRange(-PI/3, PI/3).setValue(0).setCaptionLabel("Animate X");
    cp5.getController("animateRotX").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("animateRotY").setPosition(180, 680).setSize(150, 14).setRange(-PI/3, PI/3).setValue(0.25).setCaptionLabel("Animate Y");
    cp5.getController("animateRotY").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    cp5.addSlider("animateRotZ").setPosition(180, 710).setSize(150, 14).setRange(-PI/3, PI/3).setValue(0).setCaptionLabel("Animate Z");
    cp5.getController("animateRotZ").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("animateZoomZ").setPosition(180, 740).setSize(150, 14).setRange(-300, 300).setValue(0).setCaptionLabel("Animate Zoom");
    cp5.getController("animateZoomZ").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    //////////////// EXPORT
    cp5.addButton("exportSVG").setPosition(20, 800).setSize(150,40).setCaptionLabel("Export SVG");
    cp5.addButton("exportSeq").setPosition(180, 800).setSize(150,40).setCaptionLabel("Export Sequence");

    cp5.setColorBackground(color(220))
       .setColorForeground(color(30))
       .setColorActive(color(30))
       .setColorCaptionLabel(color(0))
       .setFont(uiFontSys1);
       
    cp5.setColorBackground(color(200))
       .setColorForeground(color(30))
       .setColorActive(color(30))
       .setColorCaptionLabel(color(30))
       .setColorValueLabel(color(30))
       .setFont(uiFontSys2);
       
    cp5.setColorBackground(color(200))
       .setColorForeground(color(30))
       .setColorActive(color(30))
       .setColorCaptionLabel(color(30))
       .setColorValueLabel(color(30))
       .setFont(uiFontSys1);
       
      cp5.getController("animateRotX").setLock(true);
      cp5.getController("animateRotY").setLock(true);
      cp5.getController("animateRotZ").setLock(true);
      cp5.getController("animateZoomZ").setLock(true);
      cp5.getController("animateRotX").setColorForeground(color(200)); cp5.getController("animateRotX").setColorCaptionLabel(color(200));
      cp5.getController("animateRotY").setColorForeground(color(200)); cp5.getController("animateRotY").setColorCaptionLabel(color(200));
      cp5.getController("animateRotZ").setColorForeground(color(200)); cp5.getController("animateRotZ").setColorCaptionLabel(color(200));
      cp5.getController("animateZoomZ").setColorForeground(color(200)); cp5.getController("animateZoomZ").setColorCaptionLabel(color(200));
  }

  public void draw() {
    if(fillField){
      if(cp5.get(Textfield.class,"mainInput").getText().length() == 0){
        cp5.get(Textfield.class,"mainInput").setText(" ");
        coreString = " ";
      } else {
        coreString = cp5.get(Textfield.class,"mainInput").getText();      ///////// PROBLEM AREA? Does this alwyas need to be running?    
      }
    } else if(cp5.get(Textfield.class,"mainInput").getText().length() != coreString.length()){
      splitInputIntoArray();
    }
    
    background(uiBkgdColor);
    
    noStroke();
    fill(uiForeColor);
    
    push();
      translate(20, 65);
            
      textFont(uiFontHead);
      textSize(60);
      text("QUILT_1", 0, 0);
      
      textFont(uiFontMain);
      textSize(20);

      text("CANVAS", 0, 30);
      
      text("TEXT", 0, 100);

      text("COLOR", 0, 230);
      
      text("FIELD", 0, 310);

      text("WAVE", 0, 400);
      
      textFont(uiFontSub);
      textSize(14);
     
      textFont(uiFontMain);
      textSize(20);
      text("CAMERA", 0, 550);
      
      text("EXPORT", 0, 730);
    pop();    
  }
  
  //public void mainInput(String theText) {
  //  // automatically receives results from controller input
  //  println("NEW INPUT! " + theText);
  //}
  public void refreshText(){
    println("NEW TEXT!");
  }
  
  public void fillField(boolean theFlag){
    fillField = theFlag;
    
    if(theFlag){
      xCount = xCountHold;
      yCount = yCountHold;
      cp5.getController("xCount").setLock(false);
      cp5.getController("yCount").setLock(false);
      cp5.getController("xCount").setColorForeground(color(30)); cp5.getController("xCount").setColorCaptionLabel(color(0));
      cp5.getController("yCount").setColorForeground(color(30)); cp5.getController("yCount").setColorCaptionLabel(color(0));
    } else {
      xCountHold = xCount;
      yCountHold = yCount;

      splitInputIntoArray(); 
      cp5.getController("xCount").setLock(true);
      cp5.getController("yCount").setLock(true);
      cp5.getController("xCount").setColorForeground(color(200)); cp5.getController("xCount").setColorCaptionLabel(color(200));
      cp5.getController("yCount").setColorForeground(color(200)); cp5.getController("yCount").setColorCaptionLabel(color(200));
    }
  }
  public void canvasWidth(String theText){
    canvasWidth = int(theText);
    println("NEW WIDTH: " + canvasWidth);
    
  }
  public void canvasHeight(String theText){
    canvasHeight = int(theText);
    println("NEW Height: " + canvasHeight);
  }
  
  public void swatch0(){ bkgdColor = #ffffff; foreColor = #000000;}
  public void swatch1(){ bkgdColor = #FEF9F3; foreColor = #000000;}  
  public void swatch2(){ bkgdColor = #E5DFD9; foreColor = #000000;}  
  public void swatch3(){ bkgdColor = #FEF9F3; foreColor = #FF7B5E;}  
  public void swatch4(){ bkgdColor = #FEF9F3; foreColor = #186767;}  
  public void swatch5(){ bkgdColor = #FEF9F3; foreColor = #202A79;}
  
  public void swatch6(){ bkgdColor = #FFF3D2; foreColor = #000000;}
  public void swatch7(){ bkgdColor = #FF7B5E; foreColor = #FFF3D2;}  
  public void swatch8(){ bkgdColor = #D8F4F7; foreColor = #186767;}  
  public void swatch9(){ bkgdColor = #6497F9; foreColor = #D8F4F7;}  
  public void swatch10(){ bkgdColor = #186767; foreColor = #D8F4F7;}  
  
  public void coreScale(float n){ coreScale = n; }
  public void xCount(int n){ xCount = n; }
  public void yCount(int n){ yCount = n; }
  public void xSpace(float n){ xSpace = n; }
  public void ySpace(float n){ ySpace = n; }
  
  public void waveDimension(boolean theFlag){ wave3D = theFlag; }
  public void yWaveOffset(float n){ yWaveOffset = n; }
  public void xWaveOffset(float n){ xWaveOffset = n; }
  public void loopLength(int n){
    loopLength = n;
    waveSpeed = (TWO_PI)/loopLength;
  }  
  public void waveSize(float n){ waveSize = n; }
  
  public void cameraRotX(float n){ cameraRotX = n; }
  public void cameraRotY(float n){ cameraRotY = n; }
  public void cameraRotZ(float n){ cameraRotZ = n; }

  public void animateRotX(float n){ animateRotX = n; }
  public void animateRotY(float n){ animateRotY = n; }
  public void animateRotZ(float n){ animateRotZ = n; }
  public void animateZoomZ(float n){ animateZoomZ = n; }

  public void animateCamera(boolean theFlag){
    animateCamera = theFlag;
    
    if(theFlag){
      cp5.getController("animateRotX").setLock(false);
      cp5.getController("animateRotY").setLock(false);
      cp5.getController("animateRotZ").setLock(false);
      cp5.getController("animateZoomZ").setLock(false);
      cp5.getController("animateRotX").setColorForeground(color(30)); cp5.getController("animateRotX").setColorCaptionLabel(color(0));
      cp5.getController("animateRotY").setColorForeground(color(30)); cp5.getController("animateRotY").setColorCaptionLabel(color(0));
      cp5.getController("animateRotZ").setColorForeground(color(30)); cp5.getController("animateRotZ").setColorCaptionLabel(color(0));
      cp5.getController("animateZoomZ").setColorForeground(color(30)); cp5.getController("animateZoomZ").setColorCaptionLabel(color(0));
    } else {
      cp5.getController("animateRotX").setLock(true);
      cp5.getController("animateRotY").setLock(true);
      cp5.getController("animateRotZ").setLock(true);
      cp5.getController("animateZoomZ").setLock(true);
      cp5.getController("animateRotX").setColorForeground(color(200)); cp5.getController("animateRotX").setColorCaptionLabel(color(200));
      cp5.getController("animateRotY").setColorForeground(color(200)); cp5.getController("animateRotY").setColorCaptionLabel(color(200));
      cp5.getController("animateRotZ").setColorForeground(color(200)); cp5.getController("animateRotZ").setColorCaptionLabel(color(200));
      cp5.getController("animateZoomZ").setColorForeground(color(200)); cp5.getController("animateZoomZ").setColorCaptionLabel(color(200));
    }
  }
  
  public void exportSVG(){ exportSVGtoggle = true; println("SVG LAUNCH!");}
  public void exportSeq(){
    exportSeqToggle = true;
    seqTag = "quiltSeq_" + day() + minute() + second();
    seqCount = 0;
    seqCap = loopLength;
    if(animateCamera){
      seqCap *= 2;
    }
    println("SEQ LAUNCH!");
  }

  public void splitInputIntoArray(){
        //  if(cp5.get(Textfield.class,"mainInput").getText().length() == 0){
        //cp5.get(Textfield.class,"mainInput").setText(" ");
        //coreString = " ";
    
    if(cp5.get(Textfield.class,"mainInput").getText().length() == 0){
      cp5.get(Textfield.class,"mainInput").setText(" ");
      coreString = " ";
    }
    coreString = cp5.get(Textfield.class,"mainInput").getText();
    
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
}
