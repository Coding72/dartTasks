
### Vorlesung
``` Dart
void main(){

  List<String> names = ["Alice", "Bob", "Charlie"];

  for (int i=0; i<3; i++){
    String name = names[i];
    print(name);

  }

}
```
## Task 3.4.7

### Aufgabe 1
``` Dart
bool main(){
  for (int i=0;i<100;i++){
    if (i<10) {print("Kleine Zahl: $i");} // else
    if (i<60) {print("Mittlere Zahl: $i");}
    if (i>=60) {print("Große Zahl: $i");}
  }

  return false;
}
```


### Bonus Aufgabe 1
``` Dart
double main() {
  String word = "Otto";
  // Hier deine for-Schleife:
  bool isPalindrom = true;
  int i=0;

  int length = word.length ~/ 2;
  isPalindrom = false;
  for (i; i<length; i++){    
    if  (word[i].toLowerCase()==word[word.length-i-1].toLowerCase()){ 
      isPalindrom = true; 
    } else { 
      isPalindrom = false;
      i = word.length;  //break;
    } 
  }
   
  if (isPalindrom == true) {
    print('$word ist ein Palindrom');
  } else {
    print('$word ist kein Palindrom');
  }

  return 0;


}
```
### Bonus Aufgabe 2
``` Dart

num main() {
  int number = 5;
  String numbers = "" ;

  for (int i=1; i<number; i++){ numbers += "$i "; }
  for (int i=number; i>0; i--){ numbers += "$i "; }

  print(numbers);

  return 0;
}

```