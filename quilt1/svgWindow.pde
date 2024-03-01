class SvgWindow extends PApplet {  
  public SvgWindow() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(int(coreCanvasW), int(coreCanvasH), P3D);
    smooth(8);
  }

  public void setup() { 
    frameRate(30);
      
    surface.setTitle("SVG Window");
    surface.setResizable(false);
    surface.setLocation(10, 10);
    
    svgFlag = new Field();
    textMode(SHAPE);
  }

  public void draw() {
    String saveTag = "quiltVector_" + day() + minute() + second();
    beginRaw(SVG, "./export/" + saveTag + ".svg");
       
    background(0,0,255);

    if(!swatchSel[8]){
      push();          /////////// draws background rect that's the same size as canvas size
        noStroke();
        fill(bkgdColorActual);
        translate(width/2, height/2, projZdist);
          println("width/2: " + width/2 + ", height/2: " + height/2);

        rectMode(CENTER);
        rect(0, 0, width * projZFact, height * projZFact);
        fill(0,0,255);
        ellipse(0, 0, 10, 10);
      pop();
    }
    
    scale(1.0/float(pixelRes));
    
    svgFlag.displaySVG();
    
    endRaw();
    
    println("SVG COMPLETE. RESTARTING.");
  
    noLoop();
    
    //String thisPath = sketchPath();
    //println(thisPath);
    //saveFrame("testtest1.jpg");
  } 
}
