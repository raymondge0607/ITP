# Final Project Documentation
- This project is an audio visualizer, specifically a graphical EQ. Utilizing processing and Java, the user and add an mp3 file to the data folder, and when called in the code, a canvas will appear and provide a real-time visualization of the audio frequency bands and will allow the user to interact with playback and visualization settings with keyboard inputs. I chose to create an audio visualizer because as a producer and beat-maker, sharing music through social media merely through screen recordings can get a bit dull and monotonous. I wanted to create a unique visual experience to add to whatever audio I want to engage the audience. I’ve seen many examples of this “visualization” being executed before by many beat-makers I see on social media so I decided to try to code my own visualizer and replicate.

- I started off by doing some research on audio analysis, specifically in processing since we've used it over this course and I am familiar with it. I was reading up on the "Minim" library offered in processing in Java and viewed a few public examples that utilized it on "stackoverflow" and "github". These examples gave me a place to start when it came to importing the libraries and the different functions audio analysis.
- To start, the audio file I want to be played is added into the data folder in the processing project folder and I call it in the code using a string (ex: String audioFileName = "assumptions.mp3";). I next created the setup code and it looks like this:

    void setup() {
      size(500, 400);
      noCursor();
      minim = new Minim(this);
      track = minim.loadFile(audioFileName, 2048);
      input = minim.getLineIn();
      fft = new FFT(track.bufferSize(), track.sampleRate());
      println(fft);
      track.loop();
    }

- This initializes the track, buffersize, sample rate, and the fft audio analysis all utilizing the Minim library.
- I next wanted to call the draw function for the canvas and I tweaked it so that I looked like a musical EQ, starting from the bottom and having the frequency bands bounce upwards. This is what it looks like:

    void draw() {
      background(0);
      stroke(255);
      fft.forward(track.mix);
      float lineStartY = height;

      for (int i = 0; i < fft.specSize(); i++) {
        float x = map(i, 0, fft.specSize(), 0, width);
        float lineEndY = height - fft.getBand(i) * 1.5;
        line(x, lineStartY, x, lineEndY);
      }
    }

- I then wanted to add a feature so that the original colors of the band (blue) would turn orange the stronger in volume the frequency band is using color interpolation and transition ratios. I added these lines of code:

    float transitionRatio = 0.1; //ratio determines how quickly bands turn orange in reaction
    float interpolationFactor = map(bandHeightRatio, 0, transitionRatio, 0, 1); //calculates ratio of height of band to the height of the canvas
    color bandColor = lerpColor(currentColorScheme[0], currentColorScheme[1], interpolationFactor); //interpolates between colors

- So after the halfway point review, there were a few things I wanted to add. First, I wanted to somehow integrate my processing file and the visualization into a website utilizing html. From that point onwards, I wanted to add some features including pause/play, a playback slider, and volume controls. Most importantly, I wanted to add a feature for the user to be able to upload their own mp3 file to be visualized using the code in processing. I did some research regarding how to integrate processing code into html and unfortunately what I found was that I can't just simply copy and paste my processing code into html. Since the code in processing is utilizing Java, it can't be executed in a web page. To use processing in a webpage you need to use the javascript implementation of the language, otherwise known as "p5.js". I was also hit with the unfortunate fact that I had to translate my java code into javascript as well. In the end, I decided that it was a lot of work to do all the research to understand how to integrate my processing visualizer into an html website so I decided to scrap the idea and just focus on the aesthetics of the visualizer and some functionalities mentioned earlier solely in processing.
- Deciding to focus on features solely in processing, I wanted to first start off by adding pause/play functionality by the user pressing the space bar. This was fairly simple. I added a boolean variable isPaused to keep track of whether the audio is currently paused or playing and in the draw() function, I added a condition to only update the FFT analysis if the audio is not paused. Finally, I added a keyPressed() function that toggles between pausing and playing the audio when the space bar is pressed. I tried the same process to add a feature to go back and forth 5 seconds by pressing the left and right arrow keys respectively by integrating it into an else if statement within the keyPressed() function. However, the rewind() function in processing does not take a specific duration but rather restarts the track. Thus, I removed the rewind() method calls and replaced them with custom functions rewindTrack() and fastForwardTrack(). These functions calculate the new position in milliseconds based on the current position of the track and the specified duration to rewind/fast forward. For fun, I decided to add a feature where you can cycle through a few color themes of the band by pressing the key "c". Additionally, I wanted to have the option to view the strongest frequency. To explain, whichever frequency band is the strongest, the number (in Hz) of the band will appear as a label and the label will follow that frequency. I wanted to add the option to be able to toggle it on and off as well by pressing the key "f". Last but not least I added a restart track (press "r" key) function that works similarly to the rewind +/- 5 seconds function.
- Here are some sources I used for inspiration and research
  - https://www.generativehut.com/post/using-processing-for-music-visualization
  - https://olearyfrances.com/visualizing-sound-with-processing
  - https://stackoverflow.com/questions/70519472/music-visualizer-using-processing
  - https://code.compartmental.net/minim/index.html (Minim Library)
  - https://stackoverflow.com/questions/45202108/how-to-pause-play-a-sketch-in-processing-with-the-same-button
  - https://minimeters.app/ (inspiration)
