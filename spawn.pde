void spawnEnemy() {
  int safeDistance = 100; // 플레이어와 적 사이의 최소 거리
  boolean enemySpawned = false; // 적이 생성되었는지 여부

  for (int i = 0; i < maxEnemies && !enemySpawned; i++) {
    if (!enemiesActive[i]) {
      float enemyX = random(width);
      float enemyY = random(height);
      float distanceToPlayer = dist(enemyX, enemyY, playerX, playerY);

      // 적이 플레이어로부터 일정 거리 이상 떨어져 있을 때만 생성
      if (distanceToPlayer > safeDistance) {
        enemiesX[i] = enemyX;
        enemiesY[i] = enemyY;

        // 플레이어를 향한 방향 계산
        float dirX = playerX - enemiesX[i];
        float dirY = playerY - enemiesY[i];
        float magnitude = sqrt(dirX * dirX + dirY * dirY);

        if (magnitude != 0) {
          enemiesDirX[i] = dirX / magnitude;
          enemiesDirY[i] = dirY / magnitude;
        } else {
          enemiesDirX[i] = 0;
          enemiesDirY[i] = 0;
        }

        enemiesActive[i] = true; // 적 활성화
        enemySpawned = true; // 적이 성공적으로 생성됨
      }
    }
  }
}
