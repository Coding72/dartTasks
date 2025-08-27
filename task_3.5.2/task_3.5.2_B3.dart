import "dart:math";

enum numberAttributes {min, max, posmax, posmin, negativ, positiv, gerade, ungerade}

// Implementiere folgende Funktionen:
void findAndPrintExtreme(List<int> numbers) {
  // Findet und gibt kleinste und größte Zahl aus
  // Zeigt auch deren Position in der Liste  
  Map<numberAttributes, int> mNumberAttributes = <numberAttributes, int>{ numberAttributes.min:0, numberAttributes.max:0 };
  List<int> posMin = [];
  List<int> posMax = [];
    
  for (int number in numbers){
    if (number > mNumberAttributes[numberAttributes.max]!){mNumberAttributes[numberAttributes.max]=number;}
  }

  mNumberAttributes[numberAttributes.min] = mNumberAttributes[numberAttributes.max]!;
  for (int number in numbers){
    if (number < mNumberAttributes[numberAttributes.min]!){mNumberAttributes[numberAttributes.min]=number;}
  }

  // Positionen und Multiple Max/Min finden
  for (int i=0; i<numbers.length; i++) {
    if (numbers[i] == mNumberAttributes[numberAttributes.min]!){posMin.add(i);}
    if (numbers[i] == mNumberAttributes[numberAttributes.max]!){posMax.add(i);}
  }

  print("Kleinste Zahl: ${mNumberAttributes[numberAttributes.min]} - Position(en): ${posMin}");
  print("Größte Zahl: ${mNumberAttributes[numberAttributes.max]} - Position(en): ${posMax}");
}

void printNumberTypes(List<int> numbers) {
  // Zählt und gibt aus:
  // - Wie viele gerade/ungerade Zahlen
  // - Wie viele positive/negative Zahlen
  Map<numberAttributes, int> mNumberAttributes = <numberAttributes, int>{ numberAttributes.gerade:0, numberAttributes.ungerade:0, numberAttributes.positiv:0, numberAttributes.negativ:0 };

  for (int number in numbers){
    if ((number % 2) == 0) { mNumberAttributes[numberAttributes.gerade] = mNumberAttributes[numberAttributes.gerade]! +1; } 
    else {
       mNumberAttributes[numberAttributes.ungerade] = mNumberAttributes[numberAttributes.ungerade]! +1;
    }
    if (number > 0 ) { mNumberAttributes[numberAttributes.positiv] = mNumberAttributes[numberAttributes.positiv]! +1; } 
    else {
       mNumberAttributes[numberAttributes.negativ] = mNumberAttributes[numberAttributes.negativ]! +1;
    }
  }
  
  print("Anzahl gerader Zahlen: ${mNumberAttributes[numberAttributes.gerade]} ");
  print("Anzahl ungerader Zahlen: ${mNumberAttributes[numberAttributes.ungerade]}");
  print("Anzahl positiver Zahlen: ${mNumberAttributes[numberAttributes.positiv]} ");
  print("Anzahl negativer Zahlen: ${mNumberAttributes[numberAttributes.negativ]}");

}

void printDistribution(List<int> pnumbers) {
  // Gibt eine einfache Häufigkeitsverteilung aus
  // z.B. wie oft kommt jede Zahl vor

  // liste erst Sortieren  
  List<int> numbers = pnumbers;
  int n = numbers.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (numbers[j] > numbers[j + 1]) {
        // temp zum tauschen der beiden elemente
        int temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
      }
    }
  }

  int count = 1;
  for (int i=0; i<numbers.length; i++){    
    if (i>0){
      if (numbers[i-1]==numbers[i]){ 
        count++;        
      } else {
        print("Zahl: ${numbers[i]}: $count mal.");
        count=1;
      }
    }
  }

}

// Hauptfunktion:
void analyzeNumbers(List<int> numbers) {
  // Ruft alle Funktionen der Reihe nach auf
  // Gibt eine übersichtliche Gesamtanalyse
  findAndPrintExtreme(numbers);
  printNumberTypes(numbers);
  printDistribution(numbers);
}

void gen_random_list(List<int> numbers, [int count=0]){
  numbers.clear();
  // generate List
  Random r = Random();
  int c = count; if (count==0){ c=r.nextInt(200);}
  for (int i=0; i<c; i++){numbers.add(r.nextInt(c)-(c~/2));}
}

void main() {

  List<int> numbers = [1];

  gen_random_list(numbers);

  print("Liste: ${numbers}");

  analyzeNumbers(numbers);

}


