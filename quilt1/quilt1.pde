import controlP5.*;
import processing.svg.*;

import com.hamoid.*;
VideoExport videoExport;

color bkgdColorActual = #FEF9F3;
color bkgdColor = #FEF9F3;
color bkgdColorAnim = #FEF9F3;
color foreColor = #000000;
color foreColorActual = #000000;
color foreColorAnim = #202A79;
color uiBkgdColor = color(50);
color uiForeColor = #ffffff;
PFont uiFontHead, uiFontMain, uiFontSub, uiFontSys1, uiFontSys2;
PFont genFont, genFontHeadline;

int canvasWidth, canvasHeight;
int currentWidth, currentHeight;

String coreString = "BETTER CLIMATE BY DESIGN";
int lineMax = 10;
String[] coreStringArray = new String[lineMax];
PImage[] swatch = new PImage[11];
boolean[] swatchSel = new boolean[12];
boolean[] swatchAnimSel = new boolean[12];

Field coreFlag;
Field svgFlag;
int xCount = 17;
int xCountHold = xCount;
int yCount = 20;
int yCountHold = yCount;
int loopLength = 0;

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
float projZdist = -2000;
float projZFact = 3.13833429;

boolean wave3D = true;
boolean headlineMode = false;
boolean animateCamera = false;
boolean animateColor = false;
boolean radialWave = false;
boolean exportSVGtoggle = false;
boolean exportSeqToggle = false;
boolean exportMP4toggle = false;
int justifyMode = 0;

String seqTag;
int seqCount = 0;
int seqCap = 0;

int uiWidth = 340;
int padding = 30;
int boardWidth = 1700 - uiWidth - padding * 2;
int boardHeight = 1000 - padding * 2;
PGraphics coreCanvas;
float coreCanvasW = 1080;
float coreCanvasH = 1080;
float coreRatio = coreCanvasH/coreCanvasW;
float displayCoreH = boardHeight;
float displayCoreW = displayCoreH/coreRatio;
float imageScale = round((displayCoreH/coreCanvasH) * 100);

ControlP5 cp5;
Toggle headlineToggle;
RadioButton justifyRadio;
Slider xCountSlider, yCountSlider;
Toggle waveDimensionToggle;
Toggle animateColorToggle;
Slider xWaveOffsetSlider, yWaveOffsetSlider;
Slider radialOffsetSlider;
Toggle radialWaveToggle;
Toggle animateCameraToggle;
Slider waveSizeSlider;
Slider cameraRotXSlider, cameraRotYSlider, cameraRotZSlider;
Slider cameraPosXSlider;
Slider animateRotXSlider, animateRotYSlider, animateRotZSlider;
Slider animateZoomZSlider, animatePosXSlider;
Textfield mainInputText;
Button[] swatchButton = new Button[11];
Button[] swatchAnimButton = new Button[11];

void setup() {
  size(1700, 1000, P3D);
  canvasWidth = 1080;
  canvasHeight = 1080;
  currentWidth = canvasWidth;
  currentHeight = canvasHeight;
  
  smooth(8);
  
  uiFontHead= createFont("STKBureau-Sans-Book-Trial.otf", 60);
  uiFontMain = createFont("STKBureau-Sans-Book-Trial.otf", 20);
  uiFontSub = createFont("IBMPlexMono-Medium.otf", 10);
  uiFontSys1 = createFont("IBMPlexMono-Medium.otf", 10);
  uiFontSys2 = createFont("IBMPlexMono-Medium.otf", 14);
  
  genFont = createFont("STKBureau-Sans-Book-Trial.otf", pgTextSize);
  genFontHeadline = createFont("STKBureau-Serif-Book-Trial.otf", pgTextSize);
  //genFont = createFont("STKBureau-Sans-Light-Trial.otf", pgTextSize);
  
  for(var n = 0; n < 11; n++){
    swatch[n] = loadImage("swatch_main" + n + ".png");
  }
  
  drawControls();

  resetSwatch();
  swatchSel[1] = true;
  resetSwatchAnim();
  swatchAnimSel[5] = true;
  
  coreCanvas = createGraphics(int(coreCanvasW), int(coreCanvasH), P3D);
  coreCanvas.smooth(4);

  frameRate(30);

  surface.setTitle("Main");
  surface.setResizable(true);
  surface.setLocation(10, 10);
    
  coreFlag = new Field();
}

void draw(){
  if(!headlineMode){        ///////////////////////////////////// MAKE THE TEXTFIELD APPEAR TO BE LIVE
    if(mainInputText.getText().length() == 0){
      mainInputText.setText(" ");
      coreString = " ";
    } else {
      coreString = mainInputText.getText();
    }
  } else if(mainInputText.getText().length() != coreString.length()){
    splitInputIntoArray();
  }
  
  if(exportSVGtoggle){      //////////////////////////////////////////////////////////////////////// SVG EXPORE   
    drawSVG();
  } else {      ///////////////////////////////////////////////////////////////////////////////////// REGULAR DISPLAY
    background(uiBkgdColor);
    
    coreCanvas.beginDraw();
    coreCanvas.textMode(SHAPE); 
  
    drawUI();
  
    coreCanvas.background(bkgdColorActual);
      
    coreFlag.run();
    
    coreCanvas.endDraw();
  
    push();
      translate(uiWidth + padding + boardWidth/2, padding + boardHeight/2);
      
      noFill();
      stroke(0,175);
      strokeWeight(0.5);
      rectMode(CENTER);
      rect(0, 0, boardWidth, boardHeight, 10);
          
      image(coreCanvas, -displayCoreW/2, -displayCoreH/2, displayCoreW, displayCoreH);
    pop();
      
    noStroke();
    if(exportMP4toggle || exportSeqToggle){
      fill(255,0,0);
      rect(uiWidth + padding, height - padding/2 + 5, boardWidth, -20);
      fill(255);
      text("RENDERING",uiWidth + padding, height - padding/2 + 2);
    } else {
      fill(0,175);
      textFont(uiFontSys2);
      text("SCALE: " + imageScale + "%", uiWidth + padding, height - padding/2);
    }
  }
  
  if(exportSeqToggle){
    coreCanvas.save("export/sequence/" + seqTag + "/quiltFrame-" + seqCount + ".png");
    seqCount++;
    
    if(seqCount >= seqCap){
      exportSeqToggle = false;
    }
  }
    
  if(exportMP4toggle){
    videoExport.saveFrame();
    seqCount++;
    
    if(seqCount >= seqCap){
      videoExport.endMovie();
      exportMP4toggle = false;
    }
  }
  
  colorAnimation();
}

void drawSVG(){
    String saveTag = "quiltVector_" + day() + minute() + second();
    beginRaw(SVG, "export/svg/" + saveTag + ".svg");
  
    push();          /////////// draws background rect that's the same size as canvas size
      noStroke();
      fill(bkgdColorActual);
      translate(width/2, height/2, -2000);
      rectMode(CENTER);
      rect(0, 0, width * projZFact, height * projZFact);
    pop();
    
    svgFlag.displaySVG();
    
    endRaw();
    
    exportSVGtoggle = false;
    println("SVG COMPLETE. RESTARTING.");
    setup();
    //exit();
    //println("DID IT RESIZE?");
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
  for(var m = 0; m < 12; m++){ swatchSel[m] = false;}
}
void resetSwatchAnim(){
  for(var m = 0; m < 12; m++){ swatchAnimSel[m] = false;}
}

  
