class Raylib {
 foreign static initWindow(a,b,c)
 foreign static closeWindow()
 foreign static windowShouldClose()
 foreign static isWindowReady()
 foreign static isWindowFullscreen()
 foreign static isWindowHidden()
 foreign static isWindowMinimized()
 foreign static isWindowMaximized()
 foreign static isWindowFocused()
 foreign static isWindowResized()
 foreign static isWindowState(a)
 foreign static setWindowState(a)
 foreign static clearWindowState(a)
 foreign static toggleFullscreen()
 foreign static toggleBorderlessWindowed()
 foreign static maximizeWindow()
 foreign static minimizeWindow()
 foreign static restoreWindow()
 foreign static setWindowIcon(a)
 foreign static setWindowIcons(a,b)
 foreign static setWindowTitle(a)
 foreign static setWindowPosition(a,b)
 foreign static setWindowMonitor(a)
 foreign static setWindowMinSize(a,b)
 foreign static setWindowMaxSize(a,b)
 foreign static setWindowSize(a,b)
 foreign static setWindowOpacity(a)
 foreign static setWindowFocused()
 foreign static getScreenWidth()
 foreign static getScreenHeight()
 foreign static getRenderWidth()
 foreign static getRenderHeight()
 foreign static getMonitorCount()
 foreign static getCurrentMonitor()
 foreign static getMonitorPosition(a)
 foreign static getMonitorWidth(a)
 foreign static getMonitorHeight(a)
 foreign static getMonitorPhysicalWidth(a)
 foreign static getMonitorPhysicalHeight(a)
 foreign static getMonitorRefreshRate(a)
 foreign static getWindowPosition()
 foreign static getWindowScaleDPI()
 foreign static getMonitorName(a)
 foreign static setClipboardText(a)
 foreign static getClipboardText()
 foreign static getClipboardImage()
 foreign static enableEventWaiting()
 foreign static disableEventWaiting()
 foreign static showCursor()
 foreign static hideCursor()
 foreign static isCursorHidden()
 foreign static enableCursor()
 foreign static disableCursor()
 foreign static isCursorOnScreen()
 foreign static clearBackground(a)
 foreign static beginDrawing()
 foreign static endDrawing()
 foreign static beginMode2D(a)
 foreign static endMode2D()
 foreign static beginMode3D(a)
 foreign static endMode3D()
 foreign static beginTextureMode(a)
 foreign static endTextureMode()
 foreign static beginShaderMode(a)
 foreign static endShaderMode()
 foreign static beginBlendMode(a)
 foreign static endBlendMode()
 foreign static beginScissorMode(a,b,c,d)
 foreign static endScissorMode()
 foreign static beginVrStereoMode(a)
 foreign static endVrStereoMode()
 foreign static loadVrStereoConfig(a)
 foreign static unloadVrStereoConfig(a)
 foreign static loadShader(a,b)
 foreign static loadShaderFromMemory(a,b)
 foreign static isShaderValid(a)
 foreign static getShaderLocation(a,b)
 foreign static getShaderLocationAttrib(a,b)
 foreign static setShaderValueMatrix(a,b,c)
 foreign static setShaderValueTexture(a,b,c)
 foreign static unloadShader(a)
 foreign static getScreenToWorldRay(a,b)
 foreign static getScreenToWorldRayEx(a,b,c,d)
 foreign static getWorldToScreen(a,b)
 foreign static getWorldToScreenEx(a,b,c,d)
 foreign static getWorldToScreen2D(a,b)
 foreign static getScreenToWorld2D(a,b)
 foreign static getCameraMatrix(a)
 foreign static getCameraMatrix2D(a)
 foreign static setTargetFPS(a)
 foreign static getFrameTime()
 foreign static getTime()
 foreign static getFPS()
 foreign static swapScreenBuffer()
 foreign static pollInputEvents()
 foreign static waitTime(a)
 foreign static setRandomSeed(a)
 foreign static getRandomValue(a,b)
 foreign static loadRandomSequence(a,b,c)
 foreign static unloadRandomSequence(a)
 foreign static takeScreenshot(a)
 foreign static setConfigFlags(a)
 foreign static openURL(a)
 foreign static setTraceLogLevel(a)
 foreign static memAlloc(a)
 foreign static setTraceLogCallback(a)
 foreign static setLoadFileDataCallback(a)
 foreign static setSaveFileDataCallback(a)
 foreign static setLoadFileTextCallback(a)
 foreign static setSaveFileTextCallback(a)
 foreign static loadFileData(a,b)
 foreign static unloadFileData(a)
 foreign static exportDataAsCode(a,b,c)
 foreign static loadFileText(a)
 foreign static unloadFileText(a)
 foreign static saveFileText(a,b)
 foreign static fileExists(a)
 foreign static directoryExists(a)
 foreign static isFileExtension(a,b)
 foreign static getFileLength(a)
 foreign static getFileExtension(a)
 foreign static getFileName(a)
 foreign static getFileNameWithoutExt(a)
 foreign static getDirectoryPath(a)
 foreign static getPrevDirectoryPath(a)
 foreign static getWorkingDirectory()
 foreign static getApplicationDirectory()
 foreign static makeDirectory(a)
 foreign static changeDirectory(a)
 foreign static isPathFile(a)
 foreign static isFileNameValid(a)
 foreign static loadDirectoryFiles(a)
 foreign static loadDirectoryFilesEx(a,b,c)
 foreign static unloadDirectoryFiles(a)
 foreign static isFileDropped()
 foreign static loadDroppedFiles()
 foreign static unloadDroppedFiles(a)
 foreign static getFileModTime(a)
 foreign static compressData(a,b,c)
 foreign static decompressData(a,b,c)
 foreign static encodeDataBase64(a,b,c)
 foreign static decodeDataBase64(a,b)
 foreign static computeCRC32(a,b)
 foreign static computeMD5(a,b)
 foreign static computeSHA1(a,b)
 foreign static loadAutomationEventList(a)
 foreign static unloadAutomationEventList(a)
 foreign static exportAutomationEventList(a,b)
 foreign static setAutomationEventList(a)
 foreign static setAutomationEventBaseFrame(a)
 foreign static startAutomationEventRecording()
 foreign static stopAutomationEventRecording()
 foreign static playAutomationEvent(a)
 foreign static isKeyPressed(a)
 foreign static isKeyPressedRepeat(a)
 foreign static isKeyDown(a)
 foreign static isKeyReleased(a)
 foreign static isKeyUp(a)
 foreign static getKeyPressed()
 foreign static getCharPressed()
 foreign static setExitKey(a)
 foreign static isGamepadAvailable(a)
 foreign static getGamepadName(a)
 foreign static isGamepadButtonPressed(a,b)
 foreign static isGamepadButtonDown(a,b)
 foreign static isGamepadButtonReleased(a,b)
 foreign static isGamepadButtonUp(a,b)
 foreign static getGamepadButtonPressed()
 foreign static getGamepadAxisCount(a)
 foreign static getGamepadAxisMovement(a,b)
 foreign static setGamepadMappings(a)
 foreign static setGamepadVibration(a,b,c,d)
 foreign static isMouseButtonPressed(a)
 foreign static isMouseButtonDown(a)
 foreign static isMouseButtonReleased(a)
 foreign static isMouseButtonUp(a)
 foreign static getMouseX()
 foreign static getMouseY()
 foreign static getMousePosition()
 foreign static getMouseDelta()
 foreign static setMousePosition(a,b)
 foreign static setMouseOffset(a,b)
 foreign static setMouseScale(a,b)
 foreign static getMouseWheelMove()
 foreign static getMouseWheelMoveV()
 foreign static setMouseCursor(a)
 foreign static getTouchX()
 foreign static getTouchY()
 foreign static getTouchPosition(a)
 foreign static getTouchPointId(a)
 foreign static getTouchPointCount()
 foreign static setGesturesEnabled(a)
 foreign static isGestureDetected(a)
 foreign static getGestureDetected()
 foreign static getGestureHoldDuration()
 foreign static getGestureDragVector()
 foreign static getGestureDragAngle()
 foreign static getGesturePinchVector()
 foreign static getGesturePinchAngle()
 foreign static updateCamera(a,b)
 foreign static updateCameraPro(a,b,c,d)
 foreign static drawPixel(a,b,c)
 foreign static drawPixelV(a,b)
 foreign static drawLine(a,b,c,d,e)
 foreign static drawLineV(a,b,c)
 foreign static drawLineEx(a,b,c,d)
 foreign static drawLineStrip(a,b,c)
 foreign static drawLineBezier(a,b,c,d)
 foreign static drawCircle(a,b,c,d)
 foreign static drawCircleSector(a,b,c,d,e,f)
 foreign static drawCircleSectorLines(a,b,c,d,e,f)
 foreign static drawCircleGradient(a,b,c,d,e)
 foreign static drawCircleV(a,b,c)
 foreign static drawCircleLines(a,b,c,d)
 foreign static drawCircleLinesV(a,b,c)
 foreign static drawEllipse(a,b,c,d,e)
 foreign static drawEllipseLines(a,b,c,d,e)
 foreign static drawRing(a,b,c,d,e,f,g)
 foreign static drawRingLines(a,b,c,d,e,f,g)
 foreign static drawRectangle(a,b,c,d,e)
 foreign static drawRectangleV(a,b,c)
 foreign static drawRectangleRec(a,b)
 foreign static drawRectanglePro(a,b,c,d)
 foreign static drawRectangleGradientV(a,b,c,d,e,f)
 foreign static drawRectangleGradientH(a,b,c,d,e,f)
 foreign static drawRectangleGradientEx(a,b,c,d,e)
 foreign static drawRectangleLines(a,b,c,d,e)
 foreign static drawRectangleLinesEx(a,b,c)
 foreign static drawRectangleRounded(a,b,c,d)
 foreign static drawRectangleRoundedLines(a,b,c,d)
 foreign static drawRectangleRoundedLinesEx(a,b,c,d,e)
 foreign static drawTriangle(a,b,c,d)
 foreign static drawTriangleLines(a,b,c,d)
 foreign static drawTriangleFan(a,b,c)
 foreign static drawTriangleStrip(a,b,c)
 foreign static drawPoly(a,b,c,d,e)
 foreign static drawPolyLines(a,b,c,d,e)
 foreign static drawPolyLinesEx(a,b,c,d,e,f)
 foreign static drawSplineLinear(a,b,c,d)
 foreign static drawSplineBasis(a,b,c,d)
 foreign static drawSplineCatmullRom(a,b,c,d)
 foreign static drawSplineBezierQuadratic(a,b,c,d)
 foreign static drawSplineBezierCubic(a,b,c,d)
 foreign static drawSplineSegmentLinear(a,b,c,d)
 foreign static drawSplineSegmentBasis(a,b,c,d,e,f)
 foreign static drawSplineSegmentCatmullRom(a,b,c,d,e,f)
 foreign static drawSplineSegmentBezierQuadratic(a,b,c,d,e)
 foreign static drawSplineSegmentBezierCubic(a,b,c,d,e,f)
 foreign static getSplinePointLinear(a,b,c)
 foreign static getSplinePointBasis(a,b,c,d,e)
 foreign static getSplinePointCatmullRom(a,b,c,d,e)
 foreign static getSplinePointBezierQuad(a,b,c,d)
 foreign static getSplinePointBezierCubic(a,b,c,d,e)
 foreign static checkCollisionRecs(a,b)
 foreign static checkCollisionCircles(a,b,c,d)
 foreign static checkCollisionCircleRec(a,b,c)
 foreign static checkCollisionCircleLine(a,b,c,d)
 foreign static checkCollisionPointRec(a,b)
 foreign static checkCollisionPointCircle(a,b,c)
 foreign static checkCollisionPointTriangle(a,b,c,d)
 foreign static checkCollisionPointLine(a,b,c,d)
 foreign static checkCollisionPointPoly(a,b,c)
 foreign static checkCollisionLines(a,b,c,d,e)
 foreign static getCollisionRec(a,b)

