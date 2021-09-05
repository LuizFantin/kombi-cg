class BodyCar {
    private float positionX;
    private float positionY;

    private float centerX;
    private float centerY;

    private float width;
    private float height;
    private float length = -500;

    private float roofHeight;
    private float greenhouseHeight;
    private float frontHeight;
    private float chromePartsWidth;

    private float carBottom;

    private color primaryColor = color(255, 0, 0);
    private color secondaryColor = color(20);
    private color tertiaryColor = color(180, 180, 180);

    private String licensePlaceValue = "ABC-1234";

    private PShape greenhouse;
    private PShape greenhouseDetails;
    private PShape roof;
    
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
        greenhouse = createGreenhouse();
        greenhouseDetails = createGreehouseDetails();
        roof = createRoof();
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
        pushMatrix();
        translate(centerX, roofHeight, length*0.05);
        shape(roof);
        popMatrix();

        /* Greenhouse */
        pushMatrix();
        shape(greenhouse);
        popMatrix();

        /* Greenhouse Details */
        pushMatrix();
        shape(greenhouseDetails);
        popMatrix();

        /* Front */
        rect(0, greenhouseHeight+roofHeight, width, frontHeight);
        pushMatrix();
        translate(centerX, greenhouseHeight+roofHeight+frontHeight/2, length/2);
        box(width, frontHeight, length);
        popMatrix();

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
        float wheelWidth = width*0.15;

        // Wheels
        pushStyle();
        
        fill(0);
        pushMatrix();
        rotY(-width*0.01, carBottom, length*0.2, PI/2);
        cylinder(width*0.01, carBottom, length*0.2, wheelWidth, wheelWidth);
        popMatrix();
        pushMatrix();
        rotY(width*0.86, carBottom, length*0.2, PI/2);
        cylinder(width*0.85, carBottom, length*0.2, wheelWidth, wheelWidth);
        popMatrix();
        pushMatrix();
        rotY(-width*0.01, carBottom, length*0.9, PI/2);
        cylinder(width*0.01, carBottom, length*0.9, wheelWidth, wheelWidth);
        popMatrix();
        pushMatrix();
        rotY(width*0.86, carBottom, length*0.9, PI/2);
        cylinder(width*0.85, carBottom, length*0.9, wheelWidth, wheelWidth);
        popMatrix();
        
        popStyle();


        // Hubcaps
        pushStyle();
        
        fill(tertiaryColor);
        pushMatrix();
        rotY(-width*0.02, carBottom, length*0.2, PI/2);
        cylinder(width*0.01, carBottom, length*0.2, wheelWidth*0.6, wheelWidth*0.01);
        popMatrix();
        pushMatrix();
        rotY(width*1.01, carBottom, length*0.2, PI/2);
        cylinder(width*1.01, carBottom, length*0.2, wheelWidth*0.6, wheelWidth*0.01);
        popMatrix();
        pushMatrix();
        rotY(-width*0.02, carBottom, length*0.9, PI/2);
        cylinder(width*0.01, carBottom, length*0.9, wheelWidth*0.6, wheelWidth*0.01);
        popMatrix();
        pushMatrix();
        rotY(width*1.01, carBottom, length*0.9, PI/2);
        cylinder(width*1.01, carBottom, length*0.9, wheelWidth*0.6, wheelWidth*0.01);
        popMatrix();
        
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

    PShape createGreenhouse() {
        PShape greenhouse = createShape();
        greenhouse.beginShape(QUAD_STRIP);
        greenhouse.fill(primaryColor);
        greenhouse.vertex(0, greenhouseHeight+roofHeight, 0);
        greenhouse.vertex(width*0.05, roofHeight, length*0.05);

        greenhouse.vertex(width, greenhouseHeight+roofHeight, 0);
        greenhouse.vertex(width*0.95, roofHeight, length*0.05);

        greenhouse.vertex(width, greenhouseHeight+roofHeight, length);
        greenhouse.vertex(width*0.95, roofHeight, length*0.95);

        greenhouse.vertex(0, greenhouseHeight+roofHeight, length);
        greenhouse.vertex(width*0.05, roofHeight, length*0.95);

        greenhouse.vertex(0, greenhouseHeight+roofHeight, 0);
        greenhouse.vertex(width*0.05, roofHeight, length*0.05);
        greenhouse.endShape();
        return greenhouse;
    }

    PShape createGreehouseDetails() {
        PShape details = createShape();
        details.beginShape(QUAD_STRIP);
        details.fill(secondaryColor);
        details.vertex(0, greenhouseHeight+roofHeight, 0);
        details.vertex(width*0.4, roofHeight, length*0.06);

        details.vertex(width, greenhouseHeight+roofHeight, 0);
        details.vertex(width*0.96, roofHeight, length*0.06);

        details.vertex(width, greenhouseHeight+roofHeight, length);
        details.vertex(width*0.96, roofHeight, length*0.96);

        details.vertex(0, greenhouseHeight+roofHeight, length);
        details.vertex(width*0.04, roofHeight, length*0.96);

        details.vertex(0, greenhouseHeight+roofHeight, 0);
        details.vertex(width*0.04, roofHeight, length*0.06);
        details.endShape();
        return details;
    }

    PShape createRoof() {
        float angleIncrement = PI/16;
        PShape roof = createShape(GROUP);
        PShape top = createShape();
        PShape front = createShape();
        PShape back = createShape();

        top.beginShape(QUAD_STRIP);
        top.fill(primaryColor);
        for(int dPhi = 16; dPhi <= round(2*PI/angleIncrement); ++dPhi) {
            top.vertex((0.9*width/2)*cos(dPhi*angleIncrement), roofHeight*sin(dPhi*angleIncrement), 0);
            top.vertex((0.9*width/2)*cos(dPhi*angleIncrement), roofHeight*sin(dPhi*angleIncrement), length*0.9);
        }   
        top.endShape();

        front.beginShape();
        front.fill(primaryColor);
        for(int dPhi = 16; dPhi <= round(2*PI/angleIncrement); ++dPhi) {
            front.vertex((0.9*width/2)*cos(dPhi*angleIncrement), roofHeight*sin(dPhi*angleIncrement), 0);
        }   
        front.endShape(CLOSE);

        back.beginShape();
        back.fill(primaryColor);
        for(int dPhi = 16; dPhi <= round(2*PI/angleIncrement); ++dPhi) {
            back.vertex((0.9*width/2)*cos(dPhi*angleIncrement), roofHeight*sin(dPhi*angleIncrement), length*0.9);
        }   
        back.endShape(CLOSE);

        roof.addChild(top);
        roof.addChild(front);
        roof.addChild(back);
        return roof;
    }

    private void cylinder(float x, float y, float z, float radius, float height) {
        float angleIncrement = PI/16;
        translate(x, y, z);
        beginShape(QUAD_STRIP);
        for(int dPhi = 0; dPhi <= round(2*PI/angleIncrement); ++dPhi) {
            vertex(radius*cos(dPhi*angleIncrement), radius*sin(dPhi*angleIncrement), 0);
            vertex(radius*cos(dPhi*angleIncrement), radius*sin(dPhi*angleIncrement), height);
        }   
        endShape();
        beginShape();
        for(int dPhi = 0; dPhi <= round(2*PI/angleIncrement); ++dPhi) {
            vertex(radius*cos(dPhi*angleIncrement), radius*sin(dPhi*angleIncrement), 0);
        }   
        endShape(CLOSE);
        beginShape();
        for(int dPhi = 0; dPhi <= round(2*PI/angleIncrement); ++dPhi) {
            vertex(radius*cos(dPhi*angleIncrement), radius*sin(dPhi*angleIncrement), height);
        }   
        endShape(CLOSE);
        translate(-x, -y, -z);
    }
}