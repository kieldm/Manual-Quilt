void drawControls(){
    cp5 = new ControlP5(this);
    cp5.setColorBackground(uiAccentHR)
       .setColorForeground(uiForeColor)
       .setColorActive(uiForeColor)
       .setFont(uiFontSys);

    // CANVAS
    widthField = cp5.addTextfield("widthField").setPosition(uiLeftRule, padding + 2 * uiUnit - 20).setSize(130, 24)
                               .setValue("1080").setAutoClear(false)
                               .setColorBackground(uiBkgdColor).setColorValueLabel(uiForeColor).setColorForeground(uiAccentColor)
                               .setCaptionLabel("");
    widthField.getValueLabel().setPaddingX(3);

    heightField = cp5.addTextfield("heightField").setPosition(uiLeftRule + 150, padding + 2 * uiUnit - 20).setSize(130, 24)
                                .setValue("1080").setAutoClear(false)
                                .setColorBackground(uiBkgdColor).setColorValueLabel(uiForeColor).setColorForeground(uiAccentColor)
                                .setCaptionLabel("");
    heightField.getValueLabel().setPaddingX(3);
    
    // TEXT
    mainInputText = cp5.addTextfield("mainInput").setPosition(uiLeftRule, padding + 5 * uiUnit - 20).setSize(170, 24)
                             .setValue("BETTER CLIMATE BY DESIGN").setAutoClear(false)
                             .setColorBackground(uiBkgdColor).setColorValueLabel(uiForeColor).setColorForeground(uiAccentColor)
                             .setCaptionLabel("");
    mainInputText.getValueLabel().setPaddingX(2);
    
    fillFieldToggle = cp5.addToggle("fillField").setPosition(uiLeftRule + 180, padding + 4 * uiUnit - 10).setSize(30,12)
                                .setValue(true)
                                .setColorActive(uiForeColor)
                                .setMode(ControlP5.SWITCH)
                                .setCaptionLabel("");

    justifyToggle = cp5.addToggle("justify").setPosition(uiLeftRule + 180, padding + 5 * uiUnit - 10).setSize(30,12)
                                .setValue(true).setLock(true)
                                .setColorActive(uiAccentColor)
                                .setMode(ControlP5.SWITCH)
                                .setCaptionLabel("");
    
    coreScaleSlider = cp5.addSlider("coreScale").setPosition(uiLeftRule, padding + 6.5 * uiUnit).setSize(280, 6)
                          .setRange(0.1, 5)
                          .setValue(1.6)
                          .setLabelVisible(false)
                          .setCaptionLabel("");
    
    // FIELD
    xCountSlider = cp5.addSlider("xCount").setPosition(uiLeftRule, padding + 8.5 * uiUnit).setSize(130, 6).setRange(1, 50).setValue(24).setLabelVisible(false).setCaptionLabel("");
    yCountSlider = cp5.addSlider("yCount").setPosition(uiLeftRule + 150, padding + 8.5 * uiUnit).setSize(130, 6).setRange(1, 50).setValue(30).setLabelVisible(false).setCaptionLabel("");    
    xSpaceSlider = cp5.addSlider("xSpace").setPosition(uiLeftRule, padding + 10.5 * uiUnit).setSize(130, 6).setRange(1, 100).setValue(25).setLabelVisible(false).setCaptionLabel("");
    ySpaceSlider = cp5.addSlider("ySpace").setPosition(uiLeftRule + 150, padding + 10.5 * uiUnit).setSize(130, 6).setRange(1, 100).setValue(30).setLabelVisible(false).setCaptionLabel("");    
    
    // COLOR
    animateColorToggle = cp5.addToggle("animateColor").setPosition(uiLeftRule + 150, padding + 13 * uiUnit - 10).setSize(30,12)
                             .setValue(false)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(uiAccentColor)
                             .setCaptionLabel("");
    
    swatchButton[0] = cp5.addButton("swatch0").setPosition(uiLeftRule, 370).setSize(24, 24).setVisible(true).setImage(swatch[0]);
    swatchButton[1] = cp5.addButton("swatch1").setPosition(uiLeftRule + 35, 370).setSize(24, 24).setVisible(true).setImage(swatch[1]);
    swatchButton[2] = cp5.addButton("swatch2").setPosition(uiLeftRule + 70, 370).setSize(24, 24).setVisible(true).setImage(swatch[2]);
    swatchButton[3] = cp5.addButton("swatch3").setPosition(uiLeftRule + 105, 370).setSize(24, 24).setVisible(true).setImage(swatch[3]);
    swatchButton[4] = cp5.addButton("swatch4").setPosition(uiLeftRule + 140, 370).setSize(24, 24).setVisible(true).setImage(swatch[4]);
    swatchButton[5] = cp5.addButton("swatch5").setPosition(uiLeftRule + 175, 370).setSize(24, 24).setVisible(true).setImage(swatch[5]);
    swatchButton[6] = cp5.addButton("swatch6").setPosition(uiLeftRule + 210, 370).setSize(24, 24).setVisible(true).setImage(swatch[6]);
    swatchButton[7] = cp5.addButton("swatch7").setPosition(uiLeftRule + 245, 370).setSize(24, 24).setVisible(true).setImage(swatch[7]);
    swatchButton[8] = cp5.addButton("swatch8").setPosition(uiLeftRule + 280, 370).setSize(24, 24).setVisible(true).setImage(swatch[8]);
    swatchButton[9] = cp5.addButton("swatch9").setPosition(uiLeftRule + 325, 370).setSize(24, 24).setVisible(true).setImage(swatch[9]);

    swatchAnimButton[0] = cp5.addButton("swatchAnim0").setPosition(uiLeftRule, 405).setSize(24, 24).setVisible(false).setImage(swatch[0]);
    swatchAnimButton[1] = cp5.addButton("swatchAnim1").setPosition(uiLeftRule + 35, 405).setSize(24, 24).setVisible(false).setImage(swatch[1]);
    swatchAnimButton[2] = cp5.addButton("swatchAnim2").setPosition(uiLeftRule + 70, 405).setSize(24, 24).setVisible(false).setImage(swatch[2]);
    swatchAnimButton[3] = cp5.addButton("swatchAnim3").setPosition(uiLeftRule + 105, 405).setSize(24, 24).setVisible(false).setImage(swatch[3]);
    swatchAnimButton[4] = cp5.addButton("swatchAnim4").setPosition(uiLeftRule + 140, 405).setSize(24, 24).setVisible(false).setImage(swatch[4]);
    swatchAnimButton[5] = cp5.addButton("swatchAnim5").setPosition(uiLeftRule + 175, 405).setSize(24, 24).setVisible(false).setImage(swatch[5]);
    swatchAnimButton[6] = cp5.addButton("swatchAnim6").setPosition(uiLeftRule + 210, 405).setSize(24, 24).setVisible(false).setImage(swatch[6]);
    swatchAnimButton[7] = cp5.addButton("swatchAnim7").setPosition(uiLeftRule + 245, 405).setSize(24, 24).setVisible(false).setImage(swatch[7]);
    swatchAnimButton[8] = cp5.addButton("swatchAnim8").setPosition(uiLeftRule + 280, 405).setSize(24, 24).setVisible(false).setImage(swatch[8]);
    swatchAnimButton[9] = cp5.addButton("swatchAnim9").setPosition(uiLeftRule + 325, 405).setSize(24, 24).setVisible(false).setImage(swatch[9]);

    // SCRUBBER
    scrubToggle = cp5.addToggle("scrubMode").setPosition(uiLeftRule, padding + 36 * uiUnit - 10).setSize(30,12)
                             .setValue(true)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(uiForeColor)
                             .setCaptionLabel("");
    
    scrubSlider = cp5.addSlider("scrubber").setPosition(uiLeftRule + 150, padding + 36 * uiUnit - 5).setSize(130, 6).setRange(0, 1).setValue(0).setLabelVisible(false).setVisible(false).setCaptionLabel("");    

    // WAVE
    waveDimensionToggle = cp5.addToggle("waveDimension").setPosition(uiLeftRule, padding + 18 * uiUnit - 10).setSize(30,12)
                             .setValue(true)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(uiForeColor)
                             .setCaptionLabel("");
    
    radialWaveToggle = cp5.addToggle("radialWave").setPosition(uiLeftRule + 150, padding + 18 * uiUnit - 10).setSize(30,12)
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

    animateCameraToggle = cp5.addToggle("animateCamera").setPosition(uiLeftRule + 150, 645).setSize(30,12)
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

    resetCamera = cp5.addButton("resetCamera").setPosition(uiLeftRule, 32.5 * uiUnit).setSize(130, 25).setCaptionLabel("Reset Camera").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    
    // EXPORT
    exportSVG = cp5.addButton("exportSVG").setPosition(uiLeftRule + 320, padding + 32.5 * uiUnit).setSize(75, 25).setCaptionLabel("SVG").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    exportSeq = cp5.addButton("exportSeq").setPosition(uiLeftRule + 320, padding + 34 * uiUnit).setSize(75, 25).setCaptionLabel("Sequence").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    exportMP4 = cp5.addButton("exportMP4").setPosition(uiLeftRule + 320, padding + 35.5 * uiUnit).setSize(75, 25).setCaptionLabel("MP4").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);

    // EXPORT
    preset[0] = cp5.addButton("preset0").setPosition(uiLeftRule + 320, padding + 1.5 * uiUnit).setSize(75, 25).setCaptionLabel("Wave 1").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    preset[1] = cp5.addButton("preset1").setPosition(uiLeftRule + 320, padding + 3 * uiUnit).setSize(75, 25).setCaptionLabel("Wave 2").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    preset[2] = cp5.addButton("preset2").setPosition(uiLeftRule + 320, padding + 4.5 * uiUnit).setSize(75, 25).setCaptionLabel("Headline").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    preset[3] = cp5.addButton("preset3").setPosition(uiLeftRule + 320, padding + 6 * uiUnit).setSize(75, 25).setCaptionLabel("Radial").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    preset[4] = cp5.addButton("preset4").setPosition(uiLeftRule + 320, padding + 7.5 * uiUnit).setSize(75, 25).setCaptionLabel("Diagonal").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);
    preset[5] = cp5.addButton("preset5").setPosition(uiLeftRule + 320, padding + 9 * uiUnit).setSize(75, 25).setCaptionLabel("Linear").setColorForeground(uiBkgdColor).setColorBackground(uiBkgdColor).setColorActive(uiBkgdColor);

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
    line(0, 3 * uiUnit, 325, 3 * uiUnit);
    line(0, 12 * uiUnit, 325, 12 * uiUnit);
    line(0, 16.5 * uiUnit, 325, 16.5 * uiUnit);
    line(0, 23 * uiUnit, 325, 23 * uiUnit);
    line(0, 34.5 * uiUnit, 325, 34.5 * uiUnit);
    line(325, 0, 325, uiHeight);
  pop();
  
  push();
    translate(uiLeftRule, padding);
    
    textFont(uiFontMain);
    textSize(12);
    
    fill(uiForeColor);
    text("Width", 0, uiUnit); text("Height", 150, uiUnit); 
    
    text("Text", 0, 4 * uiUnit);
    text("Scale", 0, 6 * uiUnit);
    
    if(fillFieldMode){fill(uiForeColor);} else {fill(uiAccentColor);}
    text("Repeating", 220, 4 * uiUnit);
    text("Horizontal Count", 0, 8 * uiUnit); text("Vertical Count", 150, 8 * uiUnit);
    if(fillFieldMode){fill(uiAccentColor);} else {fill(uiForeColor);}
    text("Left/Center", 220, 5 * uiUnit);

    if(animateColor){fill(uiForeColor);} else {fill(uiAccentColor);}
    text("Transition", 190, 13 * uiUnit);

    fill(uiForeColor);
    text("Horizontal Spacing", 0, 10 * uiUnit); text("Vertical Spacing", 150, 10 * uiUnit);

    text("Color", 0, 13 * uiUnit);
    
    text("Loop Length", 150, 21 * uiUnit);

    text("Presets:", 320, uiUnit);
    text("Export:", 320, 32 * uiUnit);

    text("Play/Pause", 40, 36 * uiUnit);

    if(radialWave){
      text("Radial Frequency", 0, 19 * uiUnit);
      fill(uiForeColor);
      text("Radial Wave", 190, 18 * uiUnit);
    } else {
      text("Horizontal Wave Freq", 0, 19 * uiUnit); text("Vertical Wave Freq", 150, 19 * uiUnit);  
      fill(uiAccentColor);
      text("Radial Wave", 190, 18 * uiUnit);
    }
               
    if(wave3D){fill(uiForeColor);} else {fill(uiAccentColor);}
    text("Wave 3D/2D", 40, 18 * uiUnit);    
    text("Wave Size", 0, 21 * uiUnit);
    text("X Rotation", 0, 25 * uiUnit); 
    text("Y Rotation", 0, 27 * uiUnit); 
    text("Z Rotation", 0, 29 * uiUnit); 
    text("X Pan", 0, 31 * uiUnit); 

    if(animateCamera){fill(uiForeColor);} else {fill(uiAccentColor);}
    text("Camera Motion", 190, 24 * uiUnit);

    text("X Rotation", 150, 25 * uiUnit); 
    text("Y Rotation", 150, 27 * uiUnit); 
    text("Z Rotation", 150, 29 * uiUnit); 
    text("Zoom", 150, 31 * uiUnit); 
    text("X Pan", 150, 33 * uiUnit);  
    
    noFill();
    stroke(uiForeColor);
    strokeWeight(0.5);
    rectMode(CORNER);
    
    // RESET
    rect(0, 32.5 * uiUnit, 130, 25, 25);
    
    // PRESETS
    rect(320, 1.5 * uiUnit, 75, 25, 25);
    rect(320, 3 * uiUnit, 75, 25, 25);
    rect(320, 4.5 * uiUnit, 75, 25, 25);
    rect(320, 6 * uiUnit, 75, 25, 25);
    rect(320, 7.5 * uiUnit, 75, 25, 25);
    rect(320, 9 * uiUnit, 75, 25, 25);
    
    // EXPORTS
    rect(320, 32.5 * uiUnit, 75, 25, 25);
    
    if(scrubMode){stroke(uiAccentColor);} else {stroke(uiForeColor);}
    rect(320, 34 * uiUnit, 75, 25, 25);
    rect(320, 35.5 * uiUnit, 75, 25, 25);
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
  
  //for(var m = 0; m < swatchCount; m ++){    //////////// DRAW SWATCH SELECT FOR TOP SWATCHES
  //  if(swatchSel[m]){
  //    stroke(0);
  //    fill(uiBkgdColor);
  //    strokeWeight(2);
  //    rect(uiLeftRule + m * 30, 14.5 * uiUnit, 24, 24);
  //  }
  //}
  //if(animateColor){
  //  for(var m = 0; m < swatchCount; m ++){    //////////// DRAW SWATCH SELECT FOR TOP SWATCHES
  //    if(swatchAnimSel[m]){
  //      stroke(0);
  //      fill(uiBkgdColor);
  //      strokeWeight(2);
  //      rect(uiLeftRule + m * 30, 16 * uiUnit, 24, 24);
  //    }
  //  }
  //}
}

