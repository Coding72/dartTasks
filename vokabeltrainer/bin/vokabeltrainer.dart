//#region [rgba(165,245,205,0.1)] ===== todo =====
  /**
   * @todo
   * test cursor pos speicher und cursor pos laden
   * vokabeln listen imm 20 und auf eingabe warten
   * 
   * vokabeln löschen
   * lektionen
   * 
  */
//#endregion ===== todo =====

//#region [rgba(165,245,205,0.1)] ===== imports =====
  import 'dart:async';  
  import 'dart:convert';
  import "dart:io";
  import 'dart:math';
//#endregion ===== imports =====

//#region [rgba(20,60,90,0.5)] ===== globals =====
  enum Languages {deen, ende, defr, frde, deru, rude}

  String tab = "      ";
  String fileName = "vocabulary_DE-RU.json";
  int points = 0;

  enum Color {black, red, green, yellow, blue, lightBlue, magenta, cyan, white, _default, reset}
  Map<Color,String> fontColor = { Color.black:"30", Color.red:"31", Color.green:"32", Color.yellow:"33", Color.blue:"34", Color.lightBlue:"38;2;150;180;250", Color.magenta:"35", Color.cyan:"36", Color.white:"37", Color._default:"39", Color.reset:"0" };
  Map<String, String> vocabulary = {};

  StreamSubscription<ProcessSignal>? subscription;
//#endregion ===== globals =====



void main(List<String> arguments) {
  //doIntercepts();

  testDatas();
  printMenuDE();
  menuInput();

  //testVocabulary();

}

void doIntercepts(){
 subscription = ProcessSignal.sigint.watch().listen((signal) {
    //print('Ctrl+C wurde gedrückt. Das Programm wird nicht beendet.');
    if (subscription != null) { subscription!.cancel(); } exit(1);
  });
}

void testDatas(){
  loadList(Languages.deen);
}

void saveList(){
  try {
    String jsonString = jsonEncode(vocabulary);
    File(fileName).writeAsStringSync(jsonString);
    printOKMessage('Liste erfolgreich gespeichert.');
  } catch (e) {
    printErrorMessage('Fehler beim Speichern der Liste: $e');
  }
}

void loadList(Languages lang){

  bool switchDirection = false;  
  switch(lang){
    case Languages.deen: fileName="vocabulary_DE-EN.json";
    case Languages.defr: fileName="vocabulary_DE-FR.json";
    case Languages.deru: fileName="vocabulary_DE-RU.json";
    case Languages.ende: fileName="vocabulary_DE-EN.json"; switchDirection = true;
    case Languages.frde: fileName="vocabulary_DE-FR.json"; switchDirection = true;
    case Languages.rude: fileName="vocabulary_DE-RU.json"; switchDirection = true;
  }

  try {    
    File datei = File(fileName);
    if (!datei.existsSync()) {
      printErrorMessage('Die Datei existiert nicht.');
      return;
    }
    String jsonString = datei.readAsStringSync();
    vocabulary = Map<String, String>.from(jsonDecode(jsonString));
    // tausche Key-Wert    
    if (switchDirection) {
      Map<String, String> swappedVocabulary = {};
      for (var word in vocabulary.entries){
        swappedVocabulary[word.value] = word.key;
      }
      vocabulary = swappedVocabulary;
    }
    printOKMessage('List geladen.');
  } catch (e) {
    //printErrorMessage('Fehler beim Laden der Liste: $e');
    printErrorMessage('Fehler beim Laden der Liste.');
  }
}

void printOKMessage(String msg){
  printMessage(msg, Color.green);  
}

void printErrorMessage(String msg, [int duration=5]){
  printMessage(msg,  Color.red);
}

Future<void> printMessage1(String msg,  {Color fc = Color.white }) async {
  int posY = 10;
  await Future.delayed(Duration(seconds: 2)); // Simuliert eine Verzögerung
  stdout.write("\x1b[s");
  stdout.write("\x1B[1m\x1B[$posY;0H$tab");  
  stdout.write("\x1B[${fontColor[fc]}m\x1B[1m");
  stdout.writeln("$tab$msg");
  fc = Color.reset;
  stdout.write("\x1b[u");
}

void printMessage(String msg,  [Color fc = Color.white]){
  stdout.write("\x1B[${fontColor[fc]}m\x1B[1m");
  stdout.writeln("$tab$msg");
  fc = Color.reset;
  stdout.write("\x1B[${fontColor[fc]}m\x1B[1m");
}