 foreign static loadRenderTexture(width, height)
 foreign static drawText(text, x, y, z, color)
 foreign static drawTexturePro(texture, source, dest, origin, rotation, tint)
 foreign static endTextureMode(target)
 foreign static unloadRenderTexture(target)

 foreign static loadImage(a)
 foreign static loadImageRaw(a,b,c,d,e)
 foreign static loadImageAnim(a,b)
 foreign static loadImageAnimFromMemory(a,b,c,d)
 foreign static loadImageFromMemory(a,b,c)
 foreign static loadImageFromTexture(a)
 foreign static loadImageFromScreen()
 foreign static isImageValid(a)
 foreign static unloadImage(a)
 foreign static exportImage(a,b)
 foreign static exportImageToMemory(a,b,c)
 foreign static exportImageAsCode(a,b)

 foreign static genImageColor(a,b,c)
 foreign static genImageGradientLinear(a,b,c,d,e)
 foreign static genImageGradientRadial(a,b,c,d,e)
 foreign static genImageGradientSquare(a,b,c,d,e)
 foreign static genImageChecked(a,b,c,d,e,f)
 foreign static genImageWhiteNoise(a,b,c)
 foreign static genImagePerlinNoise(a,b,c,d,e)
 foreign static genImageCellular(a,b,c)
 foreign static genImageText(a,b,c)
 foreign static imageCopy(a)
 foreign static imageFromImage(a,b)
 foreign static imageFromChannel(a,b)
 foreign static imageText(a,b,c)
 foreign static imageTextEx(a,b,c,d,e)
 foreign static imageFormat(a,b)
 foreign static imageToPOT(a,b)
 foreign static imageCrop(a,b)
 foreign static imageAlphaCrop(a,b)
 foreign static imageAlphaClear(a,b,c)
 foreign static imageAlphaMask(a,b)
 foreign static imageAlphaPremultiply(a)
 foreign static imageBlurGaussian(a,b)
 foreign static imageKernelConvolution(a,b,c)
 foreign static imageResize(a,b,c)
 foreign static imageResizeNN(a,b,c)
 foreign static imageResizeCanvas(a,b,c,d,e,f)
 foreign static imageMipmaps(a)
 foreign static imageDither(a,b,c,d,e)
 foreign static imageFlipVertical(a)
 foreign static imageFlipHorizontal(a)
 foreign static imageRotate(a,b)
 foreign static imageRotateCW(a)
 foreign static imageRotateCCW(a)
 foreign static imageColorTint(a,b)
 foreign static imageColorInvert(a)
 foreign static imageColorGrayscale(a)
 foreign static imageColorContrast(a,b)
 foreign static imageColorBrightness(a,b)
 foreign static imageColorReplace(a,b,c)
 foreign static loadImageColors(a)
 foreign static loadImagePalette(a,b,c)
 foreign static unloadImageColors(a)
 foreign static unloadImagePalette(a)
 foreign static getImageAlphaBorder(a,b)
 foreign static getImageColor(a,b,c)
 foreign static imageClearBackground(a,b)
 foreign static imageDrawPixel(a,b,c,d)
 foreign static imageDrawPixelV(a,b,c)
 foreign static imageDrawLine(a,b,c,d,e,f)
 foreign static imageDrawLineV(a,b,c,d)
 foreign static imageDrawLineEx(a,b,c,d,e)
 foreign static imageDrawCircle(a,b,c,d,e)
 foreign static imageDrawCircleV(a,b,c,d)
 foreign static imageDrawCircleLines(a,b,c,d,e)
 foreign static imageDrawCircleLinesV(a,b,c,d)
 foreign static imageDrawRectangle(a,b,c,d,e,f)
 foreign static imageDrawRectangleV(a,b,c,d)
 foreign static imageDrawRectangleRec(a,b,c)
 foreign static imageDrawRectangleLines(a,b,c,d)
 foreign static imageDrawTriangle(a,b,c,d,e)
 foreign static imageDrawTriangleEx(a,b,c,d,e,f,g)
 foreign static imageDrawTriangleLines(a,b,c,d,e)
 foreign static imageDrawTriangleFan(a,b,c,d)
 foreign static imageDrawTriangleStrip(a,b,c,d)
 foreign static imageDraw(a,b,c,d,e)
 foreign static imageDrawText(a,b,c,d,e,f)
 foreign static imageDrawTextEx(a,b,c,d,e,f,g)
 foreign static loadTexture(a)
 foreign static loadTextureFromImage(a)
 foreign static loadTextureCubemap(a,b)
 foreign static isTextureValid(a)
 foreign static unloadTexture(a)
 foreign static isRenderTextureValid(a)
 foreign static updateTexture(a,b)
 foreign static updateTextureRec(a,b,c)
 foreign static genTextureMipmaps(a)
 foreign static setTextureFilter(a,b)
 foreign static setTextureWrap(a,b)
 foreign static drawTexture(a,b,c,d)
 foreign static drawTextureV(a,b,c)
 foreign static drawTextureEx(a,b,c,d,e)
 foreign static drawTextureRec(a,b,c,d)
 foreign static drawTextureNPatch(a,b,c,d,e,f)
 foreign static colorIsEqual(a,b)
 foreign static fade(a,b)
 foreign static colorToInt(a)
 foreign static colorNormalize(a)
 foreign static colorFromNormalized(a)
 foreign static colorToHSV(a)
 foreign static colorFromHSV(a,b,c)
 foreign static colorTint(a,b)
 foreign static colorBrightness(a,b)
 foreign static colorContrast(a,b)
 foreign static colorAlpha(a,b)
 foreign static colorAlphaBlend(a,b,c)
 foreign static colorLerp(a,b,c)
 foreign static getColor(a)
 foreign static getPixelColor(a,b)
 foreign static setPixelColor(a,b,c)
 foreign static getPixelDataSize(a,b,c)
 foreign static drawLine3D(a,b,c)
 foreign static drawPoint3D(a,b)
 foreign static drawCircle3D(a,b,c,d,e)
 foreign static drawTriangle3D(a,b,c,d)
 foreign static drawTriangleStrip3D(a,b,c)
 foreign static drawCube(a,b,c,d,e)
 foreign static drawCubeV(a,b,c)
 foreign static drawCubeWires(a,b,c,d,e)
 foreign static drawCubeWiresV(a,b,c)
 foreign static drawSphere(a,b,c)
 foreign static drawSphereEx(a,b,c,d,e)
 foreign static drawSphereWires(a,b,c,d,e)
 foreign static drawCylinder(a,b,c,d,e,f)
 foreign static drawCylinderEx(a,b,c,d,e,f)
 foreign static drawCylinderWires(a,b,c,d,e,f)
 foreign static drawCylinderWiresEx(a,b,c,d,e,f)
 foreign static drawCapsule(a,b,c,d,e,f)
 foreign static drawCapsuleWires(a,b,c,d,e,f)
 foreign static drawPlane(a,b,c)
 foreign static drawRay(a,b)
 foreign static drawGrid(a,b)
 foreign static loadModel(a)
 foreign static loadModelFromMesh(a)
 foreign static isModelValid(a)
 foreign static unloadModel(a)
 foreign static getModelBoundingBox(a)
 foreign static drawModel(a,b,c,d)
 foreign static drawModelEx(a,b,c,d,e,f)
 foreign static drawModelWires(a,b,c,d)
 foreign static drawModelWiresEx(a,b,c,d,e,f)
 foreign static drawModelPoints(a,b,c,d)
 foreign static drawModelPointsEx(a,b,c,d,e,f)
 foreign static drawBoundingBox(a,b)
 foreign static drawBillboard(a,b,c,d,e)
 foreign static drawBillboardRec(a,b,c,d,e,f)
 foreign static drawBillboardPro(a,b,c,d,e,f,g,h,i)
 foreign static uploadMesh(a,b)
 foreign static updateMeshBuffer(a,b,c,d,e)
 foreign static unloadMesh(a)
 foreign static drawMesh(a,b,c)
 foreign static drawMeshInstanced(a,b,c,d)
 foreign static getMeshBoundingBox(a)
 foreign static genMeshTangents(a)
 foreign static exportMesh(a,b)
 foreign static exportMeshAsCode(a,b)
 foreign static genMeshPoly(a,b)
 foreign static genMeshPlane(a,b,c,d)
 foreign static genMeshCube(a,b,c)
 foreign static genMeshSphere(a,b,c)
 foreign static genMeshHemiSphere(a,b,c)
 foreign static genMeshCylinder(a,b,c)
 foreign static genMeshCone(a,b,c)
 foreign static genMeshTorus(a,b,c,d)
 foreign static genMeshKnot(a,b,c,d)
 foreign static genMeshHeightmap(a,b)
 foreign static genMeshCubicmap(a,b)
 foreign static loadMaterials(a,b)
 foreign static loadMaterialDefault()
 foreign static isMaterialValid(a)
 foreign static unloadMaterial(a)
 foreign static setMaterialTexture(a,b,c)
 foreign static setModelMeshMaterial(a,b,c)
 foreign static loadModelAnimations(a,b)
 foreign static updateModelAnimation(a,b,c)
 foreign static updateModelAnimationBones(a,b,c)
 foreign static unloadModelAnimation(a)
 foreign static unloadModelAnimations(a,b)
 foreign static isModelAnimationValid(a,b)
 foreign static checkCollisionSpheres(a,b,c,d)
 foreign static checkCollisionBoxes(a,b)
 foreign static checkCollisionBoxSphere(a,b,c)
 foreign static getRayCollisionSphere(a,b,c)
 foreign static getRayCollisionBox(a,b)
 foreign static getRayCollisionMesh(a,b,c)
 foreign static getRayCollisionTriangle(a,b,c,d)
 foreign static getRayCollisionQuad(a,b,c,d,e)

