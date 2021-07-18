Kombi kombi;
void setup() {
    size(1000, 1000);
    background(255);
    kombi = new Kombi(150.0, 50.0, 700.0, 800.0);

    noLoop();
}

void draw() {
    kombi.display();
}
