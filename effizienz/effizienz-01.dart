import "dart:math";
import 'dart:io';

void printDistribution_Philipp(List<int> numbers) { 
  int x=0;
  if (numbers.isEmpty) return;
  final Set<dynamic> set = List.from(numbers).toSet();
  final Map<int, int> amount = {};
  for (int number in set) {
    List<int> nums = numbers.where((listElement) => listElement == number).toList();
    amount[number] = nums.length;
  }
  //amount.forEach((key, value) => print('Die Zahl $key kommt ${value}mal in der Liste vor.'));
  amount.forEach((key, value) => x=0);
}

void printDistribution_Harry(List<int> numbers) {
  // Gibt eine einfache Häufigkeitsverteilung aus
  // z.B. wie oft kommt jede Zahl vor
  Map<int, int> frequency = {};
  for (int n in numbers) {
    frequency[n] = (frequency[n] ?? 0) + 1;
  }
  frequency.forEach((key, value) {
    //print('--- $key: ${value}x');
  });

  //print ('--- Alternative Ausgabe ---');
  // oder
  for(var entry in frequency.entries) {
    //print('--- ${entry.key}: ${entry.value}x');
  }

}

void printDistribution_Daniel(List<int> numbers) {
  // Gibt eine einfache Häufigkeitsverteilung aus
  // z.B. wie oft kommt jede Zahl vor
  Map<int, int> zaehlung = {};
  for (var number in numbers) 
  {
    zaehlung[number] = (zaehlung[number] ?? 0) + 1;
  }
  for(int key in zaehlung.keys)
  {
    //print("Die $key kommt ${zaehlung[key]}x vor.");
  }
}

void printDistribution_Ralph(List<int> pnumbers) {
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
print (numbers);
  int count = 1;
  for (int i=0; i<numbers.length; i++){    
    if (i>0){
      if (numbers[i-1]==numbers[i]){
        count++;    
      } else {
        //print("Zahl: ${numbers[i-1]}: $count mal.");
        count=1;
      }
      if (i==numbers.length-1){
        if (numbers[i-1]==numbers[i]){
          count++;
          //print("Zahl: ${numbers[i]}: $count mal.");
        }
        else {count=1; 
          //print("Zahl: ${numbers[i]}: $count mal.");
        } 
      }
    }
  }

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
  printDistribution_Ralph(numbers);
  stopwatch.stop();
  print('Die Funktion von Ralph hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  printDistribution_Daniel(numbers);
  stopwatch.stop();
  print('Die Funktion von Daniel hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  printDistribution_Harry(numbers);
  stopwatch.stop();
  print('Die Funktion von Harry hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
  printDistribution_Philipp(numbers);
  stopwatch.stop();
  print('Die Funktion Phillip hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');

}


