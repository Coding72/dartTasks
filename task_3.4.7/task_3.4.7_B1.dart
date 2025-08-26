double main() {
  String word = "Otto";
  // Hier deine for-Schleife:
  bool isPalindrom = true;
  int i=0;

  int length = word.length ~/ 2;
  isPalindrom = false;
  for (i; i<length; i++){    
    if  (word[i].toLowerCase()==word[word.length-i-1].toLowerCase()){ 
      isPalindrom = true; 
    } else { 
      isPalindrom = false;
      i = word.length;  //break;
    } 
  }
   
  if (isPalindrom == true) {
    print('$word ist ein Palindrom');
  } else {
    print('$word ist kein Palindrom');
  }

  return 0;


}
