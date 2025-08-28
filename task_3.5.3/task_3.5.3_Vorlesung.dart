import "dart:io";
import "dart:math" as myMath;

String output = ""; // global

// scopes und rekursion
void myPrint(){
  myMath.Random random = myMath.Random();
  stdout.write("\x1B[2J");
  void myPrint(){
    void myPrint(){
      void myPrint(){
        void myPrint([String text="Hallo", int i=9]){  
          int font_col = random.nextInt(7); 
          int back_col = random.nextInt(7); back_col = 0;
          int pos_x = random.nextInt(40)+20;
          int pos_y = random.nextInt(30)+10;
          stdout.write("\x1B[3${font_col}m\x1B[4${back_col}m\x1B[${pos_y};${pos_x}H");
          print("${i}->"+text);
          if (i>0){ myPrint("Hallo", --i);}
        }
        myPrint(); 
      }
      myPrint(); 
    }  
    myPrint();    
  }
  myPrint();
}

// short-> Rückgabetyp Funktionsname(Parameter) => Ausdruck;
int add(int a, int b) => a + b;

//doppelte Rekursion
int fibonacci(int n) {
  // Basisfälle: fibonacci(0) = 0, fibonacci(1) = 1
  if (n <= 1) return n;

  // doppelte Rekursion:
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main(){
  myPrint();
  stdout.write("\x1B[37m\n"); // fontcolor weiß
  for (var i = 0; i < 10; i++) {
    print('fibonacci($i) = ${fibonacci(i)}');
  }
  
  // Lambda / Arrow Function Rückgabetyp funktionsName(Parameter) => Ausdruck;
  int square(int x) => x * x; // Lambda als Variable: var add = (int a, int b) => a + b; 
  print(square(5)); // 25

  //Lambda als Parameter
  var numbers = [1, 2, 3, 4, 5];  
  var doubled = numbers.map((n) => n * 2).toList();  
  print(doubled);

  // anonym function: (parameter){// code }
  // anonym function with arrow : (parameter) => ausdruck;
  // (n) => n * 2 siehe oben


}