void printMenuDE(){
  String menu = 
  """

      #############################
      #      Vokabeltrainer       #
      -----------------------------
      1. Neue Vokabel hinzufügen  -
      2. Vokabel abfragen         -
      3. Beenden                  -
      -----------------------------
  """;
  clearScreen();  
  printMessage(menu);
  printMessage("Deine Eingabe (1-3): ");
  stdout.write(tab);
}

void menuInput(){

  while (true){
    
    String? userInput = stdin.readLineSync(); userInput=userInput??"";   
  
    switch (userInput){
      case "1" : addVocabulary();
      case "2" : testVocabulary();
      case "3" : exit(1);
      case ""  : cursorUp(); stdout.write(tab);

      default: 
        printErrorMessage("Falsche eingabe");
        //cursorUp(); cursorUp(); deleteLine(); // zeile nach oben

        //printMenuDE();
    }
  }

}

void deleteLine(){stdout.write('\x1B[2K');}

void cursorUp(){stdout.write('\x1B[A');}

void addVocabulary(){
  bool isValid=false;
  bool myBreak = false;
  String? wordLang1 =""; 
  String? wordLang2 ="";



  printMessage("Deutsches Wort eingeben: ");
  stdout.write(tab);
    while ((true) && (myBreak==false)){    
    wordLang1 = stdin.readLineSync(); wordLang1=wordLang1??"";  // geht \ zeichen oder " ' ?
    
    // check ob valide Zeichen eingeben wurden
    RegExp regex = RegExp(r'^[a-zA-ZäöüÄÖÜß]+$');
    isValid = regex.hasMatch(wordLang1);    
    if (wordLang1=="3"){ printErrorMessage("Abbruch"); myBreak = true; break; }
    if (isValid){ break; } else { printErrorMessage("Falsche eingabe. Nicht erlaubte Zeichen !"); }
  }

  // Eingabe - Fremdwort
    printMessage("Englisches Wort eingeben: ");
    stdout.write(tab);
    while ((true) && (myBreak==false)){    
    wordLang2 = stdin.readLineSync(); wordLang2=wordLang2??""; 
    RegExp regex = RegExp(r'^[a-zA-Z]+$');
    isValid = regex.hasMatch(wordLang2); // wenn zahl 3 einegeben zum hauptmenu     
    if (wordLang2=="3"){ printErrorMessage("Abbruch"); myBreak = true; break; }
    if (isValid){ break; } else { printErrorMessage("Falsche eingabe. Nicht erlaubte Zeichen !"); }
    //RegExp(r'^[a-zA-Zàâçéèêëîôû]+$'); 
    //RegExp(r'^[а-яА-ЯёЁ]+$');
  }
  wordLang1=wordLang1??""; wordLang2=wordLang2??""; 
  if (!myBreak){ vocabulary[wordLang1] = wordLang2; }
  printMenuDE();
  // wert paare speichern
}

void testVocabulary(){
  bool isValid=false;
  bool myBreak = false;
  String? wordLang =""; 

  printMessage("Abfrage: ");
  for (var word in vocabulary.entries){
    printMessage("Was heißt \"${word.key}\" auf Englisch");      
    while ((true) && (myBreak==false)){   
      stdout.write(tab);
      wordLang = stdin.readLineSync(); wordLang=wordLang??"";  // geht \ zeichen oder " ' ?
    
      // check ob valide Zeichen eingeben wurden
      RegExp regex = RegExp(r'^[a-zA-ZäöüÄÖÜß]+$');
      isValid = regex.hasMatch(wordLang);

      if (wordLang.isEmpty) { printMessage("Richtig wäre \"${word.value}\" gewesen."); break; }
      if (wordLang=="3"){ printErrorMessage("Abbruch"); myBreak = true; } else {
        if (isValid){ 
          if (wordLang == word.value){ printOKMessage("Richtig\n"); points++; }else{printErrorMessage("Falsch\n");}
          break;
        } else { printErrorMessage("Falsche eingabe. Nicht erlaubte Zeichen !"); }        
      }
    }  
    if (myBreak){ break; } 
  }

  printMessage("Ergebnis $points von ${vocabulary.length} richtige - \"${ ((points / 112)*100 ~/ 1) }% richtige.");   
  printMessage("--- Weiter mit Enter oder Leertaste --- ");
  stdin.readByteSync();
  printMenuDE(); 
}

void clearScreen(){ stdout.write("\x1B[2J\x1B[K");	}

