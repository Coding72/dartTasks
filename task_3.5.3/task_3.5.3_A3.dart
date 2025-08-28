void main(){
  print("${Zaehle_Vokale_1("power")} - ${Zaehle_Vokale_2("Otto")} - ${Zaehle_Vokale_3("Ich")}");
}

// letzte Version,
int Zaehle_Vokale_1(String Text){
  List<int> Vokale = [65, 69, 73, 79, 85, 97, 101, 105, 111, 117, 196, 228, 214, 246, 220, 252];
  int Vokalzahl = 0;  
  for (String Buchstabe in Text.split('')){    
    if (Vokale.contains(Buchstabe.codeUnitAt(0))){ 
      Vokalzahl++;
    }
  }
  return Vokalzahl;
}

// dritte Version
int Zaehle_Vokale_2(String Text){
  List<String> Vokale = ["a", "e", "i", "o", "u", "ä", "ö", "ü", "A", "E", "I", "O", "U", "Ä", "Ö", "Ü"];
  int Vokalzahl = 0;
  for (int i=0; i<Text.length; i++){
    if (Vokale.contains(Text[i])){ Vokalzahl++; }   // oder Vokale.contains(Buchstabe.toLower()) falls List ohne caps
  }
  return Vokalzahl;
}

// zweite Version
int Zaehle_Vokale_3(String Text){
  List<String> Vokale = ["a", "e", "i", "o", "u", "ä", "ö", "ü", "A", "E", "I", "O", "U", "Ä", "Ö", "Ü"];
  int Vokalzahl = 0;
  for (int j=0; j<Vokale.length; j++){
    for (int i=0; i<Text.length; i++){    
      if (Vokale[j] == Text[i]){ Vokalzahl++; }
    }
    // Text.contains(Vokale[j]) ? Vokalzahl++ : false; // statt inneren Schleife
    // Vokale[j] == Text[i] ? Vokalzahl++ : false;
  }
  return Vokalzahl;
}

//erste Version 
/*
  for (int i=0; i<Text.length; i++){  
  switch (Text[i]) {
    case "a"
    case "i"
    default...
  }
*/




