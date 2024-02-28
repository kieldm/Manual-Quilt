void drawControls(){
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
                             .setValue("BETTER CLIMATE BY DESIGN")
                             .setAutoClear(false)
                             .setColorBackground(color(0))
                             .setColorValueLabel(color(255))
                             .setFont(uiFontSys2)
                             .setCaptionLabel("");
    mainInputText.getValueLabel().setPaddingX(2);
    
    headlineToggle = cp5.addToggle("headline")
                                .setPosition(20, 205)
                                .setSize(60, 14)
                                .setValue(false)
                                .setCaptionLabel("HEADLINE")
                                .setColorActive(color(#374760))
                                .setMode(ControlP5.SWITCH);
    headlineToggle.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    justifyRadio = cp5.addRadioButton("justifyMode")
                                .setPosition(100, 205)
                                .setSize(30, 14)
                                .setItemsPerRow(5).setSpacingColumn(50)
                                .setColorActive(color(#6497F9))
                                .addItem("LEFT", 0)
                                .addItem("CENTER", 1)
                                .addItem("RIGHT", 2)
                                .setVisible(false)
                                .activate(0)
                                .setNoneSelectedAllowed(false);
    justifyRadio.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);


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
    
    swatchButton[0] = cp5.addButton("swatch0").setPosition(35, 315).setSize(55, 15).setImage(swatch[0]);
    swatchButton[1] = cp5.addButton("swatch1").setPosition(95, 315).setSize(55, 15).setImage(swatch[1]);
    swatchButton[2] = cp5.addButton("swatch2").setPosition(155, 315).setSize(55, 15).setImage(swatch[2]);
    swatchButton[3] = cp5.addButton("swatch3").setPosition(215, 315).setSize(55, 15).setImage(swatch[3]);
    swatchButton[4] = cp5.addButton("swatch4").setPosition(275, 315).setSize(55, 15).setImage(swatch[4]);
    swatchButton[5] = cp5.addButton("swatch5").setPosition(35, 335).setSize(55, 15).setImage(swatch[5]);
    swatchButton[6] = cp5.addButton("swatch6").setPosition(95, 335).setSize(55, 15).setImage(swatch[6]);
    swatchButton[7] = cp5.addButton("swatch7").setPosition(155, 335).setSize(55, 15).setImage(swatch[7]);
    swatchButton[8] = cp5.addButton("swatch8").setPosition(215, 335).setSize(55, 15).setImage(swatch[8]);
    swatchButton[9] = cp5.addButton("swatch9").setPosition(275, 335).setSize(55, 15).setImage(swatch[9]);

    swatchAnimButton[0] = cp5.addButton("swatchAnim0").setPosition(35, 365).setSize(55, 15).setVisible(false).setImage(swatch[0]);
    swatchAnimButton[1] = cp5.addButton("swatchAnim1").setPosition(95, 365).setSize(55, 15).setVisible(false).setImage(swatch[1]);
    swatchAnimButton[2] = cp5.addButton("swatchAnim2").setPosition(155, 365).setSize(55, 15).setVisible(false).setImage(swatch[2]);
    swatchAnimButton[3] = cp5.addButton("swatchAnim3").setPosition(215, 365).setSize(55, 15).setVisible(false).setImage(swatch[3]);
    swatchAnimButton[4] = cp5.addButton("swatchAnim4").setPosition(275, 365).setSize(55, 15).setVisible(false).setImage(swatch[4]);
    swatchAnimButton[5] = cp5.addButton("swatchAnim5").setPosition(35, 385).setSize(55, 15).setVisible(false).setImage(swatch[5]);
    swatchAnimButton[6] = cp5.addButton("swatchAnim6").setPosition(95, 385).setSize(55, 15).setVisible(false).setImage(swatch[6]);
    swatchAnimButton[7] = cp5.addButton("swatchAnim7").setPosition(155, 385).setSize(55, 15).setVisible(false).setImage(swatch[7]);
    swatchAnimButton[8] = cp5.addButton("swatchAnim8").setPosition(215, 385).setSize(55, 15).setVisible(false).setImage(swatch[8]);
    swatchAnimButton[9] = cp5.addButton("swatchAnim9").setPosition(275, 385).setSize(55, 15).setVisible(false).setImage(swatch[9]);

    // SCRUBBER
    scrubToggle = cp5.addToggle("scrubMode")
                             .setPosition(180,405)
                             .setSize(60,14)
                             .setValue(false)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(color(#374760))
                             .setCaptionLabel("SCRUB MODE");
    scrubToggle.getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(65);
    
    scrubSlider = cp5.addSlider("scrubber").setPosition(20, 425).setSize(300, 14).setRange(0, 1).setValue(0).setVisible(false).setCaptionLabel("SCRUBBER");    
    scrubSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    // FIELD
    xCountSlider = cp5.addSlider("xCount").setPosition(20, 480).setSize(150, 14).setRange(1, 50).setValue(24).setCaptionLabel("X Count");
    xCountSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    yCountSlider = cp5.addSlider("yCount").setPosition(20, 510).setSize(150, 14).setRange(1, 50).setValue(30).setCaptionLabel("Y Count");    
    yCountSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("xSpace").setPosition(180, 480).setSize(150, 14).setRange(1, 100).setValue(25).setCaptionLabel("X Space");
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

    waveSizeSlider = cp5.addSlider("waveSize").setPosition(20, 620).setSize(310, 14).setRange(0, 200).setValue(24).setCaptionLabel("Size");    
    cp5.getController("waveSize").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cp5.addSlider("loopLength").setPosition(20, 650).setSize(310, 14).setRange(60,400).setValue(180).setCaptionLabel("Loop Length");    
    cp5.getController("loopLength").getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    // CAMERA
    cameraRotXSlider = cp5.addSlider("cameraRotX").setPosition(20, 720).setSize(150, 14).setRange(-PI/3, PI/3).setValue(0.26).setCaptionLabel("Rotate X");
    cameraRotXSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cameraRotYSlider = cp5.addSlider("cameraRotY").setPosition(20, 750).setSize(150, 14).setRange(-PI/3, PI/3).setValue(-0.25).setCaptionLabel("Rotate Y");
    cameraRotYSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    cameraRotZSlider = cp5.addSlider("cameraRotZ").setPosition(20, 780).setSize(150, 14).setRange(-PI/3, PI/3).setValue(-0.17).setCaptionLabel("Rotate Z");
    cameraRotZSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    cameraPosXSlider = cp5.addSlider("cameraPosX").setPosition(20, 810).setSize(150, 14).setRange(-600, 600).setValue(0.0).setCaptionLabel("Pan X");
    cameraPosXSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);


    cp5.addButton("resetCamera").setPosition(20, 850).setSize(150,30).setCaptionLabel("Reset Camera");

    animateCameraToggle = cp5.addToggle("animateCamera")
                             .setPosition(180,700)
                             .setSize(60,14)
                             .setValue(false)
                             .setMode(ControlP5.SWITCH)
                             .setColorActive(color(#374760))
                             .setCaptionLabel("Animate Camera");
    animateCameraToggle.getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(65);

    animateRotXSlider = cp5.addSlider("animateRotX")
                           .setPosition(180, 720)
                           .setSize(150, 14)
                           .setRange(-PI/3, PI/3)
                           .setValue(0)
                           .setCaptionLabel("Animate Rotate X")
                           .setLock(true)
                           .setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
    animateRotXSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    animateRotYSlider = cp5.addSlider("animateRotY")
                           .setPosition(180, 750)
                           .setSize(150, 14)
                           .setRange(-PI/3, PI/3)
                           .setValue(0.25)
                           .setCaptionLabel("Animate Rotate Y")
                           .setLock(true)
                           .setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
    animateRotYSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);
    
    animateRotZSlider = cp5.addSlider("animateRotZ")
                           .setPosition(180, 780)
                           .setSize(150, 14)
                           .setRange(-PI/3, PI/3)
                           .setValue(0)
                           .setCaptionLabel("Animate Rotate Z")
                           .setLock(true)
                           .setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
    animateRotZSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    animateZoomZSlider = cp5.addSlider("animateZoomZ")
                            .setPosition(180, 810)
                            .setSize(150, 14)
                            .setRange(-300, 300)
                            .setValue(0)
                            .setCaptionLabel("Animate Zoom Z")
                            .setLock(true)
                            .setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));
    animateZoomZSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    animatePosXSlider = cp5.addSlider("animatePosX")
                            .setPosition(180, 840)
                            .setSize(150, 14)
                            .setRange(-400, 400)
                            .setValue(0)
                            .setCaptionLabel("Animate Pan X")
                            .setLock(true)
                            .setColorForeground(color(70)).setColorCaptionLabel(color(100)).setColorValue(color(120));;
    animatePosXSlider.getCaptionLabel().align(ControlP5.BOTTOM, ControlP5.BOTTOM_OUTSIDE).setPaddingY(-2);

    // EXPORT
    cp5.addButton("exportSVG").setPosition(20, 950).setSize(100,40).setCaptionLabel("SVG");
    cp5.addButton("exportSeq").setPosition(125, 950).setSize(100,40).setCaptionLabel("Sequence");
    cp5.addButton("exportMP4").setPosition(230, 950).setSize(100,40).setCaptionLabel("MP4");
}

void drawUI(){
  noStroke();
  fill(uiForeColor);
            
  textFont(uiFontHead);
  textSize(60);
  text("QUILT_0.51", 20, 65);
  
  textFont(uiFontMain);
  textSize(20);
  text("CANVAS", 20, 95);
  text("TEXT", 20, 165);
  text("COLOR", 20, 285);
  text("ANIMATE", 20, 420);
  
  push();
    translate(30, 350);
    rotateZ(-PI/2);
    textFont(uiFontSub);
    if(animateColor){
      text("CLR-A", 0, 0);
      text("CLR-B", -50, 0);
    } else {
      text("SWATCH", 0, 0);
    }
  pop();
  
  for(var m = 0; m < 2; m ++){    //////////// DRAW SWATCH SELECT FOR TOP SWATCHES
    for(var n = 0; n < 5; n ++){
      if(swatchSel[m * 5 + n]){
        stroke(255);
        strokeWeight(2);
        rect(35 + n * 60, 315 + m * 20, 55, 15);
      }
    }
  }
  if(animateColor){
    for(var m = 0; m < 2; m ++){    //////////// DRAW SWATCH SELECT FOR BOT SWATCHES
      for(var n = 0; n < 5; n ++){
        if(swatchAnimSel[m * 5 + n]){
          stroke(255);
          strokeWeight(2);
          rect(35 + n * 60, 365 + m * 20, 55, 15);
        }
      }
    }  
  }
  
  text("FIELD", 20, 475);
  text("WAVE", 20, 565);

  textFont(uiFontMain);
  textSize(20);
  text("CAMERA", 20, 715);
  text("EXPORT", 20, 940);
}
