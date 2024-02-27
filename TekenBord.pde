int[][] maakBord(int aantalRijen, int aantalKolommen) {
  int[][] bord = vulArray2D(aantalRijen, aantalKolommen, 0);
  return bord;
}

void tekenBord(int[][] bord, int x, int y, int grootte, int[] objectKleuren) {
  int aantalRijen = bord.length;
  int aantalKolommen = bord[0].length;

  for (int rijTeller = 0; rijTeller < aantalRijen; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < aantalKolommen; kolomTeller++) {
      int waarde = bord[rijTeller][kolomTeller];

      int marge = grootte / 20;
      int zijde = grootte - 2 * marge;
      int blokX = x + (kolomTeller * grootte) + marge;
      int blokY = y + (rijTeller * grootte);
      int kleur;

      if (waarde < 0) {
        waarde *= -1;
        kleur = objectKleuren[waarde];
      } else {
        kleur = ONZICHTBAREBORD;
      }

      fill(kleur);
      rect(blokX, blokY, zijde, zijde);
    }
  }
}

int[][] verandereNullWaarde(int[][] bord, int soort) {
  int aantalRijen = bord.length;
  int aantalKolommen = bord[0].length;

  for (int rijTeller = 0; rijTeller < aantalRijen; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < aantalKolommen; kolomTeller++) {
      int waarde = bord[rijTeller][kolomTeller];

      if (waarde == 0) {
        bord[rijTeller][kolomTeller] = soort;
      }
    }
  }

  return bord;
}

int[][] plaatsMijnen(int[][] bord, int soort, int aantal) {
  boolean isPositieOK = false;

  for (int teller = 1; teller <= aantal; teller++) {
    do {
      int rij = floor(random(bord.length));
      int kolom = floor(random(bord[0].length));

      isPositieOK = (bord[rij][kolom] == 0);

      if (isPositieOK) {
        bord[rij][kolom] = soort;
      }
    } while (!isPositieOK);
  }

  return bord;
}

int[][] maakBoten(int[][] bord, int[] lengtesPerSoort, int aantal, int marge) {
  boolean isPositieOK = false;

  for (int teller = 1; teller <= aantal; teller++) {
    do {
      int rij = floor(random(bord.length));
      int kolom = floor(random(bord[0].length));

      int huidigeLengte = lengtesPerSoort[teller - 1];
      boolean horizontaal = random(1) < 0.5;
      isPositieOK = plaatsBoot(bord, rij, kolom, huidigeLengte, teller + 2, marge, horizontaal);

      if (isPositieOK) {
        for (int index = 0; index < huidigeLengte; index++) {
          if (horizontaal) {
            bord[rij][kolom + index] = teller + 2;
          } else {
            bord[rij + index][kolom] = teller + 2;
          }
        }
      }
    } while (!isPositieOK);
  }

  return bord;
}

boolean plaatsBoot(int[][] bord, int startRij, int startKolom, int lengte, int soort, int marge, boolean horizontaal) {
  boolean geldigePlaatsing = true;

  if (horizontaal) {
    if (startKolom + lengte - 1 >= bord[0].length) {
      geldigePlaatsing = false;
    }
  } else {
    if (startRij + lengte - 1 >= bord.length) {
      geldigePlaatsing = false;
    }
  }

  for (int index = 0; index < lengte && geldigePlaatsing; index++) {
    for (int rijOffset = -marge; rijOffset <= marge && geldigePlaatsing; rijOffset++) {
      for (int kolomOffset = -marge; kolomOffset <= marge && geldigePlaatsing; kolomOffset++) {
        int naburigeRij;
        int naburigeKolom;

        if (horizontaal) {
          naburigeRij = startRij + rijOffset;
          naburigeKolom = startKolom + index;
        } else {
          naburigeRij = startRij + index;
          naburigeKolom = startKolom + kolomOffset;
        }

        if (naburigeRij >= 0 && naburigeRij < bord.length && naburigeKolom >= 0 && naburigeKolom < bord[0].length) {
          int huidigeCel = bord[naburigeRij][naburigeKolom];
          if (huidigeCel != 0 && huidigeCel != soort) {
            geldigePlaatsing = false;
          }
        }
      }
    }
  }

  return geldigePlaatsing;
}



void tekenScorebord(int score, int x, int y) {
  fill(WIT);
  rect(x, y, 200, 50);

  fill(ZWART);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Score: " + score, x + 100, y + 25);
}

void tekenEindScorebord(int score, int x, int y) {
  fill(ZWART);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("SCORE ", x + 100, y + 25);
  fill(ROOD);
  text("Punten : " + score, x + 100, y + 50);
}
