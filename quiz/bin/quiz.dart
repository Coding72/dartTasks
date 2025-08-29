//#region [rgba(20,60,90,0.5)]  ===== import =====
  import 'dart:math';
  import 'dart:io';
  import 'dart:async';

  import 'package:dart_console/dart_console.dart';
  //import 'package:quiz/bitquiz.dart' as bitquiz;
//#endregion ===== import =====

//#region [rgba(165,245,205,0.1)] ===== globals =====
  String tab = "    ";  
//#endregion ===== globals =====

/**
 * @todo
 * erweitere fixe 4 bits auf variable anzahl
 * max time global
 * list config
 * lib bit quiz
 * erlaubter zeichensatz 1,2,3 alpha, alphanum, num, + pfeiltasten und enter und evtl. space, (:q! = quit) zeige am anfang(:h = hilfe)
 * 
 * 1. dez in bit dann in hex beides zeigen bits - hex operator  bits - hex
 * operand operator operand
 * 
 * morgansches gesetz maschengesetz 
 */

//#region [rgba(20,60,90,0.5)] ===== Deklaration =====
  enum enumOperatoren {and, or, not, nand, nor, xand, xor, asr, asl, lsr, rr, rl}
  int points = 0;
  Random random = Random();
  final console = Console();
  bool quit = false;  
  int secondsLeft = 0;

//#endregion ===== Deklaration =====

void main(List<String> arguments) {  
  console.clearScreen();

  //Abfrage();
  showHelp();
//beim beenden punkte stand zeigen

// erklärung der operationen
/*
      stdout.write(" "); showPoints(); stdout.write(" Punkte");
        stdout.write("\x1B[32mRichtig\x1B[37m");

  stdout.write("\x1B[31mFalsch\x1B[37m");
  */


  /*
  int number1 = 0; 
  int number2 = 0;
  String bitString1 = number1.toRadixString(2).padLeft(4, '0');
  String bitString2 = number2.toRadixString(2).padLeft(4, '0');
  List<String> lOperatoren1 = lOperatoren.values.toList();
  print(lOperatoren1[3]);

  String operator = "AND"; // zufall aus list dann switch and or not, nand, nor, xor, xand, rotate left, rotate right,arithmetic shift right, arithmetic shift left, logical shift left, logical shift right
  print(bitString1);
 
  print(operator);
  print(bitString2);

  int andO = number1 & number2;
  String andOString1 = andO.toRadixString(2).padLeft(4, '0');
  print(andOString1);
  */

  //print(sTask);


}

void testValues(){

}

void Abfrage(){

  console.writeLine('Drücke 0, 1, Pfeil links oder Pfeil rechts. R für Regeln, H für Help, C für Bildschirm löschen, N für neues Spiel und Beenden mit "q".\n');

  while (!quit){
    if (quit){exit(1);}
    Map<String, String> task = buildTask(); 
    stdout.write(task["task"]); 
    final startTime = DateTime.now(); // Startzeit speichern
    String result = getInput();
    final elapsed = DateTime.now().difference(startTime);
    secondsLeft = 30-elapsed.inSeconds;
    //print(result+" ${task['result']}");

    if (secondsLeft<0){secondsLeft=0;}
   
   points+=(secondsLeft*10);
   String myBadge = "";
    switch (points){     
      case >1200 : myBadge = "Gold";  
      case >1000 : myBadge = "Silber";  
      case >800 : myBadge = "Platin";
      case >600 : myBadge = "Bronze";
      case >400 : myBadge = "Abzeichen";       
      default:
    }

    if (result==task["result"]) { 
      stdout.write("\x1B[32mRichtig\x1B[37m");  stdout.write(" - ${(secondsLeft*10)} Punkte -  ${points}} Gesamtpunkte ($myBadge)\n"); 
    } else {
      stdout.write("\t\x1B[31mFalsch\x1B[37m"); stdout.write(" - Richtig wäre ${task['result']} \n"); 
    }
  }
  //print(result+" ${task['result']}");

/*
 zeige aufgabe  mit erklärung oben 
 0111 and 0111 = ____    _ wird ersetzt durch 0 oder 1 mit pfeiltasten geht man zurück mit enter wird richtig oder falsch in rot oder grün gesetzt evtl. punkte zahl wenn counter geht setze cursor zurück
 cursor maximal 4 nach rechts bei eingabe zum nächste zeichen merke start posxy von der eingabe
   
// funktion baue aufgabe , zeichensatz und ergebenis anzahl der zeichen
*/
// buildTask


}

