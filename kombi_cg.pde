Kombi kombi;

void setup() {
    size(512, 512, P3D);
    frameRate(30);
    background(255);
    kombi = new Kombi(50.0, 100.0, 450.0, 400.0);

}

void draw() {
    float mouseXNorm = map(mouseX, 0, width, -width/2, width/2);
    float mouseYNorm = map(mouseY, 0, height, -height/2, height/2);
    background(255);
    lights();
    camera(5*mouseXNorm, 3*mouseYNorm, 500, width/2, height/2, 0, 0, 1, 0);
    kombi.run();

}

void keyPressed() {
    kombi.processInput(key);
}