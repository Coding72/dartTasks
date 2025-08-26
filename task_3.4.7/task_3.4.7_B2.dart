
num main() {
  int number = 5;
  String numbers = "" ;

  for (int i=1; i<number; i++){ numbers += "$i "; }
  for (int i=number; i>0; i--){ numbers += "$i "; }

  print(numbers);

  return 0;
}
