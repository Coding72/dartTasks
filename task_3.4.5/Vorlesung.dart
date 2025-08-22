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