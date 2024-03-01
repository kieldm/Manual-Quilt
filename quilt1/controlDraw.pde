void drawControls(){
    cp5 = new ControlP5(this);
    cp5.setColorBackground(uiAccentHR)
       .setColorForeground(uiForeColor)
       .setColorActive(uiForeColor)
       .setFont(uiFontSys);

    // CANVAS
    widthField = cp5.addTextfield("widthField").setPosition(uiLeftRule, 62).setSize(130, 25)
                               .setValue("1080").setAutoClear(false)
                               .setColorBackground(uiBkgdColor).setColorValueLabel(uiForeColor).setColorForeground(uiAccentColor)
                               .setCaptionLabel("");
    widthField.getValueLabel().setPaddingX(3);

    heightField = cp5.addTextfield("heightField").setPosition(uiLeftRule + 150, 62).setSize(130, 25)
                                .setValue("1080").setAutoClear(false)
                                .setColorBackground(uiBkgdColor).setColorValueLabel(uiForeColor).setColorForeground(uiAccentColor)
                                .setCaptionLabel("");
    heightField.getValueLabel().setPaddingX(3);
    
    // TEXT
    mainInputText = cp5.addTextfield("mainInput").setPosition(uiLeftRule, 142).setSize(280, 32)
                             .setValue("BETTER CLIMATE BY DESIGN").setAutoClear(false)
                             .setColorBackground(uiBkgdColor).setColorValueLabel(uiForeColor).setColorForeground(uiAccentColor)
                             .setCaptionLabel("");
    mainInputText.getValueLabel().setPaddingX(2);
    
    headlineToggle = cp5.addToggle("headline").setPosition(20, 205).setSize(60, 14)
                                .setValue(false).setCaptionLabel("HEADLINE")
                                .setColorActive(color(#374760))
                                .setMode(ControlP5.SWITCH)
                                .setVisible(false);
    headlineToggle.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    justifyRadio = cp5.addRadioButton("justifyMode").setPosition(100, 205).setSize(30, 14)
                                .setItemsPerRow(5).setSpacingColumn(50)
                                .setColorActive(color(#6497F9))
                                .addItem("LEFT", 0).addItem("CENTER", 1).addItem("RIGHT", 2).activate(0)
                                .setVisible(false).setNoneSelectedAllowed(false);


    coreScaleSlider = cp5.addSlider("coreScale").setPosition(uiLeftRule, 200).setSize(280, 6)
                          .setRange(0.1, 5)
                          .setValue(1.6)
                          .setLabelVisible(false)
                          .setCaptionLabel("");
    
    // FIELD
    xCountSlider = cp5.addSlider("xCount").setPosition(uiLeftRule, 250).setSize(130, 6).setRange(1, 50).setValue(24).setLabelVisible(false).setCaptionLabel("");

    yCountSlider = cp5.addSlider("yCount").setPosition(uiLeftRule + 150, 250).setSize(130, 6).setRange(1, 50).setValue(30).setLabelVisible(false).setCaptionLabel("");    

    xSpaceSlider = cp5.addSlider("xSpace").setPosition(uiLeftRule, 300).setSize(130, 6).setRange(1, 100).setValue(25).setLabelVisible(false).setCaptionLabel("");

    ySpaceSlider = cp5.addSlider("ySpace").setPosition(uiLeftRule + 150, 300).setSize(130, 6).setRange(1, 100).setValue(30).setLabelVisible(false).setCaptionLabel("");    
    
    // COLOR
    animateColorToggle = cp5.addToggle("animateColor").setPosition(uiLeftRule + 150, 350).setSize(35,12)
                             .setValue(false)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(uiAccentColor)
                             .setCaptionLabel("");
    
    swatchButton[0] = cp5.addButton("swatch0").setPosition(uiLeftRule, 370).setSize(27, 27).setVisible(true).setImage(swatch[0]);
    swatchButton[1] = cp5.addButton("swatch1").setPosition(uiLeftRule + 35, 370).setSize(27, 27).setVisible(true).setImage(swatch[1]);
    swatchButton[2] = cp5.addButton("swatch2").setPosition(uiLeftRule + 70, 370).setSize(27, 27).setVisible(true).setImage(swatch[2]);
    swatchButton[3] = cp5.addButton("swatch3").setPosition(uiLeftRule + 105, 370).setSize(27, 27).setVisible(true).setImage(swatch[3]);
    swatchButton[4] = cp5.addButton("swatch4").setPosition(uiLeftRule + 140, 370).setSize(27, 27).setVisible(true).setImage(swatch[4]);
    swatchButton[5] = cp5.addButton("swatch5").setPosition(uiLeftRule + 175, 370).setSize(27, 27).setVisible(true).setImage(swatch[5]);
    swatchButton[6] = cp5.addButton("swatch6").setPosition(uiLeftRule + 210, 370).setSize(27, 27).setVisible(true).setImage(swatch[6]);
    swatchButton[7] = cp5.addButton("swatch7").setPosition(uiLeftRule + 245, 370).setSize(27, 27).setVisible(true).setImage(swatch[7]);
    swatchButton[8] = cp5.addButton("swatch8").setPosition(uiLeftRule + 280, 370).setSize(27, 27).setVisible(true).setImage(swatch[8]);

    swatchAnimButton[0] = cp5.addButton("swatchAnim0").setPosition(uiLeftRule, 405).setSize(27, 27).setVisible(false).setImage(swatch[0]);
    swatchAnimButton[1] = cp5.addButton("swatchAnim1").setPosition(uiLeftRule + 35, 405).setSize(27, 27).setVisible(false).setImage(swatch[1]);
    swatchAnimButton[2] = cp5.addButton("swatchAnim2").setPosition(uiLeftRule + 70, 405).setSize(27, 27).setVisible(false).setImage(swatch[2]);
    swatchAnimButton[3] = cp5.addButton("swatchAnim3").setPosition(uiLeftRule + 105, 405).setSize(27, 27).setVisible(false).setImage(swatch[3]);
    swatchAnimButton[4] = cp5.addButton("swatchAnim4").setPosition(uiLeftRule + 140, 405).setSize(27, 27).setVisible(false).setImage(swatch[4]);
    swatchAnimButton[5] = cp5.addButton("swatchAnim5").setPosition(uiLeftRule + 175, 405).setSize(27, 27).setVisible(false).setImage(swatch[5]);
    swatchAnimButton[6] = cp5.addButton("swatchAnim6").setPosition(uiLeftRule + 210, 405).setSize(27, 27).setVisible(false).setImage(swatch[6]);
    swatchAnimButton[7] = cp5.addButton("swatchAnim7").setPosition(uiLeftRule + 245, 405).setSize(27, 27).setVisible(false).setImage(swatch[7]);
    swatchAnimButton[8] = cp5.addButton("swatchAnim8").setPosition(uiLeftRule + 280, 405).setSize(27, 27).setVisible(false).setImage(swatch[8]);

    // SCRUBBER
    scrubToggle = cp5.addToggle("scrubMode").setPosition(180,405).setSize(35,12)
                             .setValue(false)
                             .setVisible(false)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(color(#374760))
                             .setCaptionLabel("SCRUB MODE");
    scrubToggle.getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(65);
    
    scrubSlider = cp5.addSlider("scrubber").setPosition(20, 425).setSize(300, 14).setRange(0, 1).setValue(0).setVisible(false).setCaptionLabel("SCRUBBER");    
    scrubSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    // WAVE
    waveDimensionToggle = cp5.addToggle("waveDimension").setPosition(uiLeftRule, 470).setSize(35,12)
                             .setValue(true)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(uiForeColor)
                             .setCaptionLabel("");
    
    radialWaveToggle = cp5.addToggle("radialWave").setPosition(uiLeftRule + 150, 470).setSize(35,12)
                                .setValue(false)
                                .setCaptionLabel("")
                                .setColorActive(uiAccentColor)
                                .setMode(ControlP5.SWITCH);
    
    yWaveOffsetSlider = cp5.addSlider("yWaveOffset").setPosition(uiLeftRule, 540).setSize(130, 6).setRange(-PI/4, PI/4).setValue(-0.1).setLabelVisible(false).setCaptionLabel("");    

    xWaveOffsetSlider = cp5.addSlider("xWaveOffset").setPosition(uiLeftRule + 150, 540).setSize(130, 6).setRange(-PI/4, PI/4).setValue(0.55).setLabelVisible(false).setCaptionLabel("");    

    radialOffsetSlider = cp5.addSlider("radialOffset").setPosition(uiLeftRule, 540).setSize(280, 6).setRange(-1000, 1000).setValue(-300).setLabelVisible(false).setCaptionLabel("").setVisible(false);    

    waveSizeSlider = cp5.addSlider("waveSize").setPosition(uiLeftRule, 590).setSize(130, 6).setRange(0, 200).setValue(24).setLabelVisible(false).setCaptionLabel("");    

    loopLengthSlider = cp5.addSlider("loopLength").setPosition(uiLeftRule + 150, 590).setSize(130, 6).setRange(60,400).setValue(180).setLabelVisible(false).setCaptionLabel("");    

    // CAMERA
    cameraRotXSlider = cp5.addSlider("cameraRotX").setPosition(uiLeftRule, 700).setSize(130, 6).setRange(-PI/3, PI/3).setValue(0.26).setLabelVisible(false).setCaptionLabel("");

    cameraRotYSlider = cp5.addSlider("cameraRotY").setPosition(uiLeftRule, 750).setSize(130, 6).setRange(-PI/3, PI/3).setValue(-0.25).setLabelVisible(false).setCaptionLabel("");
    
    cameraRotZSlider = cp5.addSlider("cameraRotZ").setPosition(uiLeftRule, 800).setSize(130, 6).setRange(-PI/3, PI/3).setValue(-0.17).setLabelVisible(false).setCaptionLabel("");

    cameraPosXSlider = cp5.addSlider("cameraPosX").setPosition(uiLeftRule, 850).setSize(130, 6).setRange(-600, 600).setValue(0.0).setLabelVisible(false).setCaptionLabel("");

    animateCameraToggle = cp5.addToggle("animateCamera").setPosition(uiLeftRule + 150, 645).setSize(35,12)
                             .setValue(false)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(uiAccentColor)
                             .setCaptionLabel("");

    animateRotXSlider = cp5.addSlider("animateRotX").setPosition(uiLeftRule + 150, 700).setSize(130, 6)
                           .setRange(-PI/3, PI/3).setValue(0)
                           .setLabelVisible(false).setCaptionLabel("")
                           .setLock(true)
                           .setColorForeground(uiAccentColor);

    animateRotYSlider = cp5.addSlider("animateRotY").setPosition(uiLeftRule + 150, 750).setSize(130, 6)
                           .setRange(-PI/3, PI/3).setValue(0.25)
                           .setLabelVisible(false).setCaptionLabel("")
                           .setLock(true)
                           .setColorForeground(uiAccentColor);
    
    animateRotZSlider = cp5.addSlider("animateRotZ").setPosition(uiLeftRule + 150, 800).setSize(130, 6)
                           .setRange(-PI/3, PI/3).setValue(0)
                           .setLabelVisible(false).setCaptionLabel("")
                           .setLock(true)
                           .setColorForeground(uiAccentColor);

    animateZoomZSlider = cp5.addSlider("animateZoomZ").setPosition(uiLeftRule + 150, 850).setSize(130, 6)
                            .setRange(-300, 300).setValue(0)
                            .setLabelVisible(false).setCaptionLabel("")
                            .setLock(true)
                            .setColorForeground(uiAccentColor);

    animatePosXSlider = cp5.addSlider("animatePosX").setPosition(uiLeftRule + 150, 900).setSize(130, 6)
                            .setRange(-400, 400).setValue(0)
                            .setLabelVisible(false).setCaptionLabel("")
                            .setLock(true)
                            .setColorForeground(uiAccentColor);

    resetCamera = cp5.addButton("resetCamera").setPosition(uiLeftRule, 880).setSize(130, 25).setCaptionLabel("Reset Camera").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    
    // EXPORT
    exportSVG = cp5.addButton("exportSVG").setPosition(uiLeftRule, 940).setSize(80, 25).setCaptionLabel("SVG").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    exportSeq = cp5.addButton("exportSeq").setPosition(uiLeftRule + 90, 940).setSize(80, 25).setCaptionLabel("Sequence").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    exportMP4 = cp5.addButton("exportMP4").setPosition(uiLeftRule + 180, 940).setSize(80, 25).setCaptionLabel("MP4").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
}

void drawUI(){
  image(quiltLogo, padding, boardHeightPadding - 60);

  push();
    translate(width - uiWidth - padding, padding);
    
    fill(uiBkgdColor);
    rectMode(CORNER);
    rect(0, 0, uiWidth, uiHeight, 10);
    
    noFill();
    stroke(uiAccentHR);
    line(0, 80, uiWidth, 80);
    line(0, 310, uiWidth, 310);
    line(0, 430, uiWidth, 430);
    line(0, 600, uiWidth, 600);
    line(0, 900, uiWidth, 900);
  pop();
  
  push();
    translate(uiLeftRule, padding + 30);
    
    textFont(uiFontMain);
    textSize(12);
    
    fill(uiForeColor);
    text("Width", 0, 0); text("Height", 150, 0);
    
    text("Text", 0, 75);
    text("Scale", 0, 135);
    
    text("Horizontal Count", 0, 180); text("Vertical Count", 150, 180);
    text("Horizontal Spacing", 0, 230); text("Vertical Spacing", 150, 230);

    text("Color", 0, 305); text("Transition", 190, 305);
    
    text("Loop Length", 150, 520);


    if(radialWave){
      text("Radial Frequency", 0, 470);
      fill(uiForeColor);
      text("Radial Wave", 190, 425);
    } else {
      text("Horizontal Wave Freq", 0, 470); text("Vertical Wave Freq", 150, 470);  
      fill(uiAccentColor);
      text("Radial Wave", 190, 425);
    }
        
    if(wave3D){
      fill(uiForeColor);
    } else {
      fill(uiAccentColor);
    }
    text("Wave 3D/2D", 40, 425);
    
    text("Wave Size", 0, 520);
    
    text("X Rotation", 0, 630); 
    text("Y Rotation", 0, 680); 
    text("Z Rotation", 0, 730); 
    text("X Pan", 0, 780); 

    if(animateCamera){
      fill(uiForeColor);
    } else {
      fill(uiAccentColor);
    }
    text("Camera Motion", 190, 600);

    text("X Rotation", 150, 630); 
    text("Y Rotation", 150, 680); 
    text("Z Rotation", 150, 730); 
    text("Zoom", 150, 780); 
    text("X Pan", 150, 830);  
    
    noFill();
    stroke(uiForeColor);
    rectMode(CORNER);
    rect(0, 825, 130, 25, 25);
    
    rect(0, 885, 80, 25, 25);
    rect(90, 885, 80, 25, 25);
    rect(180, 885, 80, 25, 25);
  pop();
  
  //push();
  //  translate(30, 350);
  //  rotateZ(-PI/2);
  //  textFont(uiFontSub);
  //  if(animateColor){
  //    text("CLR-A", 0, 0);
  //    text("CLR-B", -50, 0);
  //  } else {
  //    text("SWATCH", 0, 0);
  //  }
  //pop();
  
  for(var m = 0; m < swatchCount; m ++){    //////////// DRAW SWATCH SELECT FOR TOP SWATCHES
    if(swatchSel[m]){
      stroke(0);
      fill(uiBkgdColor);
      strokeWeight(2);
      rect(uiLeftRule + m * 35, 370, 27, 27);
    }
  }
  if(animateColor){
    for(var m = 0; m < swatchCount; m ++){    //////////// DRAW SWATCH SELECT FOR TOP SWATCHES
      if(swatchAnimSel[m]){
        stroke(0);
        fill(uiBkgdColor);
        strokeWeight(2);
        rect(uiLeftRule + m * 35, 405, 27, 27);
      }
    }  
  }
}

void rePositionControls(){
  widthField.setPosition(uiLeftRule, 62);
  heightField.setPosition(uiLeftRule + 150, 62);
  mainInputText.setPosition(uiLeftRule, 142);
  coreScaleSlider.setPosition(uiLeftRule, 200);
  xCountSlider.setPosition(uiLeftRule, 250);
  yCountSlider.setPosition(uiLeftRule + 150, 250);
  xSpaceSlider.setPosition(uiLeftRule, 300);
  ySpaceSlider.setPosition(uiLeftRule + 150, 300);
  animateColorToggle.setPosition(uiLeftRule + 150, 350);
  waveDimensionToggle.setPosition(uiLeftRule, 470);
  radialWaveToggle.setPosition(uiLeftRule + 150, 470);
  yWaveOffsetSlider.setPosition(uiLeftRule, 540);
  xWaveOffsetSlider.setPosition(uiLeftRule + 150, 540);
  radialOffsetSlider.setPosition(uiLeftRule, 540);
  loopLengthSlider.setPosition(uiLeftRule + 150, 590);
  waveSizeSlider.setPosition(uiLeftRule, 590);
  animateCameraToggle.setPosition(uiLeftRule + 150, 645);
  cameraRotXSlider.setPosition(uiLeftRule, 700);
  cameraRotYSlider.setPosition(uiLeftRule, 750);
  cameraRotZSlider.setPosition(uiLeftRule, 800);
  cameraPosXSlider.setPosition(uiLeftRule, 850);
  animateRotXSlider.setPosition(uiLeftRule + 150, 700);
  animateRotYSlider.setPosition(uiLeftRule + 150, 750);
  animateRotZSlider.setPosition(uiLeftRule + 150, 800);
  animateZoomZSlider.setPosition(uiLeftRule + 150, 850);
  animatePosXSlider.setPosition(uiLeftRule + 150, 900);
  resetCamera.setPosition(uiLeftRule, 880);
  exportSVG.setPosition(uiLeftRule, 940);
  exportSeq.setPosition(uiLeftRule + 90, 940);
  exportMP4.setPosition(uiLeftRule + 180, 940);
  swatchButton[0].setPosition(uiLeftRule, 370);
  swatchButton[1].setPosition(uiLeftRule + 35, 370);
  swatchButton[2].setPosition(uiLeftRule + 70, 370);
  swatchButton[3].setPosition(uiLeftRule + 105, 370);
  swatchButton[4].setPosition(uiLeftRule + 140, 370);
  swatchButton[5].setPosition(uiLeftRule + 175, 370);
  swatchButton[6].setPosition(uiLeftRule + 210, 370);
  swatchButton[7].setPosition(uiLeftRule + 245, 370);
  swatchButton[8].setPosition(uiLeftRule + 280, 370);
  swatchAnimButton[0].setPosition(uiLeftRule, 405);
  swatchAnimButton[1].setPosition(uiLeftRule + 35, 405);
  swatchAnimButton[2].setPosition(uiLeftRule + 70, 405);
  swatchAnimButton[3].setPosition(uiLeftRule + 105, 405);
  swatchAnimButton[4].setPosition(uiLeftRule + 140, 405);
  swatchAnimButton[5].setPosition(uiLeftRule + 175, 405);
  swatchAnimButton[6].setPosition(uiLeftRule + 210, 405);
  swatchAnimButton[7].setPosition(uiLeftRule + 245, 405);
  swatchAnimButton[8].setPosition(uiLeftRule + 280, 405);
}
