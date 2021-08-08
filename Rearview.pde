class Rearview {
    //Bottom right corner
    private float basePointX;
    private float basePointY;

    private float radius;

    private float rearviewPositionX;
    private float rearviewPositionY;

    private color primaryColor = color(20, 20, 20);
    private color secondaryColor = color(180, 180, 180);

    private boolean isRetracted = false;

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
        if(isRetracted)
            drawRetractedRearview();
        else
            drawRearview();
        pop();
    }

    void toggleRearview() {
        isRetracted = !isRetracted;
    }

    private void drawRetractedRearview() {
        pushStyle();
        stroke(secondaryColor);
        strokeWeight(radius*0.1);
        fill(primaryColor);
        arc(rearviewPositionX/8, rearviewPositionY-radius/4, radius/2, radius, PI/2, 3*PI/2, CHORD);
        strokeWeight(radius*0.2);
        line(0, 0, rearviewPositionX/8-radius/4, rearviewPositionY-radius/4);
        popStyle();
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
