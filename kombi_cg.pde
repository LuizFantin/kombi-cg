import processing.sound.*;
Kombi kombi;
SoundFile engine;

void setup() {
    size(1024, 1024);
    frameRate(30);
    background(255);
    kombi = new Kombi(25.0, 50.0, 450.0, 400.0);
    engine = new SoundFile(this, "engine_sound.mp3");
    // noLoop();
}

void draw() {
    background(255);
    kombi.run();
}

void keyPressed() {
    kombi.processInput(key);
}