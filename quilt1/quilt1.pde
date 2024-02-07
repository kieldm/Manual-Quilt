import controlP5.*;
ControlP5 cp5;

color bkgdColor = #0000ff;
color foreColor = #ffffff;
color uiBkgdColor = #ffffff;
color uiForeColor = #000000;

PFont uiFontMain, uiFontSub, uiFontSys;
PFont genFont;

ControlApplet controls;

String coreString = "BETTER BY DESIGN ";

Field coreFlag;
int xCount = 20;
int yCount = 20;
float xSpace = 25;
float ySpace = 25;

float pgTextSize = 20;

void settings(){
  size(1080, 1080, P3D);
  smooth(8);  
}

void setup() {
  uiFontMain = createFont("Inter-Black.ttf", 100);
  uiFontSub = createFont("Inter-Medium.ttf", 100);
  uiFontSys = createFont("Inter-Medium.ttf", 10);
  
  genFont = createFont("STKBureau-Sans-Book-Trial.otf", 100);
  
  controls = new ControlApplet();

  textMode(SHAPE);

  surface.setTitle("Main");
  surface.setResizable(false);
  surface.setLocation(410, 10);
  
  coreFlag = new Field();
}

void draw(){
  background(bkgdColor);
  
  push();
    translate(width/2, height/2);
        
    coreFlag.run();
  pop();
}