Map<String, String> buildTask(){//async 
   Map<enumOperatoren, String> lOperatoren = {
    enumOperatoren.and:"and",
    enumOperatoren.or:"or",
    enumOperatoren.not:"not",
    enumOperatoren.nand:"nand",
    enumOperatoren.nor:"nor",
    enumOperatoren.xand:"xand",
    enumOperatoren.xor:"xor",
    enumOperatoren.asr:"arithmetic shift right",
    enumOperatoren.asl:"arithmetic shift left",
    enumOperatoren.lsr:"logical shift right",
    enumOperatoren.rr:"rotate right", 
    enumOperatoren.rl:"rotate left"
  };

  int number1 = random.nextInt(0xF);
  int? number2 = random.nextInt(0xF);
  int result = 0;
  
  int randomIndex = random.nextInt(enumOperatoren.values.length);
  enumOperatoren selectedOperator = enumOperatoren.values[randomIndex];
  //selectedOperator = enumOperatoren.and;
  switch (selectedOperator){
    case enumOperatoren.and : result = number1 & number2; 
    case enumOperatoren.or  : result = number1 | number2;
    case enumOperatoren.xor : result = number1 ^ number2;
    case enumOperatoren.xand : result = number1 & number2;
    case enumOperatoren.not : result = ~number1; number2 = null;
    case enumOperatoren.nand: result = ~(number1 & number2);
    case enumOperatoren.nor : result = ~(number1 | number2);
    case enumOperatoren.asr : result = number1 >> 1; number2 = null;
    case enumOperatoren.asl : result = number1 << 1; number2 = null;
    case enumOperatoren.lsr : result = number1 >>> 1; number2 = null;
    case enumOperatoren.rl : result = (number1 << 1) | (number1 >> (4 - 1)) & ((1 << 4) - 1); number2 = null;
    case enumOperatoren.rr : result = (number1 >> 1) | (number1 << (4 - 1)) & ((1 << 4) - 1); number2 = null;
  }
  return getTask( result, lOperatoren[selectedOperator]??"", number1, number2,); 
  
}

Map<String, String> getTask(int result, String operator, int operand1, [int? operand2]){
  Map<String, String> task= { };
  task["operand1"] = operand1.toRadixString(2).padLeft(4, '0');
  task["operand2"] = operand2!=null ? operand2.toRadixString(2).padLeft(4, '0'):"";
  task["result"] = (result & 0x0F).toRadixString(2).padLeft(4, '0');
  if (task["operand2"]!=""){
    task["task"] = "${task["operand1"]} $operator ${task["operand2"]} = ____";
  } else {
    task["task"] = "$operator ${task["operand1"]} = ____";
  }
  return task;
}

String getInput() {
  int posLimitLeft = 0;
  int posLimitRight = 0;
  int colPos = 0;
  int rowPos = 0;
  List<String> myResult = ["0", "0", "0", "0"];
  int bitResultPos = 0;
  console.showCursor();

  final pos = console.cursorPosition;

  if (pos != null){
  //final newCol = (pos.col - 4) < 1 ? 1 : pos.col - 4;  
    console.cursorPosition = Coordinate(pos.row, pos.col - 4);
    posLimitLeft = pos.col - 4;
    posLimitRight = pos.col;
    rowPos = pos.row;
    colPos =posLimitLeft;
  } 


  while (true) {    
    final key = console.readKey();

    // Beenden
    if (key.char == 'q') {
      quit = true;
      break;
    }    
    // Erlaubte Eingaben prüfen
    if (key.char == '0') {
      if (colPos<posLimitRight) { stdout.write("0"); myResult[bitResultPos]="0"; colPos++; bitResultPos++;}
    } else if (key.char == '1') {
        if (colPos<posLimitRight) { stdout.write("1"); myResult[bitResultPos]="1"; colPos++; bitResultPos++;}
    } else if (key.char == 'h') { showHelp();
    } else if (key.char == 'c') { stdout.write('\x1B[2J\x1B[H');
    } else if (key.char == 'n') { print("new game");// newGame alle Werte gesetten und clearscreen
    } else if (key.char == 'r') { showRules();
    } else if (key.controlChar == ControlCharacter.arrowLeft) {
        final pos = console.cursorPosition;
        if (pos!=null && pos.col>posLimitLeft){ console.cursorPosition = Coordinate(pos.row, pos.col - 1); colPos--; bitResultPos--;}
    } else if (key.controlChar == ControlCharacter.arrowRight) {
        final pos = console.cursorPosition;
        if (pos!=null && pos.col<posLimitRight-1){  console.cursorPosition = Coordinate(pos.row, pos.col + 1); colPos++;bitResultPos++;}
    } else if (key.controlChar == ControlCharacter.backspace) {
    } else if (key.controlChar == ControlCharacter.enter) {
      console.cursorPosition = Coordinate(rowPos, posLimitRight + 1);  
      String sResult = ""; for (int i=0;i<myResult.length;i++){sResult+=myResult[i];}
      return sResult;
    } else {
      // Alles andere ignorieren oder Hinweis ausgeben
      //console.writeLine('Ungültige Eingabe!');
    }
  }
  return "";
}

