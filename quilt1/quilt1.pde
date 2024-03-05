import controlP5.*;
import processing.svg.*;

import com.hamoid.*;
VideoExport videoExport;

color bkgdColorActual = #FEF9F3;
color bkgdColor = #FEF9F3;
color bkgdColorAnim = #6497F9;
color foreColor = #000000;
color foreColorActual = #000000;
color foreColorAnim = #D8F4F7;

color allBkgdColor = #323232;
color uiBkgdColor = #444444;
color uiForeColor = #ffffff;
color uiAccentColor = #6c6c6c;
color uiAccentHR = #2f2f2f;
color testColor = color(0, 0, 255);

PFont uiFontHead, uiFontMain, uiFontSys;
PFont genFont, genFontHeadline;

int canvasWidth, canvasHeight;

String coreString = "BETTER CLIMATE BY DESIGN";
int lineMax = 10;
String[] coreStringArray = new String[lineMax];
int swatchCount = 10;
PImage[] swatch = new PImage[swatchCount];
boolean[] swatchSel = new boolean[swatchCount];
boolean[] swatchAnimSel = new boolean[swatchCount];

Field coreFlag;

int xCount = 17;
int xCountHold = xCount;
int yCount = 20;
int yCountHold = yCount;
int loopLength = 0;

int pixelRes = 1;

float xSpace, ySpace = 25;
float xWaveOffset, yWaveOffset, radialOffset, waveSize, waveSpeed = 0;
float cameraRotX, cameraRotY,cameraRotZ = 0;
float cameraPosX;
float animatorRotX, animatorRotY, animatorRotZ = 0;
float animateRotX, animateRotY, animateRotZ = 0;
float animatorZoomZ, animateZoomZ = 0;
float animatorPosX, animatePosX = 0;
float pgTextSize = 20;
float coreScale = 1;

boolean wave3D = true;
boolean fillFieldMode = false;
boolean animateCamera = false;
boolean animateColor = false;
boolean radialWave = false;
boolean exportSVGtoggle = false;
boolean exportSeqToggle = false;
boolean exportMP4toggle = false;
boolean scrubMode = false;
boolean justifyMode = false;
int scrubbed = 0;

String seqTag;
int seqCount = 0;
int seqCap = 0;

int uiWidth = 430;
int uiHeight = 500;
float uiUnit;
int padding = 25;
int boardHeightPadding = 80;
int boardWidth, boardHeight;
PGraphics coreCanvas;
float coreCanvasW = 1080;
float coreCanvasH = 1080;
float coreRatio = coreCanvasH/coreCanvasW;
float displayCoreH, displayCoreW, imageScale;

float uiLeftRule;

PImage quiltLogo;

private ControlP5 cp5;
private Textfield widthField, heightField;
private Toggle fillFieldToggle;
private Toggle justifyToggle;
private Slider xCountSlider, yCountSlider;
private Slider xSpaceSlider, ySpaceSlider;
private Toggle waveDimensionToggle;
private Toggle animateColorToggle;
private Slider xWaveOffsetSlider, yWaveOffsetSlider;
private Slider coreScaleSlider, radialOffsetSlider;
private Toggle radialWaveToggle;
private Toggle animateCameraToggle;
private Slider waveSizeSlider;
private Toggle scrubToggle;
private Slider scrubSlider;
private Slider loopLengthSlider;
private Slider cameraRotXSlider, cameraRotYSlider, cameraRotZSlider;
private Slider cameraPosXSlider;
private Slider animateRotXSlider, animateRotYSlider, animateRotZSlider;
private Slider animateZoomZSlider, animatePosXSlider;
private Textfield mainInputText;
private Button resetCamera, exportSVG, exportSeq, exportMP4;
private Button[] preset = new Button[6];
private Button[] swatchButton = new Button[10];
private Button[] swatchAnimButton = new Button[10];

void settings(){
  size(displayWidth, displayHeight, P3D);
  smooth(8);
  
  pixelRes = displayDensity();
  
  pixelDensity(pixelRes);  
}

