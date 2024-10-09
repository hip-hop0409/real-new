// 총알 이동 함수
void moveBullets() {
  fill(0, 255, 0);
  for (int i = 0; i < maxBullets; i++) {
    if (bulletsActive[i]) {
      bulletsX[i] += bulletsDirX[i] * bulletSpeed;
      bulletsY[i] += bulletsDirY[i] * bulletSpeed;
      
      // 총알이 화면 밖으로 나가면 비활성화
      if (bulletsX[i] < 0 || bulletsX[i] > width || bulletsY[i] < 0 || bulletsY[i] > height) {
        bulletsActive[i] = false;
      }
    }
  }
}
