import "dart:math";
import 'dart:io';

enum numberAttributes { min, max, posmax, posmin, negativ, positiv, gerade, ungerade }

void printNumberTypes_Ralph(List<int> numbers) {
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

void printNumberTypes_Daniel(List<int> numbers) {
  // Zählt und gibt aus:
  // - Wie viele gerade/ungerade Zahlen
  // - Wie viele positive/negative Zahlen
  int ungerade = 0;
  int gerade = 0;
  int positiv = 0;
  int negativ = 0;
  for(int num in numbers)
  {
    ((num % 2) == 0)?gerade++:ungerade++;
    (num >= 0)?positiv++:negativ++;
  }
  print("Das Feld hat $gerade gerade Zahlen und $ungerade ungerade Zahlen");
  print("Das Feld hat $positiv positive Zahlen und $negativ negative Zahlen");
  
}

void printNumberTypes_Harry(List<int> numbers) {
  // Zählt und gibt aus:
  // - Wie viele gerade/ungerade Zahlen
  // - Wie viele positive/negative Zahlen
  for (int number in numbers) {
     print('--- $number ist ${(number % 2 == 0) ? 'gerade' : 'ungerade'} und ${(number > 0) ? 'positiv / nicht-negativ' : 'negativ'}');
  }
}

void printNumberTypes_Philipp(List<int> numbers) {
  if (numbers.isEmpty) return;
  final List<int> oddNumbers = numbers.where((number) => number % 2 != 0).toList();
  final List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  final List<int> positiveNumbers = numbers.where((number) => number >= 0).toList();
  final List<int> negativeNumbers = numbers.where((number) => number < 0).toList();

  stdout.write('Anzahl gerade Zahlen: ${evenNumbers.length}, ');
  stdout.write('Anzahl ungerade Zahlen: ${oddNumbers.length}, ');
  stdout.write('Anzahl positive Zahlen: ${positiveNumbers.length}, ');
  stdout.write('Anzahl negative Zahlen: ${negativeNumbers.length}\n');
}

void gen_random_list(List<int> numbers, [int count=0]){
  numbers.clear();
  // generate List
  Random r = Random();
  int c = count; if (count==0){ c=r.nextInt(200);}
  for (int i=0; i<c; i++){numbers.add(r.nextInt(c)-(c~/2));}
}


void main() {

  List<int> numbers = [];

  gen_random_list(numbers, 10000);

  //print("Liste: ${numbers}");

  var stopwatch = Stopwatch()..start();
  printNumberTypes_Ralph(numbers);
  stopwatch.stop();
  print('Die Funktion von Ralph hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  printNumberTypes_Daniel(numbers);
  stopwatch.stop();
  print('Die Funktion von Daniel hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  //printNumberTypes_Harry(numbers);
  stopwatch.stop();
  print('Die Funktion von Harry hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  printNumberTypes_Philipp(numbers);
  stopwatch.stop();
  print('Die Funktion Phillip hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');

}