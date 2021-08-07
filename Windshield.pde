class Windshield {
    //Upper left corner
    private float positionX;
    private float positionY;

    private float windowWidth;
    private float windowHeight;

    private color windowColor = color(180, 180, 255, 255);
    private color wiperColor = color(0,0,0);

    private float wiperAngle;

    public Windshield(float posX, float posY, float width, float height, float rad) {
        positionX = posX;
        positionY = posY;
        windowWidth = width;
        windowHeight = height;

        wiperAngle = rad;
    }

    public void display() {
        push();
        translate(positionX, positionY);
        drawWindow();
        drawWiper();
        pop();      
    }
    
    private void drawWindow() {
        pushStyle();
        fill(windowColor);
        strokeWeight(3);
        /* Left windshield window  */
        quad(
            0.2*positionX, 0,
            0.2*positionX+windowWidth, 0,
            0.2*positionX+windowWidth, windowHeight,
            0, windowHeight 
        );
        popStyle();
    }
    
    private void drawWiper() {
        float wiperLength = windowWidth*0.7;
        float wiperWidth = 7;

        push();
        /* Left windshield wiper */
        translate(0.1*positionX+windowWidth/2, windowHeight);
        stroke(wiperColor);
        strokeWeight(wiperWidth);
        rotate(wiperAngle);
        line(0, 0, wiperLength, 0);
        pop();
    }
}
