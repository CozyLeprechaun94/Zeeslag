final int STARTSPEL = 0;
final int EXITSPEL = 1;
final int ROOSTER10X10 = 2;
final int ROOSTER15X15 = 3;
final int ROOSTER20X20  = 4;

int roosterSelecteren = ROOSTER10X10;

int[][] startSchermKnoppen = {
  {580, 500, 100, 50, #00FF00, #FFFFFF, 30, 0, 0},
  {0, 850, 100, 50, #FF0000, #FFFFFF, 30, 0, 0},
  {460, 350, 100, 50, #FF0095, #FFFFFF, 30, #00FFF0, 0},
  {580, 350, 100, 50, #FF0095, #FFFFFF, 30, #00FFF0, 0},
  {700, 350, 100, 50, #FF0095, #FFFFFF, 30, #00FFF0, 0}
};


String[] startSchermLabels = {"Start", "Exit", "10x10", "15x15", "20x20"};

void tekenStartScherm() {

  photo = loadImage("zeeslag.png");
  image(photo, 0, 0);

  fill(ZWART);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("Rooster Selecteren", schermBreedte / 2 + 20, 320);

  tekenKnoppen(startSchermKnoppen, startSchermLabels);
}

void verwerkMuisKlikStartScherm() {
  int resultaat = bepaalIndexIngedrukteKnop(startSchermKnoppen, mouseX, mouseY);

  switch (resultaat) {
  case STARTSPEL:
    spelToestand = SPEL_SCHERM;
    break;
  case EXITSPEL:
    exit();
    break;
  case ROOSTER10X10:
    roosterSelecteren = ROOSTER10X10;
    bord = maakBord(10, 10);
    
    bordBeginX = 400;
    bordBeginY = 255;
    celGrootte = 50;
    bordGrootte = 10;
    
    bord = plaatsMijnen(bord, 2, 10);
    bord = maakBoten(bord, lengtesPerSoort, 4, 2);
    bord = maakBoten(bord, lengtesPerSoort, 3, 3);
    bord = maakBoten(bord, lengtesPerSoort, 2, 4);
    bord = maakBoten(bord, lengtesPerSoort, 1, 1);
    bord = verandereNullWaarde(bord, 1);

    toonArray2D(bord);
    break;
  case ROOSTER15X15:
    roosterSelecteren = ROOSTER15X15;
    bord = maakBord(15, 15);
    
    bordBeginX = 300;
    bordBeginY = 170;
    celGrootte = 40;
    bordGrootte = 15;
    
    bord = plaatsMijnen(bord, 2, 22);
    bord = maakBoten(bord, lengtesPerSoort, 4, 2);
    bord = maakBoten(bord, lengtesPerSoort, 3, 3);
    bord = maakBoten(bord, lengtesPerSoort, 2, 4);
    bord = maakBoten(bord, lengtesPerSoort, 1, 1);
    bord = verandereNullWaarde(bord, 1);

    toonArray2D(bord);
    break;
  case ROOSTER20X20:
    roosterSelecteren = ROOSTER20X20;
    bord = maakBord(20, 20);
    
    bordBeginX = 300;
    bordBeginY = 185;
    celGrootte = 30;
    bordGrootte = 20;
    
    bord = plaatsMijnen(bord, 2, 40);
    int[] lengtesPerSoort = {1, 2, 3, 4};
    bord = maakBoten(bord, lengtesPerSoort, 4, 2);
    bord = maakBoten(bord, lengtesPerSoort, 3, 3);
    bord = maakBoten(bord, lengtesPerSoort, 2, 4);
    bord = maakBoten(bord, lengtesPerSoort, 1, 1);
    bord = verandereNullWaarde(bord, 1);

    toonArray2D(bord);
    break;
  default:
    break;
  }
}
