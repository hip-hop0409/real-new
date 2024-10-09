// 적 이동 함수
void moveEnemies() {
  fill(255, 0, 0);
  for (int i = 0; i < maxEnemies; i++) {
    if (enemiesActive[i]) {
      enemiesX[i] += enemiesDirX[i] * enemySpeed;
      enemiesY[i] += enemiesDirY[i] * enemySpeed;
      
      // 적이 화면 밖으로 나가지 않도록 처리
      if (enemiesX[i] < 0 || enemiesX[i] > width || enemiesY[i] < 0 || enemiesY[i] > height) {
        enemiesActive[i] = false;
      }
    }
  }
}
