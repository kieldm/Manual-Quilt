class ControlApplet extends PApplet {
  public ControlApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(360, 800, P3D);
    //smooth(8);
  }

  public void setup() { 
    surface.setTitle("Controls");
    surface.setResizable(false);
    surface.setLocation(10, 10);
    
    cp5 = new ControlP5(this);
    cp6 = new ControlP5(this);
    
    cp6.addTextfield("mainInput").setPosition(25, 110).setSize(305, 32).setValue("BETTER BY DESIGN ").setAutoClear(false).setCaptionLabel("");
       
    cp5.addToggle("fillField").setPosition(25, 150).setSize(60, 20).setValue(true).setCaptionLabel("Fill Field");
    cp5.getController("fillField").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    //////////////// GRID
    cp5.addSlider("xCount").setPosition(25, 250).setSize(305, 20).setRange(1, 50).setValue(20).setCaptionLabel("X Count");
    cp5.getController("xCount").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("yCount").setPosition(25, 285).setSize(305, 20).setRange(1, 50).setValue(20).setCaptionLabel("Y Count");    
    cp5.getController("yCount").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
       
    cp5.addSlider("xSpace").setPosition(25, 330).setSize(305, 20).setRange(1, 100).setValue(25).setCaptionLabel("X-Space");
    cp5.getController("xSpace").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("ySpace").setPosition(25, 365).setSize(305, 20).setRange(1, 100).setValue(25).setCaptionLabel("Y-Space");    
    cp5.getController("ySpace").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    //////////////// WAVE
    cp5.addSlider("yWaveOffset").setPosition(25, 510).setSize(150, 20).setRange(-PI/4, PI/4).setValue(0).setCaptionLabel("Offset");    
    cp5.getController("yWaveOffset").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("yWaveSpeed").setPosition(25, 545).setSize(150, 20).setRange(-1, 1).setValue(0).setCaptionLabel("Speed");    
    cp5.getController("yWaveSpeed").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("xWaveOffset").setPosition(180, 510).setSize(150, 20).setRange(-PI/4, PI/4).setValue(0).setCaptionLabel("Offset");    
    cp5.getController("xWaveOffset").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("xWaveSpeed").setPosition(180, 545).setSize(150, 20).setRange(-1, 1).setValue(0).setCaptionLabel("Speed");    
    cp5.getController("xWaveSpeed").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("waveSize").setPosition(25, 600).setSize(300, 20).setRange(0, 200).setValue(0).setCaptionLabel("Size");    
    cp5.getController("waveSize").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.setColorBackground(color(220))
       .setColorForeground(color(30))
       .setColorActive(color(30))
       .setColorCaptionLabel(color(0))
       .setFont(uiFontSys1);
       
    cp6.setColorBackground(color(220))
       .setColorForeground(color(30))
       .setColorActive(color(30))
       .setColorCaptionLabel(color(30))
       .setColorValueLabel(color(30))
       .setFont(uiFontSys2);
  }

  public void draw() {
    if(fillField){
      coreString = cp6.get(Textfield.class,"mainInput").getText();      ///////// PROBLEM AREA? Does this alwyas need to be running?
    } else if(cp6.get(Textfield.class,"mainInput").getText().length() != coreString.length()){
      splitInputIntoArray();
    }
    
    background(uiBkgdColor);
    
    noStroke();
    fill(uiForeColor);
    
    push();
      translate(25, 65);
            
      textFont(uiFontMain);
      textSize(50);
      text("QUILT", 0, 0);
      
      textFont(uiFontMain);
      textSize(16);
      text("TEXT", 0, 40);
      
      text("FIELD", 0, 180);

      text("WAVE", 0, 420);
      
      textFont(uiFontSub);
      textSize(12);
      text("Vertical", 0, 440);
      text("Horizontal", 155, 440);
     
      textFont(uiFontMain);
      textSize(16);
      text("CAMERA", 0, 650);
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
      //cp5.getController("xCount").setVisible(true);
      //cp5.getController("yCount").setVisible(true);
      cp5.getController("xCount").setLock(false);
      cp5.getController("yCount").setLock(false);
      
      cp5.getController("xCount").setColorForeground(color(30));
      cp5.getController("xCount").setColorCaptionLabel(color(0));
      cp5.getController("yCount").setColorForeground(color(30));      
      cp5.getController("yCount").setColorCaptionLabel(color(0));
    } else {
      xCountHold = xCount;
      yCountHold = yCount;

      splitInputIntoArray(); 

      //cp5.getController("xCount").setVisible(false);
      //cp5.getController("yCount").setVisible(false);
      cp5.getController("xCount").setLock(true);
      cp5.getController("yCount").setLock(true);
      
      cp5.getController("xCount").setColorForeground(color(200));
      cp5.getController("xCount").setColorCaptionLabel(color(200));
      cp5.getController("yCount").setColorForeground(color(200));      
      cp5.getController("yCount").setColorCaptionLabel(color(200));
    }
    //cp5.getController("xCount").setValue(xCount);
    //cp5.getController("yCount").setValue(yCount);
  }
  public void xCount(int n){ xCount = n; }
  public void yCount(int n){ yCount = n; }
  public void xSpace(float n){ xSpace = n; }
  public void ySpace(float n){ ySpace = n; }
  
  public void yWaveOffset(float n){ yWaveOffset = n; }
  public void yWaveSpeed(float n){ yWaveSpeed = n; }
  public void xWaveOffset(float n){ xWaveOffset = n; }
  public void xWaveSpeed(float n){ xWaveSpeed = n; }  
  
  public void waveSize(float n){ waveSize = n; }
  
  public void splitInputIntoArray(){
    coreString = cp6.get(Textfield.class,"mainInput").getText();
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
