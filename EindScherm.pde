int[][] eindSchermKnoppen = {
  {550, 450, 210, 50, #FF0390, #FFFFFF, 30, 0, 0},
  {0, 850, 100, 50, ROOD, WIT, 30, #00FFF0, 0}
};

String[] eindSchermLabels = { "Opnieuw Spelen", "Exit" };

void tekenEindScherm() {
  
  tekenEindScorebord(score, 550, 340);
  tekenKnoppen(eindSchermKnoppen, eindSchermLabels);
}

void verwerkMuisKlikEindScherm() {
  int resultaat = bepaalIndexIngedrukteKnop(eindSchermKnoppen, mouseX, mouseY);
  if (resultaat == 0) {
    spelToestand = START_SCHERM;
  } else if (resultaat == 1) {
    exit();
  }
}
