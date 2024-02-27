int[][] vulArray2D(int aantalRijen, int aantalKolommen, int vulWaarde) {
  int[][] array2D = new int[aantalRijen][aantalKolommen];
  
  for (int rijTeller = 0; rijTeller < aantalRijen; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < aantalKolommen; kolomTeller++) {
      array2D[rijTeller][kolomTeller] = vulWaarde;
    }
  }
  
  return array2D;
}

void toonArray2D(int[][] array2D) {
  int aantalRijen = array2D.length;
  int aantalKolommen = array2D[0].length;
  
  for (int rijTeller = 0; rijTeller < aantalRijen; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < aantalKolommen; kolomTeller++) {
      int waarde = array2D[rijTeller][kolomTeller];
      
      print(waarde);
      print("  ");
    }
    println();
  }
      println();

}
