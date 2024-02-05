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
    
    cp5.addSlider("xCount")
       .setPosition(25, 340)
       .setSize(350, 40)
       .setFont(uiFontSub)
       .setRange(1, 50);
  }

  public void draw() {
    background(125);
    
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
      
      translate(0, 200);
      text("FIELD", 0, 0);
      text("X Count", 0, 10);      
      
      
    pop();    
  }
}