void showHelp(){
   String help = 
  """
    \x1B[38;5;208mAND: Verknüpft zwei Bits, sodass das Ergebnis 1 ist, wenn beide Eingangsbits 1 sind, sonst 0.
    OR: Verknüpft zwei Bits, sodass das Ergebnis 1 ist, wenn mindestens eines der Eingangsbits 1 ist, sonst 0.
    NOT: Invertiert ein Bit, sodass aus 1 eine 0 und aus 0 eine 1 wird.
    NAND: Verknüpft zwei Bits wie AND, invertiert dann aber das Ergebnis, sodass es 0 ist, wenn beide Eingangsbits 1 sind, sonst 1.
    NOR: Verknüpft zwei Bits wie OR, invertiert dann aber das Ergebnis, sodass es 1 ist, wenn beide Eingangsbits 0 sind, sonst 0.
    XAND: Eine nicht standardisierte Operation, die oft als Gleichheit (gleiche Bits ergeben 1) interpretiert wird, aber in der Praxis selten verwendet wird.
    XOR: Verknüpft zwei Bits, sodass das Ergebnis 1 ist, wenn genau eines der Eingangsbits 1 ist, sonst 0.
    Arithmetic Shift Right: Verschiebt alle Bits nach rechts, wobei das Vorzeichenbit (höchstes Bit) erhalten bleibt und in die neuen Positionen kopiert wird.
    Arithmetic Shift Left: Verschiebt alle Bits nach links, füllt die unteren Positionen mit 0 auf und das Vorzeichenbit kann sich ändern.
    Logical Shift Right: Verschiebt alle Bits nach rechts und füllt die höchsten Positionen mit 0, unabhängig vom Vorzeichen.
    Rotate Right: Verschiebt alle Bits nach rechts, wobei das niederwertigste Bit an die höchste Position rotiert wird.
    Rotate Left: Verschiebt alle Bits nach links, wobei das höchstwertige Bit an die niedrigste Position rotiert wird.
  """;
  print(help);

}

void showRules(){
   String help = 
  """
    Willkommen zum Bit-Operations-Quiz! Hier ist, wie es funktioniert:

    Ziel: Dir werden zwei 4-Bit-Zahlen (z. B. 1010 und 1100) und eine Bit-Operation (wie AND, OR, XOR usw.) angezeigt. Berechne das richtige Ergebnis der Operation in Binärform.
    Zeitlimit: Du hast pro Aufgabe 30 Sekunden Zeit, um die richtige Antwort zu geben.
    Punktevergabe: Für jede richtige Antwort erhältst du die verbleibende Zeit (in Sekunden) multipliziert mit 10 als Punkte. Beispiel: Wenn du in 20 Sekunden antwortest, bekommst du 10 Sekunden × 10 = 100 Punkte.
    Abzeichen/Trophäen: Erreiche bestimmte Punktzahlen, um coole Abzeichen oder Trophäen freizuschalten! Je mehr Punkte, desto bessere Belohnungen.
    Bit-Operationen: Hier eine kurze Übersicht der möglichen Operationen:

    AND: Nur 1, wenn beide Bits 1 sind (z. B. 1010 AND 1100 = 1000).
    OR: 1, wenn mindestens ein Bit 1 ist (z. B. 1010 OR 1100 = 1110).
    NOT: Invertiert ein Bit (z. B. NOT 1010 = 0101).
    NAND: Wie AND, aber Ergebnis wird invertiert.
    NOR: Wie OR, aber Ergebnis wird invertiert.
    XOR: 1, wenn genau ein Bit 1 ist (z. B. 1010 XOR 1100 = 0110).
    Arithmetic Shift Right: Bits nach rechts verschieben, Vorzeichenbit bleibt.
    Arithmetic Shift Left: Bits nach links verschieben, 0 wird eingefügt.
    Logical Shift Right: Bits nach rechts verschieben, 0 wird oben eingefügt.
    Rotate Right: Bits nach rechts verschieben, niedrigstes Bit rotiert nach oben.
    Rotate Left: Bits nach links verschieben, höchstes Bit rotiert nach unten.


    Tipp: Übe die Bit-Operationen, um schneller zu werden, und achte auf die Zeit, um mehr Punkte zu sammeln!

    Viel Spaß und viel Erfolg beim Quiz!
  """;
  print(help);

}
