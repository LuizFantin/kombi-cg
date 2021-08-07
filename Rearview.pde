class Rearview {
    //Bottom right corner
    private float basePointX;
    private float basePointY;

    private float radius;

    private float rearviewPositionX;
    private float rearviewPositionY;

    private color primaryColor = color(20, 20, 20);
    private color secondaryColor = color(180, 180, 180);

    public Rearview(float baseX, float baseY, float rd, float width, float height) {
        basePointX = baseX;
        basePointY = baseY;
        radius = rd;

        rearviewPositionX = -width;
        rearviewPositionY = -height*0.05;
    }


    void display() {
        push();
        translate(basePointX, basePointY);
        drawRearview();
        pop();
    }

    private void drawRearview() {
        pushStyle();
        stroke(secondaryColor);
        strokeWeight(radius*0.2);
        fill(primaryColor);
        ellipse(rearviewPositionX, rearviewPositionY, radius, radius);
        line(0, 0, rearviewPositionX, rearviewPositionY);
        popStyle();
    }
}
