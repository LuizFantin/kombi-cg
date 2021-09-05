class BodyCar {
    private float positionX;
    private float positionY;

    private float centerX;
    private float centerY;

    private float width;
    private float height;

    private float roofHeight;
    private float greenhouseHeight;
    private float frontHeight;
    private float chromePartsWidth;

    private float carBottom;

    private color primaryColor = color(255, 0, 0);
    private color secondaryColor = color(20);
    private color tertiaryColor = color(180, 180, 180);

    private String licensePlaceValue = "ABC-1234";
    
    public BodyCar(float posX, float posY, float w, float h) {
        positionX = posX;
        positionY = posY;
        width = w;
        height = h;

        centerX = width/2;
        centerY = height/2;

        roofHeight = height*0.05;
        greenhouseHeight = height*0.3;
        frontHeight = height*0.5;
        chromePartsWidth = width*0.05;
        carBottom = roofHeight+greenhouseHeight+frontHeight;
    }

    public void display() {
        push();
        translate(positionX, positionY);
        drawBody();
        drawLogo();
        drawWheels();
        drawBumper();
        pop();
    }

    private void drawBody() {
        pushStyle();
        fill(primaryColor);

        /* Roof */
        arc(centerX, roofHeight, width*0.9, 2*roofHeight, PI, 2*PI);

        float length = -500;
        /* Greenhouse */
        pushMatrix();
        beginShape();
        rotX(0, greenhouseHeight+roofHeight, 0, PI/6);
        vertex(width*0.05, roofHeight, 0);
        vertex(width*0.95, roofHeight, 0);
        vertex(width, greenhouseHeight+roofHeight, 0);
        vertex(0, greenhouseHeight+roofHeight, 0);
        endShape(CLOSE);
        popMatrix();
        
        /* Front */
        rect(0, greenhouseHeight+roofHeight, width, frontHeight);
        beginShape(QUAD_STRIP);
        vertex(width, greenhouseHeight+roofHeight, 0);
        vertex(width, greenhouseHeight+roofHeight+frontHeight, 0);
        vertex(width, greenhouseHeight+roofHeight, length);
        vertex(width, greenhouseHeight+roofHeight+frontHeight, length);
        vertex(0, greenhouseHeight+roofHeight, length);
        vertex(0, greenhouseHeight+roofHeight+frontHeight, length);
        vertex(0, greenhouseHeight+roofHeight, length);
        vertex(0, greenhouseHeight+roofHeight+frontHeight, length);
        vertex(0, greenhouseHeight+roofHeight, 0);
        vertex(0, greenhouseHeight+roofHeight+frontHeight, 0);
        endShape();

        pushMatrix();
        /* Chrome parts */
        translate(0, 0, 1);
        fill(tertiaryColor);
        arc(0, carBottom, width, 2*frontHeight, PI+HALF_PI, 2*PI);
        arc(width, carBottom, width, 2*frontHeight, PI, PI+HALF_PI);

        /* Secondary paint */
        translate(0, 0, 1);
        fill(secondaryColor);
        arc(0, carBottom, width-chromePartsWidth, 2*frontHeight-chromePartsWidth, PI+HALF_PI, 2*PI);
        arc(width, carBottom, width-chromePartsWidth, 2*frontHeight-chromePartsWidth, PI, PI+HALF_PI);
        popMatrix();
        popStyle();
    }

    private void drawLogo() {
        /* Logo attributes */
        float logoRadius = width*0.2;
        pushStyle();
        /* Logo */
        pushMatrix();
        translate(0, 0, 1);
        stroke(0);
        strokeWeight(chromePartsWidth/2);
        noFill();
        arc(centerX, centerY, logoRadius, logoRadius, PI, 2*PI, CHORD);
        fill(255);
        arc(centerX, centerY, logoRadius, logoRadius, 0, PI, CHORD);
        fill(tertiaryColor);
        ellipse(centerX, centerY, logoRadius*0.2, logoRadius*0.2);
        popMatrix();
        popStyle();
    }

    private void drawWheels() {
        /* Wheels attributes */
        float wheelWidth = width*0.1;
        float wheelHeight = height-carBottom;

        pushStyle();
        fill(0);
        rect(width*0.05, carBottom, wheelWidth, wheelHeight,0, 0, 20, 20);
        rect(width*0.85, carBottom, wheelWidth, wheelHeight,0, 0, 20, 20);
        popStyle();
    }

    private void drawBumper() {
        /* bumper attributes */
        float bumperHeight = height*0.05;
        float licensePlateWidth = width*0.25;

        pushStyle();
        pushMatrix();
        /* Bumper */
        translate(0, 0, 3);   
        fill(tertiaryColor);
        rect(-width*0.02, carBottom-bumperHeight, width*1.04, bumperHeight, 10);
        translate(0, 0, 1);   
        rect(width*0.25, carBottom-bumperHeight*1.5, bumperHeight/2, bumperHeight*2, 10);
        rect(width*0.75-bumperHeight/2, carBottom-bumperHeight*1.5, bumperHeight/2, bumperHeight*2, 10);
        
        /* License plate */  
        fill(255);
        rect(centerX-licensePlateWidth/2, carBottom*1.05-bumperHeight, licensePlateWidth, bumperHeight-carBottom*0.1);
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(bumperHeight*0.65);
        translate(0, 0, 1);   
        text(licensePlaceValue, centerX, carBottom-bumperHeight/2);
        popMatrix();
        popStyle();
    }

    void rotX(float baseX, float baseY, float baseZ, float rad) {
        translate(baseX, baseY, baseZ);
        rotateX(rad);
        translate(-baseX, -baseY, -baseZ);
    }
    void rotY(float baseX, float baseY, float baseZ, float rad) {
        translate(baseX, baseY, baseZ);
        rotateY(rad);
        translate(-baseX, -baseY, -baseZ);
    }
    void rotZ(float baseX, float baseY, float baseZ, float rad) {
        translate(baseX, baseY, baseZ);
        rotateZ(rad);
        translate(-baseX, -baseY, -baseZ);
    }

}