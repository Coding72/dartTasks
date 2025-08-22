
### Vorlesung
``` Dart
void main(){
  List<int> numbers = List.generate(
    100,
    (i) => i + 1,
  );

/*
  for (int n in numbers){
    if (n % 33 == 0 && n % 5 ==0 ){
      print("FizzBuzz");
    } else if ( n % 3 == 0 ){
      print("Fizz");
    }  else if (  n % 5 ==0 ){
      print("Buzz");
    } else { print(n); }
  }
*/

  // Falsche Interpretation
  String s = ""; int check = 0;
  for (int n in numbers){

   s = "";
   if (n < 100) { s = " "; }
   if (n < 10) { s = "  "; }   

    // 4 Möglichkeiten !
    
    if (n % 3 == 0 && n % 5 !=0 ){ print("$n $s- "+"Fizz"); check++;}
    if (n % 3 != 0 && n % 5 ==0 ){ print("$n $s- "+"Buzz"); check++;}
    if (n % 3 == 0 && n % 5 ==0 ){ print("$n $s- "+"FizzBuzz"); check++;}
    if (n % 3 != 0 && n % 5 !=0 ){ print("$n $s- "); check++;}

  }

  print(check);

  // Richtige Lösung zur Aufgabe
  String s = ""; int check = 0;
  for (int n in numbers){

   s = "";
   if (n < 100) { s = " "; }
   if (n < 10) { s = "  "; }   

    // 4 Möglichkeiten !
    
    if (n % 3 == 0){ print("$n $s- "+"Fizz"); check++;}
    if (n % 5 ==0 ){ print("$n $s- "+"Buzz"); check++;}
    if (n % 3 == 0 && n % 5 ==0 ){ print("$n $s- "+"FizzBuzz"); check++;}
    if (n % 3 != 0 && n % 5 !=0 ){ print("$n $s- "); check++;}

  }

  print(check);



}

```
## Task 3.4.5

### Aufgabe 1
``` Dart
void main(){
    
  List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];

  for (String name in names){
    print(name);
  }

}
```
### Aufgabe 2
``` Dart
void main(){
  
  List<int> points = [4, 5, 4, 2, 6 ,6 ,3];
  
  int sum = 0;
  for (var point in points){ sum += point; }
  print("Länge der Liste: "+points.length.toString());
  print("Summe: "+(sum).toString());
  print("Durchschnitt: "+(sum/points.length).toString());

  // version 2
  // als funktion zur Laufzeit falls die Liste dynamisch wächst.
  for (var point in points.asMap().entries){
      if (point.key > 0){points[0]+=points[point.key];}
      //print("Durchschnitt (bis pos->"+point.key.toString()+", "+points[0].toString()+"/"+(point.key+1).toString()+"): "+(points[0]/(point.key+1)).toString());
      if (point.key >= points.length-1){ print((points[0]/(point.key+1)).toString()); }
      //print((points[0]/(point.key+1)).toString());
  }

}
```
### Bonus Aufgabe 1
``` Dart
void main(){
  List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];
  List<int> points = [4, 5, 4, 2, 6 ,6 ,3];
  Map<String, int> names_points = {};
  
  if (names.length == points.length){
    int i=0; while (i<names.length){
      names_points[names[i]] = points[i];
      i++;
    }
  }

  print(names_points);
}

```
### Bonus Aufgabe 2
``` Dart
void main(){
  List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];
  List<int> points = [4, 5, 4, 2, 6 ,6 ,3];
  Map<String, int> names_points = {};
  
  if (names.length == points.length){
    int i=0; while (i<names.length){
      names_points[names[i]] = points[i];
      i++;
    }
  }

  for ( String name in names_points.keys){ print(name); }
  for ( int point in names_points.values){ print(point); }
  for ( String name in names_points.keys){ print(name+" - "+names_points[name].toString()); }

}
```