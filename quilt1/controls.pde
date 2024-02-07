class ControlApplet extends PApplet {
  public ControlApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(360, 800, P3D);
    smooth(8);
  }

  public void setup() { 
    surface.setTitle("Controls");
    surface.setResizable(false);
    surface.setLocation(10, 10);
    
    cp5 = new ControlP5(this);
    cp6 = new ControlP5(this);
    
    cp6.addTextfield("mainInput")
       .setPosition(25, 110)
       .setSize(300, 32)
       .setValue("BETTER BY DESIGN ")
       .setAutoClear(false)
       .setCaptionLabel("");
       
    cp5.addToggle("fillField")
       .setPosition(25, 150)
       .setSize(60, 20)
       .setValue(true)
       .setCaptionLabel("Fill Field");
    cp5.getController("fillField").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    cp5.addSlider("xCount")
       .setPosition(25, 250)
       .setSize(300, 20)
       .setRange(1, 50)
       .setValue(20)
       .setCaptionLabel("X Count");
    cp5.getController("xCount").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("yCount")
       .setPosition(25, 285)
       .setSize(300, 20)
       .setRange(1, 50)
       .setValue(20)
       .setCaptionLabel("Y Count");    
    cp5.getController("yCount").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
       
    cp5.addSlider("xSpace")
       .setPosition(25, 330)
       .setSize(300, 20)
       .setRange(1, 100)
       .setValue(25)
       .setCaptionLabel("X-Space");
    cp5.getController("xSpace").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("ySpace")
       .setPosition(25, 365)
       .setSize(300, 20)
       .setRange(1, 100)
       .setValue(25)
       .setCaptionLabel("Y-Space");    
    cp5.getController("ySpace").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
       
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
      
      translate(0, 40);
      textFont(uiFontSub);
      textSize(16);
      text("TEXT", 0, 0);
      
      translate(0, 140);
      text("FIELD", 0, 0);
      if(fillField == false) {
        noFill();
        stroke(125);
        
        rect(0, 10, 300, 65);
        line(0, 10, 300, 75);
        line(300, 10, 0, 75);
      }

      translate(0, 240);
      text("WAVE", 0, 0);
     
      translate(0, 340);
      text("CAMERA", 0, 0);
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
    } else {
      xCountHold = xCount;
      yCountHold = yCount;

      splitInputIntoArray(); 

      //cp5.getController("xCount").setVisible(false);
      //cp5.getController("yCount").setVisible(false);
      cp5.getController("xCount").setLock(true);
      cp5.getController("yCount").setLock(true);
    }
    //cp5.getController("xCount").setValue(xCount);
    //cp5.getController("yCount").setValue(yCount);
  }
  public void xCount(int n){ xCount = n; }
  public void yCount(int n){ yCount = n; }
  public void xSpace(float n){ xSpace = n; }
  public void ySpace(float n){ ySpace = n; }
  //public void mainInput(String s) {        ////////// WOULD LOVE THIS TO BE LIVE AND RESPONSIVE; as you type it refreshes
  //  coreString = s;
  //  if(fillField == false){
  //    xCountHold = xCount;
  //    yCountHold = yCount;
  //    xCount = coreString.length();
  //    yCount = 1;    
  //  }
  //}
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
