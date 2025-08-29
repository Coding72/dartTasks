import "dart:math";
import 'dart:io';

int Summiere_drei_Integer_Ralph(int Zahl_1, int Zahl_2, int Zahl_3) { return Zahl_1+Zahl_2+Zahl_3; }
int Zeichen_zaehlen_Ralph(String Text){ return Text.length; }
int Zaehle_Vokale_Ralph(String Text){
  List<String> Vokale = ["a", "e", "i", "o", "u", "ä", "ö", "ü"];
  int Vokalzahl = 0;  
  for (int j=0; j<Vokale.length; j++){
    for (int i=0; i<Text.length; i++){    
      if (Vokale[j] == Text[i]){ Vokalzahl++; }
    }
  }
  return Vokalzahl;
}



int add3numbers_Daniel(int a, int b, int c)
{
  //print('Addiere $a+$b+$c');
  return a+b+c;
}

// funktion fuer aufgabe 2
int getLengthOfText_Daniel(String text)
{
  return text.length;
}

// funktion fuer aufgabe 3
int getNumberOfVocals_Daniel(String text)
{
  List<String> vokals = ['a', 'e', 'i', 'o', 'u', 'ä', 'ö', 'ü'];
  int numVokals = 0;
  for(String vokal in vokals)
  {
    for(int i = 0; i < text.length; i++)
    {
      text[i] == vokal? numVokals++:();
    }
  }
  return numVokals;
}

int calcVocals_Harry(String text) {
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    if ('aeiouäöü'.contains(text[i].toLowerCase())) {
      count++;
    }
  }
  return count;
}

int calcAlternative_Harry(String text) {
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    switch (text[i].toLowerCase()) {
      case 'a':
      case 'e':
      case 'i':
      case 'o':
      case 'u':
      case 'ä':
      case 'ö':
      case 'ü':
        count++;
        break;
    }
  }
  return count;
}

int countVowels_Melanie(String text){
  const vowels = "aeiouäöü";
  return text.toLowerCase().split('').where((char) => vowels.contains(char)).length;
}


void main() {

  int count = 100000;
  int c1=0, c2=0, c3=0;
  String t="dasfafasdfkldjasfdöjsfdkjas";

  int ret = 0;

  var stopwatch = Stopwatch()..start();
    for(int i=0;i<count;i++){ Summiere_drei_Integer_Ralph(c1, c2, c3); }
  stopwatch.stop();
  print('Die Funktion Summiere_drei_Integer von Ralph hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
    for(int i=0;i<count;i++){ add3numbers_Daniel(c1, c2, c3); } 
  stopwatch.stop();
  print('Die Funktion dd3numbers_Daniel von Daniel hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");

  stopwatch = Stopwatch()..start();
    for(int i=0;i<count;i++){ Zeichen_zaehlen_Ralph(t); }
  stopwatch.stop();
  print('Die Funktion Zeichen_zaehlen von Ralph hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
    for(int i=0;i<count;i++){ getLengthOfText_Daniel(t); }
  stopwatch.stop();
  print('Die Funktion getLengthOfText von Daniel hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");

  stopwatch = Stopwatch()..start();
    for(int i=0;i<count;i++){ Zaehle_Vokale_Ralph(t); }
  stopwatch.stop();
  print('Die Funktion Zaehle_Vokale von Ralph hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
  stopwatch = Stopwatch()..start(); 
    for(int i=0;i<count;i++){ getNumberOfVocals_Daniel(t); } // großbuchstaben nicht berücksichtigt
  stopwatch.stop();
  print('Die Funktion getNumberOfVocals von Daniel hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
    stopwatch = Stopwatch()..start(); 
    for(int i=0;i<count;i++){ calcVocals_Harry(t); } // großbuchstaben nicht berücksichtigt
  stopwatch.stop();
  print('Die Funktion calcVocals von Harry hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");
    stopwatch = Stopwatch()..start(); 
    for(int i=0;i<count;i++){ calcAlternative_Harry(t); } // großbuchstaben nicht berücksichtigt
  stopwatch.stop();
  print('Die Funktion calcAlternative von Harry hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");

  stopwatch = Stopwatch()..start(); 
  for(int i=0;i<count;i++){ countVowels_Melanie(t); } // großbuchstaben nicht berücksichtigt
  stopwatch.stop();
  print('Die Funktion countVowels von Melanie  hat ${stopwatch.elapsedMilliseconds} Millisekunden benötigt.');
  print("----------------------------------------------");

}