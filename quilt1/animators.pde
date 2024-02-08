float sinEngine(int aCount, float aLength, float Speed, float slopeN) {
  float sinus = sin(frameCount*Speed/10 + aCount*aLength);
  float sign = (sinus >= 0 ? 1: -1);
  float sinerSquare = sign * (1-pow(1-abs(sinus),slopeN));
  return sinerSquare;
}
