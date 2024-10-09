// 총알 그리기 함수
void drawBullets() {
  for (int i = 0; i < maxBullets; i++) {
    if (bulletsActive[i]) {
      ellipse(bulletsX[i], bulletsY[i], 10, 10);
    }
  }
}