 foreign static initAudioDevice()
 foreign static closeAudioDevice()
 foreign static isAudioDeviceReady()
 foreign static setMasterVolume(a)
 foreign static getMasterVolume()
 foreign static loadWave(a)
 foreign static loadWaveFromMemory(a,b,c)
 foreign static isWaveValid(a)
 foreign static loadSound(a)
 foreign static loadSoundFromWave(a)
 foreign static loadSoundAlias(a)
 foreign static isSoundValid(a)
 foreign static updateSound(a,b,c)
 foreign static unloadWave(a)
 foreign static unloadSound(a)
 foreign static unloadSoundAlias(a)
 foreign static exportWave(a,b)
 foreign static exportWaveAsCode(a,b)
 foreign static playSound(a)
 foreign static stopSound(a)
 foreign static pauseSound(a)
 foreign static resumeSound(a)
 foreign static isSoundPlaying(a)
 foreign static setSoundVolume(a,b)
 foreign static setSoundPitch(a,b)
 foreign static setSoundPan(a,b)
 foreign static waveCopy(a)
 foreign static waveCrop(a,b,c)
 foreign static waveFormat(a,b,c,d)
 foreign static loadWaveSamples(a)
 foreign static unloadWaveSamples(a)
 foreign static loadMusicStream(a)
 foreign static loadMusicStreamFromMemory(a,b,c)
 foreign static isMusicValid(a)
 foreign static unloadMusicStream(a)
 foreign static playMusicStream(a)
 foreign static isMusicStreamPlaying(a)
 foreign static updateMusicStream(a)
 foreign static stopMusicStream(a)
 foreign static pauseMusicStream(a)
 foreign static resumeMusicStream(a)
 foreign static seekMusicStream(a,b)
 foreign static setMusicVolume(a,b)
 foreign static setMusicPitch(a,b)
 foreign static setMusicPan(a,b)
 foreign static getMusicTimeLength(a)
 foreign static getMusicTimePlayed(a)
 foreign static loadAudioStream(a,b,c)
 foreign static isAudioStreamValid(a)
 foreign static unloadAudioStream(a)
 foreign static updateAudioStream(a,b,c)
 foreign static isAudioStreamProcessed(a)
 foreign static playAudioStream(a)
 foreign static pauseAudioStream(a)
 foreign static resumeAudioStream(a)
 foreign static isAudioStreamPlaying(a)
 foreign static stopAudioStream(a)
 foreign static setAudioStreamVolume(a,b)
 foreign static setAudioStreamPitch(a,b)
 foreign static setAudioStreamPan(a,b)
 foreign static setAudioStreamBufferSizeDefault(a)
 foreign static setAudioStreamCallback(a,b)
 foreign static attachAudioStreamProcessor(a,b)
 foreign static detachAudioStreamProcessor(a,b)
 foreign static attachAudioMixedProcessor(a)
 foreign static detachAudioMixedProcessor(a)




} 

