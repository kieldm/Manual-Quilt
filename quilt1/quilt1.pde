import controlP5.*;
ControlP5 cp5, cp6, cp7;
RadioButton r1;

color bkgdColor = #FEF9F3;
color foreColor = #000000;
color uiBkgdColor = #ffffff;
color uiForeColor = #000000;

PFont uiFontHead, uiFontMain, uiFontSub, uiFontSys1, uiFontSys2;
PFont genFont;

int canvasWidth, canvasHeight;
int currentWidth, currentHeight;

ControlApplet controls;

String coreString = "BETTER BY DESIGN ";
int lineMax = 10;
String[] coreStringArray = new String[lineMax];
PImage[] swatch = new PImage[11];

Field coreFlag;
int xCount = 17;
int xCountHold = xCount;
int yCount = 20;
int yCountHold = yCount;
float xSpace = 25;
float ySpace = 25;

float xWaveOffset = 0;
float yWaveOffset = 0;
float waveSize = 0;

int loopLength = 0;
float waveSpeed = 0;

float cameraRotX = 0;
float cameraRotY = 0;
float cameraRotZ = 0;

float animatorRotX = 0;
float animatorRotY = 0;
float animatorRotZ = 0;
float animateRotX = 0;
float animateRotY = 0;
float animateRotZ = 0;
float animatorZoomZ = 0;
float animateZoomZ = 0;

float pgTextSize = 20;
float coreScale = 1;

boolean fillField = true;
boolean animateCamera = false;

void settings(){
  size(1080, 1080, P3D);
  canvasWidth = 1080;
  canvasHeight = 1080;
  currentWidth = canvasWidth;
  currentHeight = canvasHeight;
  
  smooth(8);
}

void setup() {
  uiFontHead= createFont("STKBureau-Sans-Book-Trial.otf", 60);
  uiFontMain = createFont("STKBureau-Sans-Book-Trial.otf", 50);
  uiFontSub = createFont("IBMPlexMono-Medium.otf", 50);
  uiFontSys1 = createFont("IBMPlexMono-Medium.otf", 10);
  uiFontSys2 = createFont("IBMPlexMono-Medium.otf", 20);
  
  genFont = createFont("STKBureau-Sans-Book-Trial.otf", 100);
  
  for(var n = 0; n < 11; n++){
    swatch[n] = loadImage("swatch_main" + n + ".png");
  }
  
  controls = new ControlApplet();

  textMode(SHAPE);
  frameRate(30);

  surface.setTitle("Main");
  surface.setResizable(false);
  surface.setLocation(400, 10);
  
  coreFlag = new Field();
}

void draw(){
  background(bkgdColor);
  
  push();
    translate(width/2, height/2);
    
    // ANIMATE CAMERA
    if(animateCamera){
      cameraAnimation();
      translate(0, 0, animatorZoomZ);
      
      rotateX(animatorRotX);
      rotateY(animatorRotY);
      rotateZ(animatorRotZ);
    }
        
    // CAMERA
    rotateX(cameraRotX);
    rotateY(cameraRotY);
    rotateZ(cameraRotZ);
        
    // SCALE
    scale(coreScale);
    
    coreFlag.run();
  pop();

  if(currentHeight != canvasHeight || currentWidth != canvasWidth){
    resizeWindow();
  }
  

}

void cameraAnimation(){
  float waver = sinEngine(0,0,waveSpeed/2,1);
  animatorRotX = waver * animateRotX;
  animatorRotY = waver * animateRotY;
  animatorRotZ = waver * animateRotZ;
  animatorZoomZ = waver * animateZoomZ;
}

void resizeWindow(){
  if(canvasWidth < 10){ canvasWidth = 100; }
  if(canvasHeight < 10){ canvasHeight = 100; }
  println("RESIZED!");
  surface.setSize(canvasWidth, canvasHeight);
  currentWidth = canvasWidth;
  currentHeight = canvasHeight;
}
