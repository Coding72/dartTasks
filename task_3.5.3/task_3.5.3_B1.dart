void main() {
  print("${checkHightest(1,2)} - ${checkHightest(3,4)} - ${checkHightest(5,6)}");
}

int checkHightest(int number1, int number2){
  int highest = 0;
  //number1>number2?highest=number1:highest=number2;
  if (number1>number2){
    highest=number1;
  } else {
    highest=number2;
  }
  return highest;
  //return number1 > number2 ? number1 : number2;
}


