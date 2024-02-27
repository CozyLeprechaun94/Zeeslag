final int GRIJS = #CECECE;
final int BOOT1 = #00FF00;
final int BOOT2 = #FC03EC;
final int BOOT3 = #00F2FC;
final int BOOT4 = #FEFF00;
final int WATER = #0000FF;
final int WIT = #FFFFFF;
final int ZEEMIJN = #FF0000;
final int ONZICHTBAREBORD = #FF8000;
final int ROOD = #FF0000;
final int ZWART = #000000;

final int START_SCHERM = 0;
final int SPEL_SCHERM = 1;
final int EIND_SCHERM  = 2;
int spelToestand = START_SCHERM;
boolean tekenOpnieuw = true;

int schermBreedte = 1200;
int schermHoogte = 900;

PImage photo;

void settings() {
  size(schermBreedte, schermHoogte);
}

void setup() {
  tekenStartScherm();
}

void draw() {
  if (tekenOpnieuw) {
    background(GRIJS);
    
    if (spelToestand == START_SCHERM) {
      tekenStartScherm();
    } else if (spelToestand == SPEL_SCHERM) {
      tekenSpelScherm();
    } else if (spelToestand == EIND_SCHERM) {
      tekenEindScherm();
    }
    
    tekenOpnieuw = false;
  }
}


void mousePressed() {
  switch (spelToestand) {
  case START_SCHERM:
    verwerkMuisKlikStartScherm();
    break;
    case SPEL_SCHERM:
     verwerkMuisKlikSpelScherm();
     break;
  case EIND_SCHERM:
    verwerkMuisKlikEindScherm();
    break;
  default:
    break;
  }
  tekenOpnieuw = true;
}
