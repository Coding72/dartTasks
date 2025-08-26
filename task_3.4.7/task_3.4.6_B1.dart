double main() {
  String word = "Ottot";  
  // Hier deine for-Schleife:
  bool isPalindrom = true;
  int i=0;

  final int length = (word.length ~/ 2) + ((word.length % 2 == 0) ? 0 : 1);  // Schleife bis zur Mitte, falls ungerade wird aufgerundet

  fehler muß nur abgerundet werden 5te ist irrelevant

  print(length);
  isPalindrom = false;
  for (i; i<length; i++){
    print(i.toString()+word[i]+"<=>"+word[word.length-i-1]);
 print(length-1);

    if (word[i] == word[word.length-i-1]) {
      if  (i==length-1){ print("##"); isPalindrom = true; };
    } else {print("xyxxx");i=length;}
  }
    

  if (isPalindrom == true) {
    print('$word ist ein Palindrom');
  } else {
    print('$word ist kein Palindrom');
  }

  return 0;


}
