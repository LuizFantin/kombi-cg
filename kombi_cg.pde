import processing.sound.*;
Kombi kombi;
SoundFile engine;

void setup() {
    size(1024, 1024);
    frameRate(30);
    background(255);
    kombi = new Kombi(50.0, 100.0, 900.0, 800.0);
    engine = new SoundFile(this, "public/engine_sound.mp3");
    // noLoop();
}

void draw() {
    background(255);
    kombi.run();
}

void keyPressed() {
    kombi.processInput(key);
}