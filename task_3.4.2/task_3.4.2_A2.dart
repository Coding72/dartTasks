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
