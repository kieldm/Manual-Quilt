float sinEngine(int aCount, float aLength, float Speed, float slopeN) {
  float sinus = sin(frameCount*Speed + aCount*aLength);
  float sign = (sinus >= 0 ? 1: -1);
  float sinerSquare = sign * (1-pow(1-abs(sinus),slopeN));
  return sinerSquare;
}

float sinEngine2(int aCount, float aLength, int bCount, float bLength, float Speed, float slopeN) {
  float sinus = sin(frameCount*Speed + aCount*aLength + bCount*bLength);
  float sign = (sinus >= 0 ? 1: -1);
  float sinerSquare = sign * (1-pow(1-abs(sinus),slopeN));
  return sinerSquare;
}
