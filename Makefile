WAVRES := $(wildcard res/*.wav)
WAV16 := $(WAVRES: %.wav=%16k16b.wav)
TEXT = $(WAVRES:%.wav=%.text)

all : $(TEXT) 

%.text: %16k16b.wav
	./src/asr_single $< $@

%16k16b.wav: %.wav
	sox -v 0.99 $< -c 1 -e signed -b 16 -r 16000 $@


