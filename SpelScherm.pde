int[][] spelSchermKnoppen = {
  {0, 850, 100, 50, ROOD, WIT, 30, #00FFF0, 0}
};

String[] spelSchermLabels = {"Exit"};

int[][] bord = new int[10][10];
int score = 0;
int[] lengtesPerSoort = {1, 2, 3, 4};

int bordBeginX = 400;
int bordBeginY = 255;
int celGrootte = 50;
int bordGrootte = 10;
void tekenSpelScherm() {

  int[] kleuren = {WIT, WATER, ZEEMIJN, BOOT1, BOOT2, BOOT3, BOOT4};

  tekenBord(bord, bordBeginX, bordBeginY, celGrootte, kleuren);
  tekenScorebord(score, 10, 10);

  tekenKnoppen(spelSchermKnoppen, spelSchermLabels);
}

void verwerkMuisKlikSpelScherm() {
  int muisX = mouseX;
  int muisY = mouseY;
  boolean resultaat = muisX > bordBeginX && muisX < bordBeginX + celGrootte * bordGrootte && muisY > bordBeginY && muisY < bordBeginY + celGrootte * bordGrootte;
  int resultaat2 = bepaalIndexIngedrukteKnop(spelSchermKnoppen, muisX, muisY);

  if (resultaat2 == 0) {
    exit();
  } else if (!resultaat) {
    println("op niks dedrukt");
  } else {
    int rij = floor((muisY - bordBeginY) / celGrootte);
    int kolom = floor((muisX - bordBeginX) / celGrootte);

    println(rij, kolom, bord[rij][kolom]);

    if (bord[rij][kolom] == 2) {
      score--;
      bord[rij][kolom] *= -1;
      println("Mijn geraakt!");
    } else if (bord[rij][kolom] == 3) {
      score+= 4;
      bord[rij][kolom] *= -1;
      println("Boot van lengte 1 geraakt!");
    } else if (bord[rij][kolom] == 4) {
      score+= 3;
      bord[rij][kolom] *= -1;
      println("Boot van lengte 2 geraakt!");
    } else if (bord[rij][kolom] == 5) {
      score+= 2;
      bord[rij][kolom] *= -1;
      println("Boot van lengte 3 geraakt!");
    } else if (bord[rij][kolom] == 6) {
      score+= 1;
      bord[rij][kolom] *= -1;
      println("Boot van lengte 4 geraakt!");
    } else if (bord[rij][kolom] == 1) {
      bord[rij][kolom] *= -1;
      println("Water geraakt!");
    }
  }
  if (zijnAlleBotenGevonden()) {
    spelToestand = EIND_SCHERM;
  }
}
