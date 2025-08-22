
### Vorlesung

``` Dart
import 'dart:math';

enum Status { pending, approved, rejected, cancelled }

void main(){
  
 /* int rand(){ return Random().nextInt(5)+1; }  
  int a = rand(); print ("a=$a");
  switch (a){
    case 1:
      print("1");
    case >4:
      print(">4");
    case >2:
      print(">2");  
    default:
      print("");
  }
  */

 var rng = Random();
 int rand(){ return rng.nextInt(5)+1; } 
  int a = rand(); print ("a=$a");
  switch (a){
    case 1:
      print("1");
    case >4:     
    case >2:
      if (a>4){ print(">4"); }; //break;
      print(">2");  
    default:
      print("");
  }


  final status = Status.pending;
  String message = "";
  if (status == Status.pending){
    print("Message pending");
  } else if (status == Status.rejected) {
    print("Message rejected");
  } else {
    print("Message unknown");
  }

  switch (status){
    case Status.pending:
      break;
    case Status.approved:
      print("Message approved");
    default:print("Message unknown");
  }

}

```

## Task 3.4.3

### Aufgabe 1

``` Dart

```

### Bonus Aufgabe 1

``` Dart

```

