int xP;
int spd = 1;
int xD = 1;
int scr = 0;
int lvs = 5;
boolean lost = false;
import processing.sound.*;
SoundFile file;
void setup() {
    size(400, 400);
    file = new SoundFile(this, "kriminality.mp3"); 
    file.play(); 
    smooth();
    xP = width / 2;
    fill(87, 160, 211);
    textSize(13);
}

void draw() {
    PImage img = loadImage ("FbSxYYgyNpw.jpg"); 
    image (img , 0,0, 400,400); 
    //background(0, 150, 120);
    ellipse(xP, height / 2, 45, 45);
    xP = xP + (spd * xD);
    if (xP > width - 20 || xP < 20) {
        xD = -xD;
    }
    text("score = " + scr, 10, 10);
    text("lives = " + lvs, width - 80, 10);
    if (lvs <= 0) {
        textSize(20);
        text("Click to Restart", 125, 100);
        noLoop();
        lost = true;
        textSize(13);
    } // 
}

void mousePressed() {
    if (dist(mouseX, mouseY, xP, 200) <= 20) {
        scr = scr + spd;
        spd = spd + 3;
    } else {
        if (spd < 1) {
            spd = spd - 1;
        }
        lvs = lvs - 1;
    }
    while (lost) {
        if (lost == true) {
            spd = 1;
            lvs = 3;
            scr = 0;
            xP = width / 2;
            xD = 1;
            lost = false;
            loop();
        }
    }
}