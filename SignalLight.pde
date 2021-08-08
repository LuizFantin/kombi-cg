class SignalLight {
    //Upper left corner
    private float positionX;
    private float positionY;
    private float radius;
    
    private color primaryColor = color(#FFBC40);
    private color secondaryColor = color(#D1D1D1);

    private color activeColor = color(#f88500);
    private color lightColor = color(255, 200, 80, 30);

    private boolean isActive = false;
    private boolean isAlert = false;
    
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

    void setAlert(){
        isAlert = true;
    }

    void setSignal(){
        isAlert = false;
    }

    void turnOff() {
        isActive = false;
    }

    void turnOn() {
        isActive = true;
    }

    boolean getActiveStatus(){
        return isActive;
    }

    boolean isAlert(){
        return isAlert;
    }

    void drawSignalLight() {
        fill(secondaryColor);
        ellipse(radius, radius, radius*1.2, radius*1.2);
        if(second() % 2 == 0 && isActive) {
            noStroke();
            fill(lightColor);
            ellipse(radius*0.8, radius*0.76, 4*radius, 4*radius);
            fill(activeColor);
        }
        else
            fill(primaryColor);
        ellipse(radius, radius, radius, radius);
    }
}
