fooList(List<int> list1){ 
  list1.add(3); 
  list1 = [9]; 
  list1.add(4); 
  print(list1); 
}

// Variante 1
fooList_1(List<int> list1){ 
  // copy erstellen add
  var newList = [...list1]; // Kopie erstellen
  newList.add(3);
  newList = [...newList, 4]; // noch ein Element hinzufügen
  print(newList); // [1, 2, 3, 4]
}

// Variante 2
fooList_2(List<int> list1) {
  var newList = List.from(list1); // Kopie
  newList.add(3);
  newList.add(4);
  print(newList); // [1, 2, 3, 4]
}

void main() {
  List<int> list= [1, 2];
  fooList_1(list); 
  fooList_2(list);

}

class Minute {
  final int value;

  Minute(this.value) {
    if (value < 1 || value > 60) {
      throw ArgumentError('Minute muss zwischen 1 und 60 liegen');
    }
  }

  @override
  String toString() => '$value min';
}

void convertMinutesToTime(Minute m){

}


