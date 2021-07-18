Kombi kombi;
void setup() {
    size(512, 512);
    background(255);
    kombi = new Kombi(50.0, 50.0, 375.0, 400.0);

    noLoop();
}

void draw() {
    kombi.display();
}
