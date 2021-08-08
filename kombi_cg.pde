Kombi kombi;
void setup() {
    size(1024, 1024);
    frameRate(30);
    background(255);
    kombi = new Kombi(50.0, 100.0, 900.0, 800.0);

    // noLoop();
}

void draw() {
    kombi.display();
}

void keyPressed() {
    kombi.processInput(key);
}