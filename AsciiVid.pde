import processing.video.*;

final String[] DENSITY_LIST= new String[]{
  "Ñ@#W$9876543210?!abc;:+=-,._ ", // 0
  "Ñ@#W$9876543210?!abc;:+=-,._                 ", // 1
  "@#O%+=|i-:.        ", // 2
  "@#Oo*°. ", // 3
  "MN@#$o;:,. ", // 4
};

// --------------[INDSTILLINER]--------------

// VALUES: 0, 1, 2, 3, 4.
final int DENSITY_INDEX = 2;
// Video settings
final String VIDEO_FILE_NAME = "operator.MOV";
final String OUTPUT_FOLDER = "out";
final int VIDEO_X_RESOLUTION = 1920;
final int VIDEO_Y_RESOLUTION = 1080;
final int RECORDING_FPS = 20;

final boolean IS_FLIPPED = false;

// VALUES 0 to 255. Brug google's color picker
final int TEXT_COLOR_R = 0;
final int TEXT_COLOR_G = 255;
final int TEXT_COLOR_B = 0;

final boolean INVERT_COLORS = false;
final int SCALE = 10;

boolean recording = true;

// ------------[INDSTILLINER SLUT]------------

final String DENSITY = DENSITY_LIST[DENSITY_INDEX];
final int len = DENSITY.length() - 1;

Movie clip;

void settings() {
  size(VIDEO_X_RESOLUTION, VIDEO_Y_RESOLUTION);
}

void setup() {
  clip = new Movie(this, VIDEO_FILE_NAME);
  clip.play();
  clip.volume(0);
  clip.read();

  clip.frameRate(RECORDING_FPS);

  PFont mono = createFont("Courier", SCALE + 2, true);
  textFont(mono);

  noStroke();
  fill(TEXT_COLOR_R, TEXT_COLOR_G, TEXT_COLOR_B);
}

void draw() {
  println(frameRate);

  background(0);
  clip.loadPixels();

  PImage frame = clip;
  if (IS_FLIPPED) {
    frame = getFlippedFrame(frame);
  }

  for (int y = 0; y < frame.height; y += SCALE) {
    for (int x = 0; x < frame.width; x += SCALE) {
      final color pixel = frame.get(x, y);
      final float brightness = brightness(pixel);

      final int charIndex = getCharIndex(brightness);

      char c = DENSITY.charAt(charIndex);

      text(c, x, y);
    }
  }

  saveFrame("output/" + OUTPUT_FOLDER + "/frame-#####.png");
}

int getCharIndex(float b) {
  if (INVERT_COLORS) {
    return floor(map(b, 0, 255, 0, len));
  }
  return floor(map(b, 0, 255, len, 0));
}

void movieEvent(Movie m) {
  m.read();
}

PImage getFlippedFrame(PImage frame) {
  PImage reverse = new PImage( frame.width, frame.height );
  for ( int i=0; i < frame.width; i++ ) {
    for (int j=0; j < frame.height; j++) {
      reverse.set( i, frame.height - 1 - j, frame.get(i, j) );
    }
  }
  return reverse;
}
