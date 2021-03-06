class Windshield {
    //Upper left corner
    private float positionX;
    private float positionY;

    private float windowWidth;
    private float windowHeight;
    private PShape window;

    private color windowColor = color(180, 180, 255, 255);
    private color wiperColor = color(0,0,0);

    private float wiperAngle;
    private float defaultAngle;
    private float wiperVelocity = 3;

    private boolean isWiperOn = false;

    public Windshield(float posX, float posY, float width, float height, float deg) {
        positionX = posX;
        positionY = posY;
        windowWidth = width;
        windowHeight = height;

        wiperAngle = deg;
        defaultAngle = deg;
        window = createWindow();
    }

    public void display() {
        push();
        translate(positionX, positionY, 1);
        drawWindow();
        rotateWiper();
        drawWiper();
        pop();      
    }

    public void toggleWiper() {
        isWiperOn = !isWiperOn;
    }
    
    private void drawWindow() {
        pushStyle();
        fill(windowColor);
        strokeWeight(3);
        /* Left windshield window  */
        pushMatrix();
        translate(0, 0, 1);
        shape(window);
        popMatrix();
        popStyle();
    }
    
    private void rotateWiper() {
        if(isWiperOn || wiperAngle != defaultAngle) {
            if(wiperAngle > -60 || wiperAngle < -120)
                wiperVelocity *=-1;
            wiperAngle += wiperVelocity;
        }
    }


    private void drawWiper() {
        float wiperLength = windowWidth*0.7;
        float wiperWidth = 7;

        push();
        /* Left windshield wiper */
        translate(0.1*positionX+windowWidth/2, windowHeight);
        stroke(wiperColor);
        strokeWeight(wiperWidth);
        rotate(radians(wiperAngle));
        line(0, 0, wiperLength, 0);
        pop();
    }


    PShape createWindow() {
        float length = -500;
        PShape window = createShape();
        window.beginShape(QUAD_STRIP);
        window.fill(windowColor);
        
        window.vertex(0.2*positionX, 0, length*0.05);
        window.vertex(0, windowHeight, 0);

        window.vertex(0.2*positionX+windowWidth, 0, length*0.05);
        window.vertex(0.2*positionX+windowWidth, windowHeight, 0);

        window.endShape();
        return window;
    }
}
