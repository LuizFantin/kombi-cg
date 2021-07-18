class Kombi {
    // This position attributes refers to the upper left corner of kombi
    private float positionX;
    private float positionY;

    private float centerX;
    private float centerY;
    private float kombiWidth;
    private float kombiHeight;

    private color primaryColor = color(255, 0, 0);
    private color secondaryColor = color(20);
    private color tertiaryColor = color(180, 180, 180);

    Kombi(float posX, float posY, float w, float h) {
        positionX = posX;
        positionY = posY;
        kombiWidth  = w;
        kombiHeight = h;
        centerX = kombiWidth/2;
        centerY = kombiHeight/2;
    }

    void display() {
        //This way, we can use (0, 0) as our referential point while drawing the kombi
        pushMatrix();
        translate(positionX, positionY);
        create();
        translate(-positionX, -positionY);
        popMatrix();
        
    }

    //TODO: We need a better name for this method
    void create() {
        float roofHeight = kombiHeight*0.1;
        float greenhouseHeight = kombiHeight*0.4;
        float frontHeight = kombiHeight - greenhouseHeight;
        float trimWidth = kombiWidth*0.05;
        float bumperHeight = kombiHeight*0.05;
        float licensePlateWidth = kombiWidth*0.25;

        /* Headlight Atributes */
        float headlightRadius = kombiWidth*0.15;
        color headlightColor = color(#DCDCDC);
        color headlightExternalColor = color(#D1D1D1);
        
        /* Signal light Atributes */
        float signalLightRadius = kombiWidth*0.08;
        color signalLightColor = color(#ffbc40);
        color signalLightExternalColor = color(#D1D1D1);


        /*  The top of kombi is 10%(5% in each side) narrow than the bottom
            and the car greenhouse has 40% of kombi's kombiHeight
        */
        /* Kombi's roof and greenhouse */
        fill(primaryColor);
        arc(centerX, roofHeight, kombiWidth*0.9, roofHeight, PI, 2*PI);
        quad(kombiWidth*0.05, roofHeight, kombiWidth*0.95, roofHeight, kombiWidth, greenhouseHeight, 0, greenhouseHeight);
        rect(0, greenhouseHeight, kombiWidth, frontHeight);

        
        /* Trim accessories (frisos) */
        fill(tertiaryColor);
        arc(0, kombiHeight, kombiWidth, 2*frontHeight, PI+HALF_PI, 2*PI);
        arc(kombiWidth, kombiHeight, kombiWidth, 2*frontHeight, PI, PI+HALF_PI);

        /* Secondary car paint */
        fill(secondaryColor);
        arc(0, kombiHeight, kombiWidth-trimWidth, 2*frontHeight-trimWidth, PI+HALF_PI, 2*PI);
        arc(kombiWidth, kombiHeight, kombiWidth-trimWidth, 2*frontHeight-trimWidth, PI, PI+HALF_PI);

        /* Bumper */
        fill(tertiaryColor);
        rect(-kombiWidth*0.02, kombiHeight-bumperHeight, kombiWidth*1.04, bumperHeight, 10);
        rect(kombiWidth*0.25, kombiHeight-bumperHeight*1.5, bumperHeight/2, bumperHeight*2, 10);
        rect(kombiWidth*0.75-bumperHeight/2, kombiHeight-bumperHeight*1.5, bumperHeight/2, bumperHeight*2, 10);

        /* License plate */   
        /* TODO: Rework */    
        fill(255);
        rect(centerX-licensePlateWidth/2, kombiHeight-bumperHeight+kombiHeight*0.005, licensePlateWidth, bumperHeight-kombiHeight*0.01);
        fill(0);
        textAlign(CENTER);
        textSize(bumperHeight*0.8);
        text("ABC-1234", centerX, kombiHeight-bumperHeight/4);

        /* Left car headlight */
        fill(headlightExternalColor);
        ellipse(kombiWidth*0.005+headlightRadius, centerY*1.3, headlightRadius*1.1, headlightRadius*1.1);
        fill(headlightColor);
        ellipse(kombiWidth*0.005+headlightRadius, centerY*1.3, headlightRadius, headlightRadius);

        /* Right car headlight */
        fill(headlightExternalColor);
        ellipse(kombiWidth*0.995-headlightRadius, centerY*1.3, headlightRadius*1.1, headlightRadius*1.1);
        fill(headlightColor);
        ellipse(kombiWidth*0.995-headlightRadius, centerY*1.3, headlightRadius, headlightRadius);

        /* Left signal light */
        fill(signalLightExternalColor);
        ellipse(kombiWidth*0.003+signalLightRadius, centerY*1.1, signalLightRadius*1.2, signalLightRadius*1.2);
        fill(signalLightColor);
        ellipse(kombiWidth*0.003+signalLightRadius, centerY*1.1, signalLightRadius, signalLightRadius);

        /* Right signal light */
        fill(signalLightExternalColor);
        ellipse(kombiWidth*0.997-signalLightRadius, centerY*1.1, signalLightRadius*1.2, signalLightRadius*1.2);
        fill(signalLightColor);
        ellipse(kombiWidth*0.997-signalLightRadius, centerY*1.1, signalLightRadius, signalLightRadius);

        
    }
}