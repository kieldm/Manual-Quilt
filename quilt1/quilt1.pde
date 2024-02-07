import controlP5.*;
ControlP5 cp5, cp6;

color bkgdColor = #0000ff;
color foreColor = #ffffff;
color uiBkgdColor = #ffffff;
color uiForeColor = #000000;

PFont uiFontMain, uiFontSub, uiFontSys1, uiFontSys2;
PFont genFont;

ControlApplet controls;

String coreString = "BETTER BY DESIGN ";
int lineMax = 10;
String[] coreStringArray = new String[lineMax];

Field coreFlag;
int xCount = 20;
int xCountHold = xCount;
int yCount = 20;
int yCountHold = yCount;
float xSpace = 25;
float ySpace = 25;

float pgTextSize = 20;

boolean fillField = true;

void settings(){
  size(1080, 1080, P3D);
  smooth(8);  
}

void setup() {
  uiFontMain = createFont("Inter-Black.ttf", 100);
  uiFontSub = createFont("Inter-Medium.ttf", 100);
  uiFontSys1 = createFont("Inter-Medium.ttf", 10);
  uiFontSys2 = createFont("Inter-Medium.ttf", 20);
  
  genFont = createFont("STKBureau-Sans-Book-Trial.otf", 100);
  
  controls = new ControlApplet();

  textMode(SHAPE);

  surface.setTitle("Main");
  surface.setResizable(false);
  surface.setLocation(400, 10);
  
  coreFlag = new Field();
}

void draw(){
  background(bkgdColor);
  
  push();
    translate(width/2, height/2);
        
    coreFlag.run();
  pop();
}
