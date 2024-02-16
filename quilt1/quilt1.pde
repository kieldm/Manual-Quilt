import controlP5.*;
import processing.svg.*;

import com.hamoid.*;
VideoExport videoExport;

color bkgdColorActual = #FEF9F3;
color bkgdColor = #FEF9F3;
color bkgdColorAnim = #FEF9F3;
color foreColorActual = #000000;
color foreColor = #000000;
color foreColorAnim = #202A79;
color uiBkgdColor = color(50);
color uiForeColor = #ffffff;
PFont uiFontHead, uiFontMain, uiFontSub, uiFontSys1, uiFontSys2;
PFont genFont;

int canvasWidth, canvasHeight;
int currentWidth, currentHeight;

String coreString = "BETTER BY DESIGN";
int lineMax = 10;
String[] coreStringArray = new String[lineMax];
PImage[] swatch = new PImage[11];
boolean[] swatchSel = new boolean[12];
boolean[] swatchAnimSel = new boolean[12];

Field coreFlag;
int xCount = 17;
int xCountHold = xCount;
int yCount = 20;
int yCountHold = yCount;
int loopLength = 0;

float xSpace, ySpace = 25;
float xWaveOffset, yWaveOffset, radialOffset, waveSize, waveSpeed = 0;
float cameraRotX, cameraRotY,cameraRotZ = 0;
float animatorRotX, animatorRotY, animatorRotZ = 0;
float animateRotX, animateRotY, animateRotZ = 0;
float animatorZoomZ, animateZoomZ = 0;
float animatorPosX, animatePosX = 0;
float pgTextSize = 20;
float coreScale = 1;
float projZdist = -2000;
float projZFact = 3.13833429;

boolean wave3D = true;
boolean fillField = true;
boolean animateCamera = false;
boolean animateColor = false;
boolean radialWave = false;
boolean exportSVGtoggle = false;
boolean exportSeqToggle = false;
boolean exportMP4toggle = false;

String seqTag;
int seqCount = 0;
int seqCap = 0;

int uiWidth = 340;
int padding = 30;
int boardWidth = 1920 - uiWidth - padding * 2;
int boardHeight = 1080 - padding * 2;
PGraphics coreCanvas;
float coreCanvasW = 1080;
float coreCanvasH = 1080;
float coreRatio = coreCanvasH/coreCanvasW;
float displayCoreH = boardHeight;
float displayCoreW = displayCoreH/coreRatio;
float imageScale = round((displayCoreH/coreCanvasH) * 100);

  private ControlP5 cp5;
  private Toggle fillFieldToggle;
  private Slider xCountSlider, yCountSlider;
  private Toggle waveDimensionToggle;
  private Toggle animateColorToggle;
  private Slider xWaveOffsetSlider, yWaveOffsetSlider;
  private Slider radialOffsetSlider;
  private Toggle radialWaveToggle;
  private Toggle animateCameraToggle;
  private Slider cameraRotXSlider, cameraRotYSlider, cameraRotZSlider;
  private Slider animateRotXSlider, animateRotYSlider, animateRotZSlider;
  private Slider animateZoomZSlider, animatePosXSlider;
  private Textfield mainInputText;
  private Button[] swatchButton = new Button[11];
  private Button[] swatchAnimButton = new Button[11];

//boolean drawOn = true;
//int drawCap = 0;

//void settings(){  
  //coreCanvas.smooth(8); 
//}

