class ControlApplet extends PApplet {
  public ControlApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(400, 800, P3D);
    smooth(8);
  }

  public void setup() { 
    surface.setTitle("Controls");
    surface.setResizable(false);
    surface.setLocation(10, 10);
    
    cp5 = new ControlP5(this);
    
    cp5.addTextfield("mainInput")
       .setPosition(25, 150)
       .setSize(300, 40)
       .setValue("BETTER BY DESIGN")
       .setAutoClear(false)
       .setCaptionLabel("");
    
    cp5.addSlider("xCount")
       .setPosition(25, 310)
       .setSize(300, 20)
       .setRange(1, 50)
       .setValue(20)
       .setCaptionLabel("X Count");
       
    cp5.addSlider("yCount")
       .setPosition(25, 335)
       .setSize(300, 20)
       .setRange(1, 50)
       .setValue(20)
       .setCaptionLabel("Y Count");
       
    cp5.setColorBackground(color(200))
       .setColorForeground(color(0))
       .setColorActive(color(0))
       .setColorCaptionLabel(color(0))
       .setFont(uiFontSys);
  }

  public void draw() {
    background(uiBkgdColor);
    
    noStroke();
    fill(uiForeColor);
    
    push();
      translate(25, 60);
            
      textFont(uiFontMain);
      textSize(50);
      text("QUILT", 0, 0);
      
      translate(0, 40);
      textFont(uiFontSub);
      textSize(14);
      text("TEXT", 0, 0);
      
      translate(0, 140);
      text("FIELD", 0, 0);

      translate(0, 240);
      text("WAVE", 0, 0);
     
      translate(0, 340);
      text("CAMERA", 0, 0);
    pop();    
  }
  
  public void xCount(int n){ xCount = n; }
  public void yCount(int n){ yCount = n; }
}