foreign class Color {
  construct new(r, g, b, a) {}

  static LightGray  { Color.new(200, 200, 200, 255) }
  static Gray       { Color.new(130, 130, 130, 255) }
  static DarkGray   { Color.new(80, 80, 80, 255) }
  static Yellow     { Color.new(253, 249, 0, 255) }
  static Gold       { Color.new(255, 203, 0, 255) }
  static Orange     { Color.new(255, 161, 0, 255) }
  static Pink       { Color.new(255, 109, 194, 255) }
  static Red        { Color.new(230, 41, 55, 255) }
  static Maroon     { Color.new(190, 33, 55, 255) }
  static Green      { Color.new(0, 228, 48, 255) }
  static Lime       { Color.new(0, 158, 47, 255) }
  static DarkGreen  { Color.new(0, 117, 44, 255) }
  static SkyBlue    { Color.new(102, 191, 255, 255) }
  static Blue       { Color.new(0, 121, 241, 255) }
  static DarkBlue   { Color.new(0, 82, 172, 255) }
  static Purple     { Color.new(200, 122, 255, 255) }
  static Violet     { Color.new(135, 60, 190, 255) }
  static DarkPurple { Color.new(112, 31, 126, 255) }
  static Beige      { Color.new(211, 176, 131, 255) }
  static Brown      { Color.new(127, 106, 79, 255) }
  static DarkBrown  { Color.new(76, 63, 47, 255) }

  static White      { Color.new(255, 255, 255, 255) }
  static Black      { Color.new(0, 0, 0, 255) }
  static Blank      { Color.new(0, 0, 0, 0) }
  static Magenta    { Color.new(255, 0, 255, 255) }
  static RayWhite   { Color.new(245, 245, 245, 255) }
}

