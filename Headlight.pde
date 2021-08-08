class Headlight {
    //Upper left corner
    private float positionX;
    private float positionY;
    private float radius;

    private color primaryColor = color(#DCDCDC);
    private color secondaryColor = color(#D1D1D1);

    private color activeColor = color(#ffffff);

    private boolean isActive = false;

    public Headlight(float posX, float posY, float rd) {
        positionX = posX;
        positionY = posY;
        radius = rd;
    }

    public void display() {
        push();
        translate(positionX, positionY);
        drawHeadlight();
        pop();
    }

    void changeMode(){
        isActive = !isActive;
    }

    public void drawHeadlight() {
        fill(secondaryColor);
        ellipse(radius, radius, radius*1.1, radius*1.1);
        if(isActive)
            fill(activeColor);
        else
            fill(primaryColor);
        ellipse(radius, radius, radius, radius);
    }

}