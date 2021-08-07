Kombi kombi;
void setup() {
    size(512, 512);
    background(255);
    kombi = new Kombi(25.0, 50.0, 450.0, 400.0);

    noLoop();
}

void draw() {
    kombi.display();
}