foreign class RenderTexture2D {
  construct new() {}

  foreign texture
}

foreign class Texture2D {
  construct new() {}

  foreign width
  foreign height

  foreign static loadTexture(path)
  foreign unloadTexture()
}

foreign class Rectangle {
  construct new(x, y, width, height) {}

  foreign x
  foreign x=(value)

  foreign y
  foreign y=(value)

  foreign width
  foreign width=(value)

  foreign height
  foreign height=(value)

  foreign drawRectangleRec(color)
}

foreign class Vector2 {
  construct new(x, y) {}

  foreign x
  foreign y
  foreign x=(value)
  foreign y=(value)
}

foreign class Vector3 {
  construct new(x, y, z) {}

  foreign x
  foreign x=(value)

  foreign y
  foreign y=(value)

  foreign z
  foreign z=(value)
}

foreign class Image {
  construct new() {}
}

foreign class Font {
  construct new() {}
}

foreign class Wave {
  construct new() {}
}

foreign class Sound {
  construct new() {}
}

foreign class Music {
  construct new() {}
}

foreign class AudioStream {
  construct new() {}
}

foreign class Camera2D {
  construct new(offset, target, rotation, zoom) {}

  foreign beginMode2D()
  foreign endMode2D()

  foreign target
  foreign target=(value)

  foreign rotation
  foreign rotation=(value)

  foreign zoom 
  foreign zoom=(value)
}


