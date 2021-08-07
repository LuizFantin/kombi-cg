class SignalLight {
    //Upper left corner
    private float positionX;
    private float positionY;
    private float radius;
    
    private color primaryColor = color(#FFBC40);
    private color secondaryColor = color(#D1D1D1);
    
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

    void drawSignalLight() {
        fill(secondaryColor);
        ellipse(radius, radius, radius*1.2, radius*1.2);
        fill(primaryColor);
        ellipse(radius, radius, radius, radius);
    }
}
