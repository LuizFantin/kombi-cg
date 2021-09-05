class Window {
    /* The position refer to the upper left corner of the window */
    private float positionX;
    private float positionY;
    private float positionZ;

    private float width;
    private float height;

    private PShape window;
    private color windowColor = color(180, 180, 255);

    static final int LEFT_WINDOW = 1000;
    static final int RIGHT_WINDOW = 1001;

    private float side;
    private float carWidth;

    Window(float posX, float posY, float posZ, float w, float h, int s, float carW) {
        positionX = posX;
        positionY = posY;
        positionZ = posZ;

        width = w;
        height = h;

        side = s;
        carWidth = carW;
        createWindow();
    }

    void drawWindow() {
        push();
        translate(positionX, positionY, positionZ);
        shape(window);
        pop();
    }

    private void createWindow() {
        float pos = carWidth*0.045;
        if(side == RIGHT_WINDOW) {
            translate(1, 0, 0);
            pos*=-1;
        }
        else if(side == LEFT_WINDOW) {
            translate(-1, 0, 0);
        }
        window = createShape();
        window.beginShape();
        window.fill(windowColor);
        window.vertex(pos, 0, 0);
        window.vertex(pos, 0, width);
        window.vertex(0, height, width);
        window.vertex(0, height, 0);
        window.endShape(CLOSE);
    }

}