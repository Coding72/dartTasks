
  // Erstelle zwei Funktionen:
void printGrades(List<int> grades) {
  // Gibt alle Noten nacheinander aus
  // z.B.: Note 1: 2, Note 2: 1, Note 3: 3
  String text = "";
  for (int i=0; i<grades.length; i++){
    text+="Note ${i+1}: ${grades[i]}"; 
    if (i<grades.length-1) { text+=", "; }
  }  
  print(text);

}

void calculateAndPrintAverage(List<int> grades) {
  // Berechnet den Durchschnitt und gibt aus:
  // "Der Durchschnitt ist: 2.0"
  int sum = 0;
  for (int grade in grades){ sum+=grade; }
  print("Der Durchschnitt ist: ${(sum/grades.length).roundToDouble()}");
}

// Hauptfunktion:
void analyzeGrades(List<int> grades) {
  // Ruft beide Funktionen nacheinander auf
  printGrades(grades);
  calculateAndPrintAverage(grades);
}


void main() {
  List<int> grades = [2,3,1,2,4,2]; 
  analyzeGrades(grades);
}


