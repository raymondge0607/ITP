import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer track;
FFT fft;
boolean isPaused = false;
boolean showFrequencyLabel = true;
int colorSchemeIndex = 0;

String audioFileName = "assumptions.mp3";
float[] smoothedValues;
float smoothingFactor = 0.3;

color[][] colorSchemes = {
  {color(0, 0, 255), color(255, 165, 0)},    
  {color(255, 0, 0), color(0, 255, 0)},       
  {color(128, 0, 128), color(255, 255, 0)},  
  {color(0, 128, 128), color(0, 0, 128)},    
  {color(255, 192, 203), color(0, 255, 0)}    
};


void setup() {
  size(1200, 800);
  noCursor();
  frameRate(60);
  minim = new Minim(this);
  track = minim.loadFile(audioFileName, 2048);
  fft = new FFT(track.bufferSize(), track.sampleRate());
  println(fft);
  track.loop();
  
  smoothedValues = new float[fft.specSize()];
  for (int i = 0; i < fft.specSize(); i++) {
    smoothedValues[i] = 1;
  }
}

void draw() {
  background(0);
  
  if (!isPaused) { 
    fft.forward(track.mix); 
  }
  
  float maxAmplitude = 0;
  int maxAmplitudeIndex = 0;
  
  for (int i = 0; i < fft.specSize(); i++) { //smoothing process iterates over each frequency band
    smoothedValues[i] = lerp(smoothedValues[i], fft.getBand(i), smoothingFactor);
    
    if (smoothedValues[i] > maxAmplitude) {
      maxAmplitude = smoothedValues[i];
      maxAmplitudeIndex = i;
    }
  }
  
  color[] currentColorScheme = colorSchemes[colorSchemeIndex]; 
  
  strokeWeight(2.5); //thickness of each frequency band on the canvas
  
  for (int i = 0; i < fft.specSize(); i++) { 
    float x = map(log(i + 1), 0, log(fft.specSize()), 0, width);
    float lineStartY = height;
    float lineEndY = height - smoothedValues[i] * 2;
    float transitionRatio = 0.1; //ratio determines how quickly bands turn orange in reaction
    float bandHeightRatio = smoothedValues[i] / height;
    float interpolationFactor = map(bandHeightRatio, 0, transitionRatio, 0, 1); //calculates ratio of height of band to the height of the canvas
    color bandColor = lerpColor(currentColorScheme[0], currentColorScheme[1], interpolationFactor); //interpolates between colors
   
    stroke(bandColor);
    
    line(x, lineStartY, x, lineEndY); //frequency bands
  }
  
  // Display the strongest frequency label if showFrequencyLabel is true
  if (showFrequencyLabel) {
    float strongestFrequency = maxAmplitudeIndex * fft.getBandWidth();
    String label = nf(strongestFrequency, 0, 1) + " Hz"; // Format the frequency as a label
    
    fill(255);
    textAlign(CENTER);
    textSize(18);
    float labelX = map(log(maxAmplitudeIndex + 1), 0, log(fft.specSize()), 0, width); // Calculate x-coordinate of the label
    float labelY = height - 10; // Position the label at the bottom
    text(label, labelX, labelY); // Display the label
  }
}

void keyPressed() {
  if (key == ' ') {
    if (isPaused) {
      track.play();
    } else {
      track.pause();
    }
    isPaused = !isPaused;
  } else if (keyCode == LEFT) {
    rewindTrack(5000);
  } else if (keyCode == RIGHT) {
    fastForwardTrack(5000); 
  } else if (key == 'c' || key == 'C') {
    cycleColorScheme(); 
  } else if (key == 'f' || key == 'F') {
    showFrequencyLabel = !showFrequencyLabel;
  } else if (key == 'r' || key == 'R') {
    restartTrack();
  }
}

void rewindTrack(int milliseconds) {
  int newPosition = track.position() - milliseconds;
  if (newPosition < 0) {
    newPosition = 0;
  }
  track.cue(newPosition);
}

void restartTrack() {
  track.rewind();
  if (!isPaused) {
    track.play();
  }
}

void fastForwardTrack(int milliseconds) {
  int newPosition = track.position() + milliseconds;
  int trackDuration = track.length();
  if (newPosition > trackDuration) {
    newPosition = trackDuration; 
  }
  track.cue(newPosition);
}

void cycleColorScheme() {
  colorSchemeIndex = (colorSchemeIndex + 1) % colorSchemes.length; 
}
