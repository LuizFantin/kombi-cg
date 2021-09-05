class Kombi {
    // This position attributes refers to the upper left corner of kombi
    private float positionX;
    private float positionY;

    private float centerX;
    private float centerY;

    private float kombiWidth;
    private float kombiHeight;

    private BodyCar bodyCar;
    private SignalLight leftSignalLight;
    private SignalLight rightSignalLight;

    private Windshield leftWindshield;
    private Windshield rightWindshield;

    private Headlight leftHeadlight;
    private Headlight rightHeadlight;

    private Rearview leftRearview;
    private Rearview rightRearview;

    private ArrayList<Window> sideWindows;
    PShape leftWindow;
    PShape rightWindow;

    public Kombi(float posX, float posY, float w, float h) {
        positionX = posX;
        positionY = posY;
        kombiWidth  = w;
        kombiHeight = h;
        centerX = kombiWidth/2;
        centerY = kombiHeight/2;

        sideWindows = new ArrayList<Window>();

        initialize();
    }

    public void run() {
        push();
        translate(positionX, positionY);
        drawKombi();
        pop();
    }

    public void processInput(char k) {
        if(k == 'l' || k == 'L') {
            leftWindshield.toggleWiper();
            rightWindshield.toggleWiper();
        }

        if(k == 'r' || k == 'R') {
            rightRearview.toggleRearview();
            leftRearview.toggleRearview();
        }
        // Left signal light functionality
        if(k == '4' || ((k == CODED) && (keyCode == LEFT))){
            rightSignalLight.turnOff();
            if(leftSignalLight.getActiveStatus() && !leftSignalLight.isAlert())
                leftSignalLight.turnOff();
            else
                leftSignalLight.turnOn();
            leftSignalLight.setSignal();
            rightSignalLight.setSignal();
        }

        // Right signal light functionality
        if(k == '6' || ((k == CODED) && (keyCode == RIGHT))){
            leftSignalLight.turnOff();
            if(rightSignalLight.getActiveStatus() && !rightSignalLight.isAlert())
                rightSignalLight.turnOff();
            else
                rightSignalLight.turnOn();
            leftSignalLight.setSignal();
            rightSignalLight.setSignal();
        }

        // Alert functionality
        if(k == 'a' || k == 'A'){
            if(rightSignalLight.isAlert()){
                rightSignalLight.turnOff();
                leftSignalLight.turnOff();

                leftSignalLight.setSignal();
                rightSignalLight.setSignal();
            }
            else{
                rightSignalLight.turnOn();
                leftSignalLight.turnOn();

                leftSignalLight.setAlert();
                rightSignalLight.setAlert();
            }
        }
        if(k == 'f' || k == 'F'){
            rightHeadlight.changeMode();
            leftHeadlight.changeMode();
        }
    }

    private void initialize() {
        float bodyCarWidth = kombiWidth*0.7;
        float carLeftSide = kombiWidth*0.15;

        bodyCar = new BodyCar(carLeftSide, 0, bodyCarWidth, kombiHeight);

        float headlightRadius = kombiWidth*0.12;
        float headlightPosX = kombiWidth*0.005+carLeftSide;
        float headlightPosY = centerY*1.1;
        leftHeadlight  = new Headlight(headlightPosX, headlightPosY, headlightRadius);
        rightHeadlight = new Headlight(headlightPosX, headlightPosY, headlightRadius);

        float signalLightRadius = kombiWidth*0.06;
        float signalLightPosX = carLeftSide+kombiWidth*0.003;
        float signalLightPosY = centerY;
        leftSignalLight  = new SignalLight(signalLightPosX, signalLightPosY, signalLightRadius);
        rightSignalLight  = new SignalLight(signalLightPosX, signalLightPosY, signalLightRadius);

        float windowWidth = bodyCarWidth*0.35;
        float windowHeight = kombiHeight*0.25;
        float windowPosX = carLeftSide+kombiWidth*0.05; 
        float windowPosY = kombiHeight*0.075;
        leftWindshield = new Windshield(windowPosX, windowPosY, windowWidth, windowHeight, -120);
        rightWindshield = new Windshield(windowPosX, windowPosY, windowWidth, windowHeight, -60);

        float rearviewBaseX = carLeftSide;
        float rearviewBaseY = kombiHeight*0.35;
        float rearviewRadius = kombiWidth*0.07;
        float rearviewWidth = kombiWidth*0.1;

        leftRearview = new Rearview(rearviewBaseX, rearviewBaseY, rearviewRadius, rearviewWidth, kombiHeight);
        rightRearview = new Rearview(rearviewBaseX, rearviewBaseY, rearviewRadius, rearviewWidth, kombiHeight);


        float length = -500;
        float sideWindowPosX = carLeftSide;
        float sideWindowPosY = windowPosY;
        float sideWindowPosZ =  length*0.3;
        float distanceBetweenSideWindows = length*0.02;
        float sideWindowWidth = length*0.125;
        float sideWindowHeight = windowHeight;
        for(int i = 0; i < 4; ++i) {
            Window w = new Window(
                sideWindowPosX,
                sideWindowPosY,
                sideWindowPosZ+i*(sideWindowWidth+distanceBetweenSideWindows),
                sideWindowWidth,
                sideWindowHeight,
                Window.LEFT_WINDOW,
                bodyCarWidth
            );
            sideWindows.add(w);
        }
        for(int i = 0; i < 4; ++i) {
            Window w = new Window(
                sideWindowPosX+bodyCarWidth,
                sideWindowPosY,
                sideWindowPosZ+i*(sideWindowWidth+distanceBetweenSideWindows),
                sideWindowWidth,
                sideWindowHeight,
                Window.RIGHT_WINDOW,
                bodyCarWidth
            );
            sideWindows.add(w);
        }

        createWindow(carLeftSide, windowPosY, length*0.08, windowWidth*0.8, windowHeight, bodyCarWidth);
    }

    private void drawKombi() {
        bodyCar.display();
        leftHeadlight.display();
        leftSignalLight.display();
        leftWindshield.display();
        leftRearview.display();
        shape(leftWindow);
        shape(rightWindow);
        for(Window sideWindow : sideWindows) {
            sideWindow.drawWindow();
        }
        mirror();
        rightRearview.display();
        rightWindshield.display();
        rightSignalLight.display();
        rightHeadlight.display();
    }

    private void mirror() {
        translate(centerX, centerY);
        scale(-1, 1);
        translate(-centerX, -centerY);
    }

    private void createWindow(float baseX, float baseY, float baseZ, float width, float height, float carWidth) {
        color windowColor = color(180, 180, 255);
        leftWindow = createShape();
        leftWindow.beginShape();
        leftWindow.fill(windowColor);
        leftWindow.vertex(baseX+carWidth*0.045, baseY, baseZ);
        leftWindow.vertex(baseX+carWidth*0.045, baseY, baseZ-width);
        leftWindow.vertex(baseX, baseY+height, baseZ-width);
        leftWindow.vertex(baseX, baseY+height, baseZ+0.15*width);
        leftWindow.endShape(CLOSE);
        
        rightWindow = createShape();
        rightWindow.beginShape();
        rightWindow.fill(windowColor);
        rightWindow.vertex(baseX+carWidth*0.955, baseY, baseZ);
        rightWindow.vertex(baseX+carWidth*0.955, baseY, baseZ-width);
        rightWindow.vertex(baseX+carWidth, baseY+height, baseZ-width);
        rightWindow.vertex(baseX+carWidth, baseY+height, baseZ+0.13*width);
        rightWindow.endShape(CLOSE);
        
    }

}