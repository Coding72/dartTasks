void main(){
  print("${isPrimeNumber(18)} / ${isPrimeNumber(19)} / ${isPrimeNumber(53)}");
}

bool isPrimeNumber(int number){
  List<int> foundPrimeNumbers = [1];
  if (number > 1){
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
  }
  return true;
}

