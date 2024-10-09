// 최대 적과 총알의 수 설정
int maxEnemies = 20;
int maxBullets = 15;

// 적의 위치 배열
float[] enemiesX = new float[maxEnemies];
float[] enemiesY = new float[maxEnemies];
float[] enemiesDirX = new float[maxEnemies];
float[] enemiesDirY = new float[maxEnemies];
boolean[] enemiesActive = new boolean[maxEnemies];

// 총알의 위치과 방향 배열
float[] bulletsX = new float[maxBullets];
float[] bulletsY = new float[maxBullets];
float[] bulletsDirX = new float[maxBullets];
float[] bulletsDirY = new float[maxBullets];
boolean[] bulletsActive = new boolean[maxBullets];

// 플레이어의 위치
float playerX, playerY;

// 게임 변수
int health = 100;
boolean gameOver = false;
int startTime;
int gameOverTime;

// 적 생성 타이밍
float spawnTime = 1000; // 초기 적 생성 시간 (밀리초)
float lastSpawnTime = 0;

// 총알 속도
float bulletSpeed = 5;

// 적 속도
float enemySpeed = 2;


void setup() {
  size(800, 800);
  playerX = width / 2;
  playerY = height / 2;
  lastSpawnTime = millis();
  startTime = millis();
  
}


void draw() {
  background(0);
  
  if (!gameOver) {
    // 현재 시간
    int currentTime = millis();
    
    // 적 생성
    if (currentTime - lastSpawnTime > spawnTime) {
      spawnEnemy();
      lastSpawnTime = currentTime;
      spawnTime = random(500, 1500); // 다음 적 생성 시간 랜덤 설정
    }
    
    // 적 이동 및 그리기
    moveEnemies();
    drawEnemies();
    
    
    // 총알 이동 및 그리기
    moveBullets();
    drawBullets();

    
    // 플레이어 그리기
    fill(255);
    ellipse(playerX, playerY, 20, 20);
    
    // 체력 표시
    fill(255);
    textSize(20);
    textAlign(LEFT, TOP);
    text("Health: " + health, 10, 10);
    
    // 충돌 체크
    checkCollisions();
    
    // 스페이스바를 눌렀을 때 발사
    if (keyPressed && key == ' ') {
      fireBullet(); // fireBullet 함수는 총알을 발사하는 코드
    }
    
  } else {
    // 게임 오버 화면
    fill(255, 0, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 2 - 30);
    
    // 생존 시간 계산 및 표시
    int survivalTime = (gameOverTime - startTime) / 1000;
    textSize(30);
    text("Survived: " + survivalTime + " seconds", width / 2, height / 2 + 30);
  }
}