// Generated by chatgpt from raylib keycode lists
// 
class KeyCode {
  static KEY_NULL {  0  }       // Key: NULL, used for no key pressed
  // Alphanumeric keys
  static KEY_APOSTROPHE { 39 }       // Key: '
  static KEY_COMMA { 44            } // Key: ,
  static KEY_MINUS { 45            } // Key: -
  static KEY_PERIOD { 46           } // Key: .
  static KEY_SLASH { 47            } // Key: /
  static KEY_ZERO { 48             } // Key: 0
  static KEY_ONE { 49              } // Key: 1
  static KEY_TWO { 50              } // Key: 2
  static KEY_THREE { 51            } // Key: 3
  static KEY_FOUR { 52             } // Key: 4
  static KEY_FIVE { 53             } // Key: 5
  static KEY_SIX { 54              } // Key: 6
  static KEY_SEVEN { 55            } // Key: 7
  static KEY_EIGHT { 56            } // Key: 8
  static KEY_NINE { 57             } // Key: 9
  static KEY_SEMICOLON { 59        } // Key: ;
  static KEY_EQUAL { 61            } // Key: =
  static KEY_A { 65                } // Key: A | a
  static KEY_B { 66                } // Key: B | b
  static KEY_C { 67                } // Key: C | c
  static KEY_D { 68                } // Key: D | d
  static KEY_E { 69                } // Key: E | e
  static KEY_F { 70                } // Key: F | f
  static KEY_G { 71                } // Key: G | g
  static KEY_H { 72                } // Key: H | h
  static KEY_I { 73                } // Key: I | i
  static KEY_J { 74                } // Key: J | j
  static KEY_K { 75                } // Key: K | k
  static KEY_L { 76                } // Key: L | l
  static KEY_M { 77                } // Key: M | m
  static KEY_N { 78                } // Key: N | n
  static KEY_O { 79                } // Key: O | o
  static KEY_P { 80                } // Key: P | p
  static KEY_Q { 81                } // Key: Q | q
  static KEY_R { 82                } // Key: R | r
  static KEY_S { 83                } // Key: S | s
  static KEY_T { 84                } // Key: T | t
  static KEY_U { 85                } // Key: U | u
  static KEY_V { 86                } // Key: V | v
  static KEY_W { 87                } // Key: W | w
  static KEY_X { 88                } // Key: X | x
  static KEY_Y { 89                } // Key: Y | y
  static KEY_Z { 90                } // Key: Z | z
  static KEY_LEFT_BRACKET { 91     } // Key: [
  static KEY_BACKSLASH { 92        } // Key: '\'
  static KEY_RIGHT_BRACKET { 93    } // Key: ]
  static KEY_GRAVE { 96            } // Key: `
  // Function keys
  static KEY_SPACE { 32            } // Key: Space
  static KEY_ESCAPE { 256          } // Key: Esc
  static KEY_ENTER { 257           } // Key: Enter
  static KEY_TAB { 258             } // Key: Tab
  static KEY_BACKSPACE { 259       } // Key: Backspace
  static KEY_INSERT { 260          } // Key: Ins
  static KEY_DELETE { 261          } // Key: Del
  static KEY_RIGHT { 262           } // Key: Cursor right
  static KEY_LEFT { 263            } // Key: Cursor left
  static KEY_DOWN { 264            } // Key: Cursor down
  static KEY_UP { 265              } // Key: Cursor up
  static KEY_PAGE_UP { 266         } // Key: Page up
  static KEY_PAGE_DOWN { 267       } // Key: Page down
  static KEY_HOME { 268            } // Key: Home
  static KEY_END { 269             } // Key: End
  static KEY_CAPS_LOCK { 280       } // Key: Caps lock
  static KEY_SCROLL_LOCK { 281     } // Key: Scroll down
  static KEY_NUM_LOCK { 282        } // Key: Num lock
  static KEY_PRINT_SCREEN { 283    } // Key: Print screen
  static KEY_PAUSE { 284           } // Key: Pause
  static KEY_F1 { 290              } // Key: F1
  static KEY_F2 { 291              } // Key: F2
  static KEY_F3 { 292              } // Key: F3
  static KEY_F4 { 293              } // Key: F4
  static KEY_F5 { 294              } // Key: F5
  static KEY_F6 { 295              } // Key: F6
  static KEY_F7 { 296              } // Key: F7
  static KEY_F8 { 297              } // Key: F8
  static KEY_F9 { 298              } // Key: F9
  static KEY_F10 { 299             } // Key: F10
  static KEY_F11 { 300             } // Key: F11
  static KEY_F12 { 301             } // Key: F12
  static KEY_LEFT_SHIFT { 340      } // Key: Shift left
  static KEY_LEFT_CONTROL { 341    } // Key: Control left
  static KEY_LEFT_ALT { 342        } // Key: Alt left
  static KEY_LEFT_SUPER { 343      } // Key: Super left
  static KEY_RIGHT_SHIFT { 344     } // Key: Shift right
  static KEY_RIGHT_CONTROL { 345   } // Key: Control right
  static KEY_RIGHT_ALT { 346       } // Key: Alt right
  static KEY_RIGHT_SUPER { 347     } // Key: Super right
  static KEY_KB_MENU { 348         } // Key: KB menu
  // Keypad keys
  static KEY_KP_0 { 320            } // Key: Keypad 0
  static KEY_KP_1 { 321            } // Key: Keypad 1
  static KEY_KP_2 { 322            } // Key: Keypad 2
  static KEY_KP_3 { 323            } // Key: Keypad 3
  static KEY_KP_4 { 324            } // Key: Keypad 4
  static KEY_KP_5 { 325            } // Key: Keypad 5
  static KEY_KP_6 { 326            } // Key: Keypad 6
  static KEY_KP_7 { 327            } // Key: Keypad 7
  static KEY_KP_8 { 328            } // Key: Keypad 8
  static KEY_KP_9 { 329            } // Key: Keypad 9
  static KEY_KP_DECIMAL { 330      } // Key: Keypad .
  static KEY_KP_DIVIDE { 331       } // Key: Keypad /
  static KEY_KP_MULTIPLY { 332     } // Key: Keypad *
  static KEY_KP_SUBTRACT { 333     } // Key: Keypad -
  static KEY_KP_ADD { 334          } // Key: Keypad +
  static KEY_KP_ENTER { 335        } // Key: Keypad Enter
  static KEY_KP_EQUAL { 336        } // Key: Keypad =
  // Android key buttons
  static KEY_BACK { 4              } // Key: Android back button
  static KEY_MENU { 5              } // Key: Android menu button
  static KEY_VOLUME_UP { 24        } // Key: Android volume up button
  static KEY_VOLUME_DOWN { 25      } // Key: Android volume down button
}

