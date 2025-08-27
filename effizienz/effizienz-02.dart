import "dart:math";
import 'dart:io';

enum numberAttributes { min, max, posmax, posmin, negativ, positiv, gerade, ungerade }

void findAndPrintExtreme_Philipp(List<int> numbers) {
  if (numbers.isEmpty) return;
  final List<int> copyNumbers = List.from(numbers);
  copyNumbers.sort();
  final int min = copyNumbers[0];
  final int max = copyNumbers[numbers.length - 1];
  final List<String> indexPositions = [];
  for (int i = 0; i < 2; i++) {
    int value = i == 0 ? min : max;
    for (int j = 0; j < numbers.length; j++) {
      if (value != numbers[j]) continue;
      indexPositions.add('$j, ');
    }
    indexPositions[indexPositions.length -1] = indexPositions[indexPositions.length -1][0];
    print('Die ${value == min ? 'kleinste' : 'größte'} Zahl ist $value und befindet sich auf ${indexPositions.length == 1 ? 'der Position' : 'den Positionen'} ${indexPositions.join()}');
    indexPositions.clear();
  }
}

// Implementiere folgende Funktionen:
void findAndPrintExtreme_Harry(List<int> numbers) {
  // Findet und gibt kleinste und größte Zahl aus
  // Zeigt auch deren Position in der Liste
  int min = numbers[0];
  int max = numbers[0];
  int minIndex = 0;
  int maxIndex = 0;

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] < min) {
      min = numbers[i];
      minIndex = i;
    }
    if (numbers[i] > max) {
      max = numbers[i];
      maxIndex = i;
    }
  }

  // erstes Element soll die Pos 1 haben statt 0 
  print('--- Kleinste Zahl: $min (erste gefundene Position: ${minIndex + 1})');
  print('--- Größte Zahl: $max (erste gefundene Position: ${maxIndex + 1})');
}

// bonus 3
void findAndPrintExtreme_Daniel(List<int> numbers) {
  // Findet und gibt kleinste und größte Zahl aus
  // Zeigt auch deren Position in der Liste
  int smallest = numbers.first;
  int smallPos = 0;
  int biggest = numbers.last;
  int bigPos = 0;
  for(int i = 0;i<numbers.length;i++)
  {
    int num = numbers[i];
    if(smallest>num)
    {
      smallest = num;
      smallPos = i+1;
    }
    if(biggest<num)
    {
      biggest = num;
      bigPos = i+1;
    }
  }
  print("Grösste Zahl ist $biggest an Positon $bigPos und kleinste Zahl ist $smallest an Position $smallPos");
}

// Implementiere folgende Funktionen:
void findAndPrintExtreme_Ralph(List<int> numbers) {
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
  findAndPrintExtreme_Ralph(numbers);
  stopwatch.stop();
  print('Die Funktion von Ralph hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  findAndPrintExtreme_Daniel(numbers);
  stopwatch.stop();
  print('Die Funktion von Daniel hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  findAndPrintExtreme_Harry(numbers);
  stopwatch.stop();
  print('Die Funktion von Harry hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  findAndPrintExtreme_Philipp(numbers);
  stopwatch.stop();
  print('Die Funktion Phillip hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');

}