void setup() {
  size(1920, 1080, P3D);
  //fullScreen(P3D);
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
  
  for(var n = 0; n < 11; n++){
    swatch[n] = loadImage("swatch_main" + n + ".png");
  }
  
    cp5 = new ControlP5(this);
    cp5.setColorBackground(color(60))
       .setColorForeground(color(150))
       .setColorActive(color(200))
       .setColorCaptionLabel(color(255))
       .setFont(uiFontSys1);

    // CANVAS
    Textfield canvasWidth = cp5.addTextfield("canvasWidth")
                               .setPosition(20, 100)
                               .setSize(60, 25)
                               .setValue("1080")
                               .setAutoClear(false)
                               .setColorBackground(color(0))
                               .setColorValueLabel(color(200))
                               .setFont(uiFontSys1)
                               .setCaptionLabel("Width");
    canvasWidth.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    canvasWidth.getValueLabel().setPaddingX(3);

    Textfield canvasHeight = cp5.addTextfield("canvasHeight")
                                .setPosition(85, 100)
                                .setSize(60, 25)
                                .setValue("1080")
                                .setAutoClear(false)
                                .setColorBackground(color(0))
                                .setColorValueLabel(color(200))
                                .setFont(uiFontSys1)
                                .setCaptionLabel("Height");
    canvasHeight.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    canvasHeight.getValueLabel().setPaddingX(3);
    
    // TEXT
    mainInputText = cp5.addTextfield("mainInput")
                             .setPosition(20, 170)
                             .setSize(310, 32)
                             .setValue("BETTER BY DESIGN")
                             .setAutoClear(false)
                             .setColorBackground(color(0))
                             .setColorValueLabel(color(255))
                             .setFont(uiFontSys2)
                             .setCaptionLabel("");
    mainInputText.getValueLabel().setPaddingX(2);
    
    fillFieldToggle = cp5.addToggle("fillField")
                                .setPosition(20, 205)
                                .setSize(60, 14)
                                .setValue(true)
                                .setCaptionLabel("Fill Field")
                                .setColorActive(color(#6497F9))
                                .setMode(ControlP5.SWITCH);
    fillFieldToggle.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    Slider coreScale = cp5.addSlider("coreScale")
                          .setPosition(20, 235)
                          .setSize(310, 14)
                          .setRange(0.1, 5)
                          .setValue(1.6)
                          .setCaptionLabel("Scale");
    coreScale.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    // COLOR
    animateColorToggle = cp5.addToggle("animateColor")
                             .setPosition(20,290)
                             .setSize(80,14)
                             .setValue(false)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(color(#374760))
                             .setCaptionLabel("Animate Color");
    animateColorToggle.getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(88);
    
    swatchButton[0] = cp5.addButton("swatch0").setPosition(35, 310).setSize(30, 30).setImage(swatch[0]);
    swatchButton[1] = cp5.addButton("swatch1").setPosition(70, 310).setSize(30, 30).setImage(swatch[1]);
    swatchButton[2] = cp5.addButton("swatch2").setPosition(105, 310).setSize(30, 30).setImage(swatch[2]);
    swatchButton[3] = cp5.addButton("swatch3").setPosition(140, 310).setSize(30, 30).setImage(swatch[3]);
    swatchButton[4] = cp5.addButton("swatch4").setPosition(175, 310).setSize(30, 30).setImage(swatch[4]);
    swatchButton[5] = cp5.addButton("swatch5").setPosition(210, 310).setSize(30, 30).setImage(swatch[5]);
    swatchButton[6] = cp5.addButton("swatch6").setPosition(35, 345).setSize(30, 30).setImage(swatch[6]);
    swatchButton[7] = cp5.addButton("swatch7").setPosition(70, 345).setSize(30, 30).setImage(swatch[7]);
    swatchButton[8] = cp5.addButton("swatch8").setPosition(105, 345).setSize(30, 30).setImage(swatch[8]);
    swatchButton[9] = cp5.addButton("swatch9").setPosition(140, 345).setSize(30, 30).setImage(swatch[9]);
    swatchButton[10] = cp5.addButton("swatch10").setPosition(175, 345).setSize(30, 30).setImage(swatch[10]);

    swatchAnimButton[0] = cp5.addButton("swatchAnim0").setPosition(35, 385).setSize(30, 30).setVisible(false).setImage(swatch[0]);
    swatchAnimButton[1] = cp5.addButton("swatchAnim1").setPosition(70, 385).setSize(30, 30).setVisible(false).setImage(swatch[1]);
    swatchAnimButton[2] = cp5.addButton("swatchAnim2").setPosition(105, 385).setSize(30, 30).setVisible(false).setImage(swatch[2]);
    swatchAnimButton[3] = cp5.addButton("swatchAnim3").setPosition(140, 385).setSize(30, 30).setVisible(false).setImage(swatch[3]);
    swatchAnimButton[4] = cp5.addButton("swatchAnim4").setPosition(175, 385).setSize(30, 30).setVisible(false).setImage(swatch[4]);
    swatchAnimButton[5] = cp5.addButton("swatchAnim5").setPosition(210, 385).setSize(30, 30).setVisible(false).setImage(swatch[5]);
    swatchAnimButton[6] = cp5.addButton("swatchAnim6").setPosition(35, 420).setSize(30, 30).setVisible(false).setImage(swatch[6]);
    swatchAnimButton[7] = cp5.addButton("swatchAnim7").setPosition(70, 420).setSize(30, 30).setVisible(false).setImage(swatch[7]);
    swatchAnimButton[8] = cp5.addButton("swatchAnim8").setPosition(105, 420).setSize(30, 30).setVisible(false).setImage(swatch[8]);
    swatchAnimButton[9] = cp5.addButton("swatchAnim9").setPosition(140, 420).setSize(30, 30).setVisible(false).setImage(swatch[9]);
    swatchAnimButton[10] = cp5.addButton("swatchAnim10").setPosition(175, 420).setSize(30, 30).setVisible(false).setImage(swatch[10]);

    // FIELD
    xCountSlider = cp5.addSlider("xCount").setPosition(20, 480).setSize(150, 14).setRange(1, 50).setValue(16).setCaptionLabel("X Count");
    xCountSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    yCountSlider = cp5.addSlider("yCount").setPosition(20, 510).setSize(150, 14).setRange(1, 50).setValue(30).setCaptionLabel("Y Count");    
    yCountSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("xSpace").setPosition(180, 480).setSize(150, 14).setRange(1, 100).setValue(30).setCaptionLabel("X Space");
    cp5.getController("xSpace").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("ySpace").setPosition(180, 510).setSize(150, 14).setRange(1, 100).setValue(30).setCaptionLabel("Y Space");    
    cp5.getController("ySpace").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    // WAVE
    waveDimensionToggle = cp5.addToggle("waveDimension")
                             .setPosition(20,570)
                             .setSize(80,14)
                             .setValue(true)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(color(#6497F9))
                             .setCaptionLabel("3D Wave");
    waveDimensionToggle.getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(88);
    
    radialWaveToggle = cp5.addToggle("radialWave")
                                .setPosition(180, 570)
                                .setSize(60, 14)
                                .setValue(false)
                                .setCaptionLabel("Radial Wave")
                                .setColorActive(color(#374760))
                                .setMode(ControlP5.SWITCH);
    radialWaveToggle.getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(68);
    
    yWaveOffsetSlider = cp5.addSlider("yWaveOffset").setPosition(20, 590).setSize(150, 14).setRange(-PI/4, PI/4).setValue(-0.1).setCaptionLabel("Vertical Offset");    
    yWaveOffsetSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    xWaveOffsetSlider = cp5.addSlider("xWaveOffset").setPosition(180, 590).setSize(150, 14).setRange(-PI/4, PI/4).setValue(0.55).setCaptionLabel("Horizontal Offset");    
    xWaveOffsetSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    radialOffsetSlider = cp5.addSlider("radialOffset").setPosition(20, 590).setSize(310, 14).setRange(-1000, 1000).setValue(-300).setCaptionLabel("Radial Offset").setVisible(false);    
    radialOffsetSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("waveSize").setPosition(20, 620).setSize(310, 14).setRange(0, 200).setValue(24).setCaptionLabel("Size");    
    cp5.getController("waveSize").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("loopLength").setPosition(20, 650).setSize(310, 14).setRange(60,400).setValue(180).setCaptionLabel("Loop Length");    
    cp5.getController("loopLength").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    // CAMERA
    cameraRotXSlider = cp5.addSlider("cameraRotX").setPosition(20, 720).setSize(150, 14).setRange(-PI/3, PI/3).setValue(0.33).setCaptionLabel("Rotate X");
    cameraRotXSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cameraRotYSlider = cp5.addSlider("cameraRotY").setPosition(20, 750).setSize(150, 14).setRange(-PI/3, PI/3).setValue(0.33).setCaptionLabel("Rotate Y");
    cameraRotYSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    cameraRotZSlider = cp5.addSlider("cameraRotZ").setPosition(20, 780).setSize(150, 14).setRange(-PI/3, PI/3).setValue(-0.17).setCaptionLabel("Rotate Z");
    cameraRotZSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addButton("resetCamera").setPosition(20, 840).setSize(150,45).setCaptionLabel("Reset Camera");

    animateCameraToggle = cp5.addToggle("animateCamera")
                             .setPosition(180,720)
                             .setSize(60,14)
                             .setValue(false)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(color(#374760))
                             .setCaptionLabel("Animate Camera");
    animateCameraToggle.getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(65);

    animateRotXSlider = cp5.addSlider("animateRotX")
                           .setPosition(180, 750)
                           .setSize(150, 14)
                           .setRange(-PI/3, PI/3)
                           .setValue(0)
                           .setCaptionLabel("Animate Rotate X")
                           .setLock(true)
                           .setColorForeground(color(70))
                           .setColorCaptionLabel(color(100));
    animateRotXSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    animateRotYSlider = cp5.addSlider("animateRotY")
                           .setPosition(180, 780)
                           .setSize(150, 14)
                           .setRange(-PI/3, PI/3)
                           .setValue(0.25)
                           .setCaptionLabel("Animate Rotate Y")
                           .setLock(true)
                           .setColorForeground(color(70))
                           .setColorCaptionLabel(color(100));
    animateRotYSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    animateRotZSlider = cp5.addSlider("animateRotZ")
                           .setPosition(180, 810)
                           .setSize(150, 14)
                           .setRange(-PI/3, PI/3)
                           .setValue(0)
                           .setCaptionLabel("Animate Rotate Z")
                           .setLock(true)
                           .setColorForeground(color(70))
                           .setColorCaptionLabel(color(100));
    animateRotZSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    animateZoomZSlider = cp5.addSlider("animateZoomZ")
                            .setPosition(180, 840)
                            .setSize(150, 14)
                            .setRange(-300, 300)
                            .setValue(0)
                            .setCaptionLabel("Animate Zoom Z")
                            .setLock(true)
                            .setColorForeground(color(70))
                            .setColorCaptionLabel(color(100));
    animateZoomZSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    animatePosXSlider = cp5.addSlider("animatePosX")
                            .setPosition(180, 870)
                            .setSize(150, 14)
                            .setRange(-400, 400)
                            .setValue(0)
                            .setCaptionLabel("Animate Pan X")
                            .setLock(true)
                            .setColorForeground(color(70))
                            .setColorCaptionLabel(color(100));
    animatePosXSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    // EXPORT
    //cp5.addButton("exportSVG").setPosition(20, 950).setSize(150,40).setCaptionLabel("Export SVG");
    cp5.addButton("exportSeq").setPosition(180, 950).setSize(150,40).setCaptionLabel("Export Sequence");
    cp5.addButton("exportMP4").setPosition(180, 1000).setSize(150,40).setCaptionLabel("Export MP4");

  resetSwatch();
  swatchSel[1] = true;
  resetSwatchAnim();
  swatchAnimSel[5] = true;
  
  //coreCanvas.smooth(8);
  coreCanvas = createGraphics(int(coreCanvasW), int(coreCanvasH), P3D);

  frameRate(30);

  surface.setTitle("Main");
  surface.setResizable(false);
  surface.setLocation(10, 10);
    
  coreFlag = new Field();
}

void draw(){
  coreCanvas.smooth(8);
  coreCanvas.textMode(SHAPE);

  if(fillField){
    if(mainInputText.getText().length() == 0){
      mainInputText.setText(" ");
      coreString = " ";
    } else {
      coreString = mainInputText.getText();
    }
  } else if(mainInputText.getText().length() != coreString.length()){
    splitInputIntoArray();
  }
  
  background(uiBkgdColor);

  noStroke();
  fill(uiForeColor);
            
  textFont(uiFontHead);
  textSize(60);
  text("QUILT_1", 20, 65);
  
  textFont(uiFontMain);
  textSize(20);
  text("CANVAS", 20, 95);
  text("TEXT", 20, 165);
  text("COLOR", 20, 285);
  
  push();
    translate(30, 365);
    rotateZ(-PI/2);
    textFont(uiFontSub);
    if(animateColor){
      text("COLOR A", 0, 0);
      text("COLOR B", -80, 0);
    } else {
      text("SWATCHES", 0, 0);
    }
  pop();
  
  for(var m = 0; m < 2; m ++){    //////////// DRAW SWATCH SELECT FOR TOP SWATCHES
    for(var n = 0; n < 6; n ++){
      if(swatchSel[m * 6 + n]){
        stroke(255);
        strokeWeight(2);
        rect(35 + n * 35, 310 + m * 35, 30, 30);
      }
    }
  }
  if(animateColor){
    for(var m = 0; m < 2; m ++){    //////////// DRAW SWATCH SELECT FOR BOT SWATCHES
      for(var n = 0; n < 6; n ++){
        if(swatchAnimSel[m * 6 + n]){
          stroke(255);
          strokeWeight(2);
          rect(35 + n * 35, 385 + m * 35, 30, 30);
        }
      }
    }  
  }
  
  text("FIELD", 20, 475);
  text("WAVE", 20, 565);
  
  //textFont(uiFontSub);
  //textSize(14);

  textFont(uiFontMain);
  textSize(20);
  text("CAMERA", 20, 715);
  text("EXPORT", 20, 940);

  coreCanvas.beginDraw();
  coreCanvas.background(bkgdColorActual);

  if(exportSVGtoggle){          /////////////////////////////////////////////////////// TURN ON SVG SAVING
    String saveTag = "quiltVector_" + day() + minute() + second();
    beginRaw(SVG, "export/svg/" + saveTag + ".svg");

    coreCanvas.push();          /////////// draws background rect that's the same size as canvas size
      coreCanvas.noStroke();
      coreCanvas.fill(bkgdColorActual);
      coreCanvas.translate(width/2, height/2, -2000);
      coreCanvas.rectMode(CENTER);
      coreCanvas.rect(0, 0, width * projZFact, height * projZFact);
    coreCanvas.pop();
  }
  
  coreCanvas.push();
    coreCanvas.translate(coreCanvasW/2, coreCanvasH/2);
    
    // ANIMATE CAMERA
    if(animateCamera && wave3D){
      cameraAnimation();
      coreCanvas.translate(animatorPosX, 0, animatorZoomZ);
      
      coreCanvas.rotateX(animatorRotX);
      coreCanvas.rotateY(animatorRotY);
      coreCanvas.rotateZ(animatorRotZ);
    }
        
    // CAMERA
    if(wave3D){
      coreCanvas.rotateX(cameraRotX);
      coreCanvas.rotateY(cameraRotY);
      coreCanvas.rotateZ(cameraRotZ);    
    }

    // SCALE
    coreCanvas.scale(coreScale);
    
    coreFlag.run();
  coreCanvas.pop();
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

  fill(0,175);
  noStroke();
  textFont(uiFontSys2);
  text("SCALE: " + imageScale + "%", uiWidth + padding, height - padding/2);

  
  if(exportSeqToggle){
    coreCanvas.save("export/sequence/" + seqTag + "/quiltFrame-" + seqCount + ".png");
    seqCount++;
    
    if(seqCount >= seqCap){
      exportSeqToggle = false;
    }
  }
  
  if(exportSVGtoggle){
    endRaw();
    exportSVGtoggle = false;
  }
  
  if(exportMP4toggle){
    videoExport.saveFrame();
    seqCount++;
    
    if(seqCount >= seqCap){
      videoExport.endMovie();
      exportMP4toggle = false;
    }
  }
  
  if(animateColor){
    colorAnimation();
  }
}

void colorAnimation(){
  float waver = map(sinEngine(0,0,waveSpeed/2,1), -1, 1, 0, 1);
  bkgdColorActual = lerpColor(bkgdColor, bkgdColorAnim, waver);
  foreColorActual = lerpColor(foreColor, foreColorAnim, waver);
}

void cameraAnimation(){
  float waver = sinEngine(0,0,waveSpeed/2,1);
  animatorRotX = waver * animateRotX;
  animatorRotY = waver * animateRotY;
  animatorRotZ = waver * animateRotZ;
  animatorZoomZ = waver * animateZoomZ;
  animatorPosX = waver * animatePosX;
}

void resetSwatch(){
  for(var m = 0; m < 12; m++){
    swatchSel[m] = false;
  }
}
void resetSwatchAnim(){
  for(var m = 0; m < 12; m++){
    swatchAnimSel[m] = false;
  }
}

public void fillField(boolean theFlag){
    fillField = theFlag;

    if(theFlag){
      xCount = xCountHold;
      yCount = yCountHold;
      if (xCountSlider != null) {
        xCountSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255));
        yCountSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255));
        fillFieldToggle.setColorActive(color(#6497F9));      
      }
    } else {
      xCountHold = xCount;
      yCountHold = yCount;

      splitInputIntoArray(); 
      if (xCountSlider != null) {
        xCountSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100));
        yCountSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100));
        fillFieldToggle.setColorActive(color(#374760));      
      }
    }
  }
    
  public void canvasWidth(String theText){
    coreCanvasW = int(theText);
    if(coreCanvasW < 10){ coreCanvasW = 10; }
    
    canvasResizer();
   }

  public void canvasHeight(String theText){
    coreCanvasH = int(theText);
    if(coreCanvasH < 10){ coreCanvasH = 10; }
    
    canvasResizer();
  }
  
  public void canvasResizer(){
    coreCanvas = createGraphics(int(coreCanvasW), int(coreCanvasH), P3D);  // create at actual size
    
    // figure out display dimensions so it's scaled to proper display (displayCore) size
    if(coreCanvasW > coreCanvasH){    //////////// HORZ COMP
      println("HORIZONTAL COMP");
      coreRatio = coreCanvasH/coreCanvasW;
      if(coreCanvasW > boardWidth){
        displayCoreW = boardWidth;
        displayCoreH = displayCoreW * coreRatio;
      } else if(coreCanvasH > boardHeight){
        displayCoreH = boardHeight;
        displayCoreW = displayCoreH/coreRatio;
      } else {
        displayCoreW = coreCanvasW;
        displayCoreH = coreCanvasH;
      }
    } else {                          //////////// VERT COMP
      println("VERTICAL, SQUARE COMP");
      coreRatio = coreCanvasW/coreCanvasH;
      if(coreCanvasH > boardHeight){
        displayCoreH = boardHeight;
        displayCoreW = displayCoreH * coreRatio;
      } else if(coreCanvasW > boardWidth){
        displayCoreW = boardWidth;
        displayCoreH = displayCoreW/coreRatio;
      } else {
        displayCoreW = coreCanvasW;
        displayCoreH = coreCanvasH;
      }
    }
    imageScale = round((displayCoreH/coreCanvasH) * 100);
  }
  
  public void animateColor(boolean theFlag){
    boolean toggle = theFlag;
    animateColor = theFlag;
    
    
    
    if(swatchButton[0] != null){
      for(int m = 0; m < 11; m++){
        swatchAnimButton[m].setVisible(toggle);
      }
      
      if(theFlag){
        animateColorToggle.setColorActive(color(#6497F9));
      } else {
        bkgdColorActual = bkgdColor;
        foreColorActual = foreColor;

        animateColorToggle.setColorActive(color(#374760));   
      }
    }
  }
    
  public void swatch0(){ resetSwatch(); swatchSel[0] = true; bkgdColor = #ffffff; foreColor = #000000;}
  public void swatch1(){ resetSwatch(); swatchSel[1] = true; bkgdColor = #FEF9F3; foreColor = #000000;}  
  public void swatch2(){ resetSwatch(); swatchSel[2] = true; bkgdColor = #E5DFD9; foreColor = #000000;}  
  public void swatch3(){ resetSwatch(); swatchSel[3] = true; bkgdColor = #FEF9F3; foreColor = #FF7B5E;}  
  public void swatch4(){ resetSwatch(); swatchSel[4] = true; bkgdColor = #FEF9F3; foreColor = #186767;}  
  public void swatch5(){ resetSwatch(); swatchSel[5] = true; bkgdColor = #FEF9F3; foreColor = #202A79;}
  public void swatch6(){ resetSwatch(); swatchSel[6] = true; bkgdColor = #FFF3D2; foreColor = #000000;}
  public void swatch7(){ resetSwatch(); swatchSel[7] = true; bkgdColor = #FF7B5E; foreColor = #FFF3D2;}  
  public void swatch8(){ resetSwatch(); swatchSel[8] = true; bkgdColor = #D8F4F7; foreColor = #186767;}  
  public void swatch9(){ resetSwatch(); swatchSel[9] = true; bkgdColor = #6497F9; foreColor = #D8F4F7;}  
  public void swatch10(){ resetSwatch(); swatchSel[10] = true; bkgdColor = #186767; foreColor = #D8F4F7;}  
  
  public void swatchAnim0(){ resetSwatchAnim(); swatchAnimSel[0] = true; bkgdColorAnim = #ffffff; foreColorAnim = #000000;}
  public void swatchAnim1(){ resetSwatchAnim(); swatchAnimSel[1] = true; bkgdColorAnim = #FEF9F3; foreColorAnim = #000000;}  
  public void swatchAnim2(){ resetSwatchAnim(); swatchAnimSel[2] = true; bkgdColorAnim = #E5DFD9; foreColorAnim = #000000;}  
  public void swatchAnim3(){ resetSwatchAnim(); swatchAnimSel[3] = true; bkgdColorAnim = #FEF9F3; foreColorAnim = #FF7B5E;}  
  public void swatchAnim4(){ resetSwatchAnim(); swatchAnimSel[4] = true; bkgdColorAnim = #FEF9F3; foreColorAnim = #186767;}  
  public void swatchAnim5(){ resetSwatchAnim(); swatchAnimSel[5] = true; bkgdColorAnim = #FEF9F3; foreColorAnim = #202A79;}
  public void swatchAnim6(){ resetSwatchAnim(); swatchAnimSel[6] = true; bkgdColorAnim = #FFF3D2; foreColorAnim = #000000;}
  public void swatchAnim7(){ resetSwatchAnim(); swatchAnimSel[7] = true; bkgdColorAnim = #FF7B5E; foreColorAnim = #FFF3D2;}  
  public void swatchAnim8(){ resetSwatchAnim(); swatchAnimSel[8] = true; bkgdColorAnim = #D8F4F7; foreColorAnim = #186767;}  
  public void swatchAnim9(){ resetSwatchAnim(); swatchAnimSel[9] = true; bkgdColorAnim = #6497F9; foreColorAnim = #D8F4F7;}  
  public void swatchAnim10(){ resetSwatchAnim(); swatchAnimSel[10] = true; bkgdColorAnim = #186767; foreColorAnim = #D8F4F7;}  
  
  public void coreScale(float n){ coreScale = n; }
  public void xCount(int n){ xCount = n; }
  public void yCount(int n){ yCount = n; }
  public void xSpace(float n){ xSpace = n; }
  public void ySpace(float n){ ySpace = n; }
  
  public void waveDimension(boolean theFlag){
    wave3D = theFlag;
    if(waveDimensionToggle != null){
      if(theFlag){
        waveDimensionToggle.setColorActive(color(#6497F9));
        cameraRotXSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255));
        cameraRotYSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255));
        cameraRotZSlider.setLock(false).setColorForeground(color(150)).setColorCaptionLabel(color(255));
        animateCameraToggle.setLock(false);
      } else {
        waveDimensionToggle.setColorActive(color(#374760));
        cameraRotXSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100));
        cameraRotYSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100));
        cameraRotZSlider.setLock(true).setColorForeground(color(70)).setColorCaptionLabel(color(100));
        animateCameraToggle.setLock(true);
      }
    }
  }
  public void radialWave(boolean theFlag){
    radialWave = theFlag;
    if(radialWaveToggle != null){
      if(theFlag){
        radialWaveToggle.setColorActive(color(#6497F9));
        yWaveOffsetSlider.setVisible(false);
        xWaveOffsetSlider.setVisible(false);
        radialOffsetSlider.setVisible(true);
      } else {
        radialWaveToggle.setColorActive(color(#374760));
        yWaveOffsetSlider.setVisible(true);
        xWaveOffsetSlider.setVisible(true);
        radialOffsetSlider.setVisible(false);
      }
    }
  }
  
  public void yWaveOffset(float n){ yWaveOffset = n; }
  public void xWaveOffset(float n){ xWaveOffset = n; }
  public void radialOffset(float n){ radialOffset = n; }
  public void loopLength(int n){
    loopLength = n;
    waveSpeed = (TWO_PI)/loopLength;
  }  
  public void waveSize(float n){ waveSize = n; }
  
  public void cameraRotX(float n){ cameraRotX = n; }
  public void cameraRotY(float n){ cameraRotY = n; }
  public void cameraRotZ(float n){ cameraRotZ = n; }

  public void animateRotX(float n){ animateRotX = n; }
  public void animateRotY(float n){ animateRotY = n; }
  public void animateRotZ(float n){ animateRotZ = n; }
  public void animateZoomZ(float n){ animateZoomZ = n; }
  public void animatePosX(float n){ animatePosX = n; }

  public void animateCamera(boolean theFlag){
    animateCamera = theFlag;

    boolean toggle = true;
    int cfo = 70;
    int ccl = 100;

    if (theFlag) {
      toggle = false;
      cfo = 200;
      ccl = 255;
    }

    if (animateRotXSlider != null) {
      animateRotXSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl));
      animateRotYSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl));
      animateRotZSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl));
      animateZoomZSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl));
      animatePosXSlider.setLock(toggle).setColorForeground(color(cfo)).setColorCaptionLabel(color(ccl));
      if(theFlag){
        animateCameraToggle.setColorActive(color(#6497F9));
      } else {
        animateCameraToggle.setColorActive(color(70));
      }
    }
  }
  
  public void resetCamera(){
    println("CAMERA RESET!");

   if(cameraRotXSlider != null) {
     cameraRotXSlider.setValue(0);
     cameraRotYSlider.setValue(0);
     cameraRotZSlider.setValue(0);
     animateRotXSlider.setValue(0);
     animateRotYSlider.setValue(0);
     animateRotZSlider.setValue(0);
     animateZoomZSlider.setValue(0);
     animatePosXSlider.setValue(0);
   }
  }
  
  public void exportSVG(){
    exportSVGtoggle = true;
  }
  
  public void exportSeq(){
    exportSeqToggle = true;
    seqTag = "quiltSeq_" + day() + minute() + second();
    seqCount = 0;
    seqCap = loopLength;
    if(animateCamera || animateColor){
      seqCap *= 2;
    }
  }

  public void exportMP4(){
    exportMP4toggle = true;
    
    String tempTag = "quiltMotion" + hour() + "_" + minute() + "_" + second();
    videoExport = new VideoExport(this, "export/mp4/" + tempTag + ".mp4", coreCanvas);
       
    videoExport.setQuality(97, 1 );
    videoExport.setFrameRate(30);
    videoExport.startMovie();
    
    seqCount = 0;
    seqCap = loopLength;
    
    if(animateCamera || animateColor){
      seqCap *= 2;
    }
  }

  public void splitInputIntoArray(){
    if(mainInputText.getText().length() == 0){
      mainInputText.setText(" ");
      coreString = " ";
    }
    coreString = mainInputText.getText();
    
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
