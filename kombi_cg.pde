Kombi kombi;
void setup() {
    size(512, 512);
    frameRate(30);
    background(255);
    kombi = new Kombi(25.0, 50.0, 450.0, 400.0);

    // noLoop();
}

void draw() {
    background(255);
    kombi.display();
}

void keyPressed() {
    kombi.processInput(key);
}