void setup() {
  //size(1700, 1000, P3D);
  //smooth(8);
  
  textMode(SHAPE);
  
  background(uiBkgdColor);
  
  configureLayoutSizes();
  
  canvasWidth = 1080;
  canvasHeight = 1080;
  
  uiFontHead= createFont("Quilt-SansBook.otf", 60);
  uiFontMain = createFont("Quilt-SansBook.otf", 12);
  uiFontSys = createFont("Quilt-SansBook.otf", 6);
  
  genFont = createFont("Quilt-SansBook.otf", pgTextSize);
  genFontHeadline = createFont("STKBureau-Serif-Book-Trial.otf", pgTextSize);
  
  quiltLogo = loadImage("data/quilt_logo.png");
  //quiltLogo.disableStyle();
  
  for(var n = 0; n < swatchCount; n++){
    swatch[n] = loadImage("swatch_main" + n + ".png");
  }
  
  resetSwatch();
  swatchSel[2] = true;
  resetSwatchAnim();
  swatchAnimSel[6] = true;
  
  if(frameCount < 5){
    drawControls();
  }
  
  coreCanvas = createGraphics(int(coreCanvasW), int(coreCanvasH), P3D);
  coreCanvas.smooth(4);

  frameRate(30);

  surface.setTitle("Kinetic Type Generator");
  surface.setResizable(true);
  //surface.setLocation(10, 10);
    
  coreFlag = new Field();
}

void draw(){
  if(fillFieldMode){        ///////////////////////////////////// MAKE THE TEXTFIELD APPEAR TO BE LIVE
    if(mainInputText.getText().length() == 0){
      mainInputText.setText(" ");
      coreString = " ";
    } else {
      coreString = mainInputText.getText();
    }
  } else if(mainInputText.getText().length() != coreString.length()){
    splitInputIntoArray();
  }
  
  background(allBkgdColor);
  
  coreCanvas.beginDraw();
  
  if(exportMP4toggle || exportSeqToggle){
    coreCanvas.scale(1/float(pixelRes));
  }
  
  coreCanvas.textMode(SHAPE); 

  if(swatchSel[9]){
    coreCanvas.background(0,0,0,0);
  } else {
    coreCanvas.background(bkgdColorActual);
  }      
    
  coreFlag.run();
  
  coreCanvas.endDraw();

  push();
    translate(padding + boardWidth/2, padding + boardHeightPadding + boardHeight/2);
    
    //noFill();
    //stroke(255, 0, 0);
    //strokeWeight(0.5);
    //rectMode(CENTER);
    //rect(0, 0, boardWidth, boardHeight, 10);
        
    image(coreCanvas, -displayCoreW/2, -displayCoreH/2, displayCoreW, displayCoreH);
  pop();
    
  drawUI();  
    
  noStroke();
  if(exportMP4toggle || exportSeqToggle){
    fill(255,0,0);
    rect(padding, height - padding, boardWidth, -20);
    fill(255);
    text("RENDERING, " + seqCount + " frames of " + seqCap, padding + 5, height - padding - 6);
  }
  
  if(exportSeqToggle){
    coreCanvas.save("export/sequence/" + seqTag + "/quiltFrame-" + seqCount + ".png");
    seqCount++;
    
    if(seqCount >= seqCap){
      exportSeqToggle = false;
      
      canvasResizer();
    }
  }
    
  if(exportMP4toggle){
    videoExport.saveFrame();
    seqCount++;
    
    if(seqCount >= seqCap){
      videoExport.endMovie();
      exportMP4toggle = false;
      
      canvasResizer();
    }
  }
  
  colorAnimation();
}

void colorAnimation(){
  if(animateColor){
    float waver = map(sinEngine(0,0,waveSpeed/2,1), -1, 1, 0, 1);
    bkgdColorActual = lerpColor(bkgdColor, bkgdColorAnim, waver);
    foreColorActual = lerpColor(foreColor, foreColorAnim, waver);  
  } else {
    bkgdColorActual = bkgdColor;
    foreColorActual = foreColor;
  }
}

void resetSwatch(){
  for(var m = 0; m < swatchCount; m++){ swatchSel[m] = false;}
}
void resetSwatchAnim(){
  for(var m = 0; m < swatchCount; m++){ swatchAnimSel[m] = false;}
}

void windowResized(){
  configureLayoutSizes();

  rePositionControls();
}
  
void configureLayoutSizes(){
  boardWidth = width - uiWidth - padding * 3;
  boardHeight = height - padding * 2 - boardHeightPadding * 2;
  
  displayCoreH = boardHeight;
  displayCoreW = displayCoreH/coreRatio;
  
  uiHeight = height - padding * 2;
  uiUnit = uiHeight/36;
  println(uiUnit);
  uiLeftRule = width - uiWidth - padding + 20;
}
