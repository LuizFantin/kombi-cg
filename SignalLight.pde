class SignalLight {
    //Upper left corner
    private float positionX;
    private float positionY;
    private float radius;
    
    private color primaryColor = color(#FFBC40);
    private color secondaryColor = color(#D1D1D1);

    private color activeColor = color(#FF6400);

    private boolean isActive = false;
    
    public SignalLight(float posX, float posY, float rd) {
        positionX = posX;
        positionY = posY;
        radius = rd;
    }

    void display() {
        push();
        translate(positionX, positionY);
        drawSignalLight();
        pop();
    }

    void changeMode() {
        isActive = !isActive;
    }

    void turnOff() {
        isActive = false;
    }

    void drawSignalLight() {
        fill(secondaryColor);
        ellipse(radius, radius, radius*1.2, radius*1.2);
        if(second() % 2 == 0 && isActive)
            fill(activeColor);
        else
            fill(primaryColor);
        ellipse(radius, radius, radius, radius);
    }
}