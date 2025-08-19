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


