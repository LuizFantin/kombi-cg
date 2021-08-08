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

    private boolean isEngineOn = false;

    public Kombi(float posX, float posY, float w, float h) {
        positionX = posX;
        positionY = posY;
        kombiWidth  = w;
        kombiHeight = h;
        centerX = kombiWidth/2;
        centerY = kombiHeight/2;

        initialize();
    }

    public void run() {
        startStopEngine();
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
            leftRearview.toggleRearview();
            rightRearview.toggleRearview();
        }
        if(k == 'm' || k == 'M') {
            toggleEngine();
        }
    }

    public void toggleEngine() {
        isEngineOn = !isEngineOn;
    }

    private void startStopEngine() {
        if(isEngineOn) {
            if(!engine.isPlaying()) {
                engine.play();
            }
        }
        else 
            engine.stop();
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
    }

    private void drawKombi() {
        bodyCar.display();

        leftHeadlight.display();
        leftSignalLight.display();
        leftWindshield.display();
        leftRearview.display();
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
}