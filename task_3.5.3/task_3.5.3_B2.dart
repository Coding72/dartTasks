void main() {

  print("${even(1)} - ${even(4)} - ${even(-7)}");

}

bool even(int n){ return n % 2 == 0 ? true : false; }
