// 충돌 체크 함수
void checkCollisions() {
  for (int i = 0; i < maxEnemies; i++) {
    if (enemiesActive[i]) {
      // 플레이어와 적의 거리 계산
      float distanceToPlayer = sqrt((playerX - enemiesX[i]) * (playerX - enemiesX[i]) + (playerY - enemiesY[i]) * (playerY - enemiesY[i]));
      
      // 플레이어와 적이 충돌한 경우
      if (distanceToPlayer < 20) {
        // 체력 감소 (10 ~ 25 랜덤)
        health -= (int)random(10, 26);
        
        // 적 비활성화
        enemiesActive[i] = false;
        
        // 체력이 0 이하인 경우 게임 오버
        if (health <= 0) {
          gameOver = true;
          gameOverTime = millis();
        }
      }
      
      // 총알과 적의 충돌 체크
      for (int j = 0; j < maxBullets; j++) {
        if (bulletsActive[j]) {
          float distanceToBullet = sqrt((bulletsX[j] - enemiesX[i]) * (bulletsX[j] - enemiesX[i]) + (bulletsY[j] - enemiesY[i]) * (bulletsY[j] - enemiesY[i]));
          
          // 총알과 적이 충돌한 경우
          if (distanceToBullet < 15) {
            // 적과 총알 비활성화
            enemiesActive[i] = false;
            bulletsActive[j] = false;
          }
        }
      }
    }
  }
}
