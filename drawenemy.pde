// 적 그리기 함수
void drawEnemies() {
  for (int i = 0; i < maxEnemies; i++) {
    if (enemiesActive[i]) {
      ellipse(enemiesX[i], enemiesY[i], 30, 30);
    }
  }
}
