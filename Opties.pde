boolean isMuisBovenKnop(int[] knop, int muisX, int muisY) {
  int knopX = knop[0];
  int knopY = knop[1];
  int knopBreedte = knop[2];
  int knopHoogte = knop[3];

  boolean geldigeX = (muisX >= knopX) && (muisX <= knopX + knopBreedte);
  boolean geldigeY = (muisY >= knopY) && (muisY <= knopY + knopHoogte);

  return geldigeX && geldigeY;
}

int bepaalIndexIngedrukteKnop(int[][] knoppen, int muisX, int muisY) {
  int resultaat = -1;
  for (int knopTeller = 0; knopTeller < knoppen.length; knopTeller++) {
    int[] knop = knoppen[knopTeller];
    if (isMuisBovenKnop(knop, muisX, muisY)) {
      resultaat = knopTeller;
    }
  }
  return resultaat;
}

boolean zijnAlleBotenGevonden() {
  boolean alleBotenGevonden = true;

  for (int index = 0; index < bord.length; index++) {
    for (int vakjes = 0; vakjes < bord[index].length; vakjes++) {
      if (bord[index][vakjes] > 2 && bord[index][vakjes] < 7) {
        alleBotenGevonden = false;
      }
    }
  }
  return alleBotenGevonden;
}
