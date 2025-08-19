## Task 3.4.2

### Aufgabe 1

``` Dart
void main(List<String> arguments) {
  int age = 15;
  bool hasParentalConsent = true;
  int movieAgeRating = 16;

  if ((age>movieAgeRating) || (hasParentalConsent && (age >= (movieAgeRating-2)))) {
    print("Darf den Film sehen");
  } else {
    print("Darf den Film nicht sehen");
  }

  age=13; hasParentalConsent = false; movieAgeRating = 16;

  bool Bool = ((age>movieAgeRating) || (hasParentalConsent && (age >= (movieAgeRating-2)))) ;  
  Bool?print("Darf den Film sehen"):print("Darf den Film nicht sehen");
    
}

```

### Aufgabe 2

``` Dart
void main(List<String> arguments) {
  // Aufgabe 2

  bool isLoggedIn = true;
  bool isBanned = false;
  bool isSubscribed = true;
  int age = 18;

  // Hier deine Bedingungen 

  if (isLoggedIn == false){
    print("Bitte logge dich ein");
  }
 
  if (isBanned == true){
    print("Dein Accout wurde gesperrt");
  }

  if (isSubscribed == false){
    print("Bitte abonniere");
  }

  if (age < 18){
    print("Du bist zu jung");
  }

  if ((isLoggedIn == true) && (isBanned == false) && (isSubscribed == true) && (age >= 18)) { print("Willkommen"); }

  // Oder 

  if (isLoggedIn == false){
    print("Bitte logge dich ein");
  } else  if (isBanned == true){
    print("Dein Accout wurde gesperrt");
  } else  if (isSubscribed == false){
    print("Bitte abonniere");
  } else  if (age < 18){
    print("Du bist zu jung");
  } else { 
    print("Willkommen"); 
  }

}

```

### Bonus-Aufgabe 1

``` Dart
 // ########## tests ##########

  // distance = 7.4;
  // double x=0;  
  
  // double ceil;
  // double ganzzahlig = x - (x % 1);
  // double ceil = (x % 1 == 0) ? ganzzahlig : ganzzahlig + 1;  
  // ganzzahlig = distance - 5 - (distance % 1);
  /*
  if (distance % 1 == 0) {
    orderValue = orderValue + (distance - 5 - (distance % 1)) * 0.3;
  } else {
    orderValue = orderValue + (distance - 5 - (distance % 1) + 1) * 0.3;
  }
  print(orderValue); // 8.0

  double x = 10.21;
  double y = 0;
  x = x * 10;
  if (x % 1 == 0) {
    y = y + (x - (x % 1));
  } else {
    y = y + (x - (x % 1) + 1); // +1 für den angefahrenen KM
  }
  x = y / 10;

  print (x);

*/
``` 