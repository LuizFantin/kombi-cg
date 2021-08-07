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

        /* Greenhouse */
        quad(width*0.05, roofHeight,
             width*0.95, roofHeight,
             width, greenhouseHeight+roofHeight,
             0, greenhouseHeight+roofHeight);

        /* Front */
        rect(0, greenhouseHeight+roofHeight, width, frontHeight);

        /* Chrome parts */
        fill(tertiaryColor);
        arc(0, carBottom, width, 2*frontHeight, PI+HALF_PI, 2*PI);
        arc(width, carBottom, width, 2*frontHeight, PI, PI+HALF_PI);

        /* Secondary paint */
        fill(secondaryColor);
        arc(0, carBottom, width-chromePartsWidth, 2*frontHeight-chromePartsWidth, PI+HALF_PI, 2*PI);
        arc(width, carBottom, width-chromePartsWidth, 2*frontHeight-chromePartsWidth, PI, PI+HALF_PI);
        popStyle();
    }

    private void drawLogo() {
        /* Logo attributes */
        float logoRadius = width*0.2;
        pushStyle();
        /* Logo */
        stroke(0);
        strokeWeight(chromePartsWidth/2);
        noFill();
        arc(centerX, centerY, logoRadius, logoRadius, PI, 2*PI, CHORD);
        fill(255);
        arc(centerX, centerY, logoRadius, logoRadius, 0, PI, CHORD);
        fill(tertiaryColor);
        ellipse(centerX, centerY, logoRadius*0.2, logoRadius*0.2);
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
        /* Bumper */
        fill(tertiaryColor);
        rect(-width*0.02, carBottom-bumperHeight, width*1.04, bumperHeight, 10);
        rect(width*0.25, carBottom-bumperHeight*1.5, bumperHeight/2, bumperHeight*2, 10);
        rect(width*0.75-bumperHeight/2, carBottom-bumperHeight*1.5, bumperHeight/2, bumperHeight*2, 10);
        
        /* License plate */     
        fill(255);
        rect(centerX-licensePlateWidth/2, carBottom*1.05-bumperHeight, licensePlateWidth, bumperHeight-carBottom*0.1);
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(bumperHeight*0.65);
        text(licensePlaceValue, centerX, carBottom-bumperHeight/2);
        popStyle();
    }

}