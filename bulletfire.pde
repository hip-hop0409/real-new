// 총알 발사 함수
void fireBullet() {
  boolean bulletFired = false;  // 총알이 발사되었는지 여부를 확인하는 변수


  for (int i = 0; i < maxBullets && !bulletFired; i++) {
    if (!bulletsActive[i]) {//총알 활성화 체크
      bulletsX[i] = playerX;
      bulletsY[i] = playerY;
      
      // 발사 방향 계산
      float dirX = mouseX - playerX;
      float dirY = mouseY - playerY;
      float magnitude = sqrt(dirX * dirX + dirY * dirY);
      
      if (magnitude != 0) {
        bulletsDirX[i] = dirX / magnitude;
        bulletsDirY[i] = dirY / magnitude;
      } else {
        bulletsDirX[i] = 0;
        bulletsDirY[i] = 0;
      }
      
      bulletsActive[i] = true;
      bulletFired = true;  // 총알이 발사되었음을 표시
    }
  }
}
