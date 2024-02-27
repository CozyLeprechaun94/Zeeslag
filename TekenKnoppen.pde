final int X = 0;
final int Y = 1;
final int BREEDTE = 2;
final int HOOGTE = 3;

final int KLEUR_KNOP = 4;
final int KLEUR_LABEL = 5;
final int TEKST_GROOTTE = 6;
final int KLEUR_HIGHLIGHT = 7;
final int KLEUR_HUIDIG = 8;
final int GEEN_KNOP = -1;

int geselecteerdeKnop = -1;

void tekenKnop(int[] knopConfig, String label) {
  int x = knopConfig[0];
  int y = knopConfig[1];
  int breedte = knopConfig[2];
  int hoogte = knopConfig[3];
  int kleurLabel = knopConfig[5];
  int tekstGrootte = knopConfig[6];
  int kleurHighLight = knopConfig[7];
  int huidigeKleur = knopConfig[8];

  boolean gekliktOpKnop = isMuisBovenKnop(knopConfig, mouseX, mouseY);

  if (gekliktOpKnop) {
    fill(kleurHighLight);
  } else {
    fill(huidigeKleur);
  }
  rect(x, y, breedte, hoogte);

  fill(kleurLabel);
  textSize(tekstGrootte);
  textAlign(CENTER, CENTER);
  text(label, x + (breedte / 2), y + (hoogte / 2));
}

void tekenKnoppen(int[][] knoppen, String[] labels) {
  int aantalKnoppen = knoppen.length;

  for (int knopTeller = 0; knopTeller < aantalKnoppen; knopTeller++) {
    String label = labels[knopTeller];
    int[] knopConfig = knoppen[knopTeller];

    if (knopTeller == geselecteerdeKnop) {
      knopConfig[KLEUR_HUIDIG] = knopConfig[KLEUR_HIGHLIGHT];
    } else {
      knopConfig[KLEUR_HUIDIG] = knopConfig[KLEUR_KNOP];
    }

    tekenKnop(knopConfig, label);
  }
}
