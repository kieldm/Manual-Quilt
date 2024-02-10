import controlP5.*;
import processing.svg.*;
ControlP5 cp5, cp6, cp7;


color bkgdColor = #FEF9F3;
color foreColor = #000000;
color uiBkgdColor = #ffffff;
color uiForeColor = #000000;

PFont uiFontHead, uiFontMain, uiFontSub, uiFontSys1, uiFontSys2;
PFont genFont;

int canvasWidth, canvasHeight;
int currentWidth, currentHeight;

ControlApplet controls;

String coreString = "BETTER BY DESIGN";
int lineMax = 10;
String[] coreStringArray = new String[lineMax];
PImage[] swatch = new PImage[11];

Field coreFlag;
int xCount = 17;
int xCountHold = xCount;
int yCount = 20;
int yCountHold = yCount;
int loopLength = 0;

float xSpace, ySpace = 25;
float xWaveOffset, yWaveOffset, waveSize, waveSpeed = 0;
float cameraRotX, cameraRotY,cameraRotZ = 0;
float animatorRotX, animatorRotY, animatorRotZ = 0;
float animateRotX, animateRotY, animateRotZ = 0;
float animatorZoomZ, animateZoomZ = 0;
float pgTextSize = 20;
float coreScale = 1;
float projZdist = -2000;
float projZFact = 3.13833429;

boolean wave3D = true;
boolean fillField = true;
boolean animateCamera = false;
boolean exportSVGtoggle = false;
boolean exportSeqToggle = false;

String seqTag;
int seqCount = 0;
int seqCap = 0;

//boolean drawOn = true;
//int drawCap = 0;

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

  if(exportSVGtoggle){
    String saveTag = "quiltVector_" + day() + minute() + second();
    beginRaw(SVG, "export/svg" + saveTag + ".svg");

    push();
      noStroke();
      fill(bkgdColor);
      translate(width/2, height/2, -2000);
      rectMode(CENTER);
      rect(0, 0, width * projZFact, height * projZFact);
    pop();
  }
  
  push();
    translate(width/2, height/2);
    
    // ANIMATE CAMERA
    if(animateCamera && wave3D){
      cameraAnimation();
      translate(0, 0, animatorZoomZ);
      
      rotateX(animatorRotX);
      rotateY(animatorRotY);
      rotateZ(animatorRotZ);
    }
        
    // CAMERA
    if(wave3D){
      rotateX(cameraRotX);
      rotateY(cameraRotY);
      rotateZ(cameraRotZ);    
    }

    // SCALE
    scale(coreScale);
    
    coreFlag.run();
  pop();

  //float tk0 = map(frameCount, 0, loopLength, 0, 1);
  //drawCap = round(map(easeOutExpo(tk0), 0, 1, 0, yCount));
  //drawCap += 3;

  if(currentHeight != canvasHeight || currentWidth != canvasWidth){
    resizeWindow();
  }
  
  if(exportSeqToggle){
    saveFrame("export/sequence/" + seqTag + "/quiltFrame-###.png");
    seqCount++;
    
    if(seqCount >= seqCap){
      exportSeqToggle = false;
    }
  }
  
  if(exportSVGtoggle){
    endRaw();
    exportSVGtoggle = false;
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