void rePositionControls(){  
  widthField.setPosition(uiLeftRule, padding + 2 * uiUnit - 20);
  heightField.setPosition(uiLeftRule + 150, padding + 2 * uiUnit - 20);
  mainInputText.setPosition(uiLeftRule, padding + 5 * uiUnit - 20);
  fillFieldToggle.setPosition(uiLeftRule + 180, padding + 4 * uiUnit - 10);
  justifyToggle.setPosition(uiLeftRule + 180, padding + 5 * uiUnit - 10);
  
  coreScaleSlider.setPosition(uiLeftRule, padding + 6.5 * uiUnit);
  xCountSlider.setPosition(uiLeftRule, padding + 8.5 * uiUnit);
  yCountSlider.setPosition(uiLeftRule + 150, padding + 8.5 * uiUnit);
  xSpaceSlider.setPosition(uiLeftRule, padding + 10.5 * uiUnit);
  ySpaceSlider.setPosition(uiLeftRule + 150, padding + 10.5 * uiUnit);
  animateColorToggle.setPosition(uiLeftRule + 150, padding + 13 * uiUnit - 10);
  waveDimensionToggle.setPosition(uiLeftRule, padding + 18 * uiUnit - 10);
  radialWaveToggle.setPosition(uiLeftRule + 150, padding + 18 * uiUnit - 10);
  yWaveOffsetSlider.setPosition(uiLeftRule, padding + 19.5 * uiUnit);
  xWaveOffsetSlider.setPosition(uiLeftRule + 150, padding + 19.5 * uiUnit);
  radialOffsetSlider.setPosition(uiLeftRule, padding + 19.5 * uiUnit);
  loopLengthSlider.setPosition(uiLeftRule + 150, padding + 21.5 * uiUnit);
  waveSizeSlider.setPosition(uiLeftRule, padding + 21.5 * uiUnit);
  animateCameraToggle.setPosition(uiLeftRule + 150, padding + 24 * uiUnit - 10);
  cameraRotXSlider.setPosition(uiLeftRule, padding + 25.5 * uiUnit);
  cameraRotYSlider.setPosition(uiLeftRule, padding + 27.5 * uiUnit);
  cameraRotZSlider.setPosition(uiLeftRule, padding + 29.5 * uiUnit);
  cameraPosXSlider.setPosition(uiLeftRule, padding + 31.5 * uiUnit);
  animateRotXSlider.setPosition(uiLeftRule + 150, padding + 25.5 * uiUnit);
  animateRotYSlider.setPosition(uiLeftRule + 150, padding + 27.5 * uiUnit);
  animateRotZSlider.setPosition(uiLeftRule + 150, padding + 29.5 * uiUnit);
  animateZoomZSlider.setPosition(uiLeftRule + 150, padding + 31.5 * uiUnit);
  animatePosXSlider.setPosition(uiLeftRule + 150, padding + 33.5 * uiUnit);
  
  resetCamera.setPosition(uiLeftRule, padding + 32.5 * uiUnit);

  preset[0].setPosition(uiLeftRule + 320, padding + 1.5 * uiUnit);
  preset[1].setPosition(uiLeftRule + 320, padding + 3 * uiUnit);
  preset[2].setPosition(uiLeftRule + 320, padding + 4.5 * uiUnit);
  preset[3].setPosition(uiLeftRule + 320, padding + 6 * uiUnit);
  preset[4].setPosition(uiLeftRule + 320, padding + 7.5 * uiUnit);
  preset[5].setPosition(uiLeftRule + 320, padding + 9 * uiUnit);

  exportSVG.setPosition(uiLeftRule + 320, padding + 32.5 * uiUnit);
  exportSeq.setPosition(uiLeftRule + 320, padding + 34 * uiUnit);
  exportMP4.setPosition(uiLeftRule + 320, padding + 35.5 * uiUnit);

  scrubToggle.setPosition(uiLeftRule, padding + 36 * uiUnit - 10);
  scrubSlider.setPosition(uiLeftRule + 150, padding + 36 * uiUnit - 5);
  
  swatchButton[0].setPosition(uiLeftRule, padding + 13.5 * uiUnit);
  swatchButton[1].setPosition(uiLeftRule + 30, padding + 13.5 * uiUnit);
  swatchButton[2].setPosition(uiLeftRule + 60, padding + 13.5 * uiUnit);
  swatchButton[3].setPosition(uiLeftRule + 90, padding + 13.5 * uiUnit);
  swatchButton[4].setPosition(uiLeftRule + 120, padding + 13.5 * uiUnit);
  swatchButton[5].setPosition(uiLeftRule + 150, padding + 13.5 * uiUnit);
  swatchButton[6].setPosition(uiLeftRule + 180, padding + 13.5 * uiUnit);
  swatchButton[7].setPosition(uiLeftRule + 210, padding + 13.5 * uiUnit);
  swatchButton[8].setPosition(uiLeftRule + 240, padding + 13.5 * uiUnit);
  swatchButton[9].setPosition(uiLeftRule + 270, padding + 13.5 * uiUnit);
  swatchAnimButton[0].setPosition(uiLeftRule, padding + 15 * uiUnit);
  swatchAnimButton[1].setPosition(uiLeftRule + 30, padding + 15 * uiUnit);
  swatchAnimButton[2].setPosition(uiLeftRule + 60, padding + 15 * uiUnit);
  swatchAnimButton[3].setPosition(uiLeftRule + 90, padding + 15 * uiUnit);
  swatchAnimButton[4].setPosition(uiLeftRule + 120, padding + 15 * uiUnit);
  swatchAnimButton[5].setPosition(uiLeftRule + 150, padding + 15 * uiUnit);
  swatchAnimButton[6].setPosition(uiLeftRule + 180, padding + 15 * uiUnit);
  swatchAnimButton[7].setPosition(uiLeftRule + 210, padding + 15 * uiUnit);
  swatchAnimButton[8].setPosition(uiLeftRule + 240, padding + 15 * uiUnit);
  swatchAnimButton[9].setPosition(uiLeftRule + 270, padding + 15 * uiUnit);
}
