
### Vorlesung
``` Dart
import "dart:io";
import "dart:math" as myMath;

String output = ""; // global

// scopes und rekursion
void myPrint(){
  myMath.Random random = myMath.Random();
  stdout.write("\x1B[2J");
  void myPrint(){
    void myPrint(){
      void myPrint(){
        void myPrint([String text="Hallo", int i=9]){  
          int font_col = random.nextInt(7); 
          int back_col = random.nextInt(7); back_col = 0;
          int pos_x = random.nextInt(40)+20;
          int pos_y = random.nextInt(30)+10;
          stdout.write("\x1B[3${font_col}m\x1B[4${back_col}m\x1B[${pos_y};${pos_x}H");
          print("${i}->"+text);
          if (i>0){ myPrint("Hallo", --i);}
        }
        myPrint(); 
      }
      myPrint(); 
    }  
    myPrint();    
  }
  myPrint();
}

// short-> Rückgabetyp Funktionsname(Parameter) => Ausdruck;
int add(int a, int b) => a + b;

//doppelte Rekursion
int fibonacci(int n) {
  // Basisfälle: fibonacci(0) = 0, fibonacci(1) = 1
  if (n <= 1) return n;

  // doppelte Rekursion:
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main(){
  myPrint();
  stdout.write("\x1B[37m\n"); // fontcolor weiß
  for (var i = 0; i < 10; i++) {
    print('fibonacci($i) = ${fibonacci(i)}');
  }
  
  // Lambda / Arrow Function Rückgabetyp funktionsName(Parameter) => Ausdruck;
  int square(int x) => x * x; // Lambda als Variable: var add = (int a, int b) => a + b; 
  print(square(5)); // 25

  //Lambda als Parameter
  var numbers = [1, 2, 3, 4, 5];  
  var doubled = numbers.map((n) => n * 2).toList();  
  print(doubled);

  // anonym function: (parameter){// code }
  // anonym function with arrow : (parameter) => ausdruck;
  // (n) => n * 2 siehe oben


}
```
## Task 3.4.7

### Aufgabe 1
``` Dart
main(){ void printNumber(n){print(n);} printNumber(1); printNumber(2); printNumber(3); }
```

### Aufgabe 2
``` Dart
void triplePrint(String t){
  print(t);
  print(t);
  print(t);
}

Object main(){
  triplePrint("Text"); triplePrint("Text2"); //triplePrint("Text3");
  return 0;
}
```

### Aufgabe 3
``` Dart
void reverseInitials(String Vorname, String Nachname){
  print("${Vorname[Vorname.length-1]}.${Nachname[Nachname.length-1]}");
}

void main(Object){
  reverseInitials("Firstname", "Surname");
  reverseInitials("Johnny", "Depp");
  reverseInitials("Tom", "Cruise");
}
```

### Bonus Aufgabe 1
``` Dart
void main() {  
  convertMinutesToTime(179);
}

void convertMinutesToTime(int minutes){
  print("${minutes ~/ 60} Stunden, ${minutes % 60} Minuten");
}

```
### Bonus Aufgabe 2
``` Dart

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

```


### Bonus Aufgabe 3
``` Dart
import "dart:math";

enum numberAttributes { min, max, posmax, posmin, negativ, positiv, gerade, ungerade }

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

// letzte Zahl wird nicht berücksichtigt, ist noch unvollständig.
print ( numbers);
  int count = 1;
  for (int i=0; i<numbers.length; i++){    
    if (i>0){
      if (numbers[i-1]==numbers[i]){
        count++;    
      } else {
        print("Zahl: ${numbers[i-1]}: $count mal.");
        count=1;
      }
      if (i==numbers.length-1){
        if (numbers[i-1]==numbers[i]){
          count++;
          print("Zahl: ${numbers[i]}: $count mal.");
        }
        else {count=1; print("Zahl: ${numbers[i]}: $count mal.");} 
      }
    }
  }

}

// Hauptfunktion:
void analyzeNumbers(List<int> numbers) {
  // Ruft alle Funktionen der Reihe nach auf
  // Gibt eine übersichtliche Gesamtanalyse
 // findAndPrintExtreme(numbers);
 // printNumberTypes(numbers);
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
  // numbers = [-1, 2, 2, 4, 3, 3, 2];

  gen_random_list(numbers);

  print("Liste: ${numbers}");

  analyzeNumbers(numbers);

}

```