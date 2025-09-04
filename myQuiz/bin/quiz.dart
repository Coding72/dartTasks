//#region [rgba(20,60,90,0.5)]  ===== import =====
  import 'dart:async';
  import 'dart:io';
  import 'dart:isolate';
  import 'dart:math';

  import 'package:dart_console/dart_console.dart';
//#endregion ===== import =====

//#region [rgba(20,60,90,0.5)]  ===== globals =====
  enum enumOperatoren {and, or, not, nand, nor, xand, xor, asr, asl, lsr, rr, rl}
  enum Color {Black, Red, Green, Yellow, Blue, LightBlue, Magenta, Cyan, White, Default, Reset}

  int maxtime = 30; //dieser default in den task
  int timeout = maxtime;  
  int cursorPosX = 0;
  int cursorPosY = 0;
  int inputcursorposx = 0;
  int maxInputLength = 0;
  int TimerPosX = 0;
  int TimerPosY = 0;
  int points = 0;
  bool blockinput = false;
  
  Map<Color,String> fontColor = { Color.Black:"30", Color.Red:"31", Color.Green:"32", Color.Yellow:"33", Color.Blue:"34", Color.LightBlue:"38;2;150;180;250", Color.Magenta:"35", Color.Cyan:"36", Color.White:"37", Color.Default:"39", Color.Reset:"0" };
  /*Map<Color,String> backColor = { Color.Black:"40", Color.Red:"41", Color.Green:"42", Color.Yellow:"43", Color.Blue:"44", Color.Magenta:"45", Color.Cyan:"46", Color.White:"47", Color.Default:"49", Color.Reset:"0" };
  Map<String,String> charsets = {"alphanum":"A-Za-z0-9öüäßÖÜÄ", "alpha":"A-Za-zöüäßÖÜÄ", "num": "0-9", "bit":"0-1"};
  Map<String,String> result = {"charset":"", "result":""}; //zähle später beim input die zeichen baue task neu
  List<Map<String,String>> results = [result]; 
  //Map<String,dynamic> task = {"task":"", "results":result};
  List<Map<String,dynamic>> tasks = [task];*/

  Map<String, String> task = {};
  List<String> myResult = [];

  Random random = Random();
  StreamSubscription<ProcessSignal>? subscription;
  Timer? timer_01; bool stopTimer_01 = false;
  Timer? timer_02; bool stopTimer_02 = false;
  final receivePort = ReceivePort();
  final console = Console();
//#endregion ===== globals =====

void main() async {
  showRules(); showHelp(); 
  reset();  
  startNewTask();
  
  startTimer();
  handleInput();
}

void startNewTask(){
  cursorPosX=0; cursorPosY++; TimerPosY++;
  task = buildTask();
  writeChar((task["task"]??""));
  setCursor();
  stopTimer_01=false;  
  maxInputLength = (task["result"]??"").length;
  inputcursorposx = (task["task"]??"").length-maxInputLength+1;
  cursorPosX=inputcursorposx;
  blockinput=false;  
  timeout=maxtime;
  stdout.write("\x1B[?25l"); //Cursor unsichtbar machen
  writeAt(TimerPosX, TimerPosY, "Zeit: ");
  writeAt(TimerPosX+6, TimerPosY, "$timeout");
  setCursor();
}

void addPoints(int p){  
  writeAt(TimerPosX+13, TimerPosY, "Punkte: ", Color.LightBlue);
  blockinput = true;
  int sum = points+p;
  if (sum<0){sum=0;}
  timer_02 = Timer.periodic(Duration(milliseconds: 1), (Timer t) {     
    if (p>=0){   
      if (points > sum) { 
        points-=10;
        if (points<0){points=0;}
        writeAt(TimerPosX+20, TimerPosY, "${points}", Color.LightBlue); checkBadge();
      } else {
        points = sum;
        writeAt(TimerPosX+20, TimerPosY, "${points}", Color.LightBlue); checkBadge();
        blockinput = true; t.cancel(); startNewTask(); // startNewTask();
      }
    }else{
      if (points < sum) { 
        points+=10;
        writeAt(TimerPosX+20, TimerPosY, "${points}", Color.LightBlue); checkBadge();
      } else {
        points = sum;
        writeAt(TimerPosX+20, TimerPosY, "${points}", Color.LightBlue); checkBadge();
        blockinput = true;  t.cancel(); startNewTask();//startNewTask(); 
      }
    }    
  }); 
   
}

void testValues(){
  task = buildTask();
  writeChar((task["task"]??""));
  maxInputLength = (task["result"]??"").length; 
  inputcursorposx = (task["task"]??"").length-maxInputLength+1; 
  cursorPosX=inputcursorposx;
  setCursor();
  myResult=["0", "1", "0", "1"];
  task["result"]="0101";
  //checkResult();
}

Map<String, String> buildTask(){

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
    Map<String, String> getTask(int result, String operator, int operand1, [int? operand2]){
    Map<String, String> task= { };
    task["operand1"] = operand1.toRadixString(2).padLeft(4, '0');
    task["operand2"] = operand2!=null ? operand2.toRadixString(2).padLeft(4, '0'):"";
    task["result"] = (result & 0x0F).toRadixString(2).padLeft(4, '0');
    task["operator"] = operator;
    if (task["operand2"]!=""){
      task["task"] = "${task["operand1"]} $operator ${task["operand2"]} = ____";
    } else {
      task["task"] = "$operator ${task["operand1"]} = ____";
    }
    return task;
  }

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

  Map<String, String> task = getTask( result, lOperatoren[selectedOperator]??"", number1, number2,); 

  //result = {"pos": "1", "charset":charsets["alpha"]??"", "result": "ECMA"}; results.add(result);
  //result = {"pos": "2", "charset":charsets["alpha"]??"", "result": "JavaScript"}; results.add(result);  
  //task = {"task": "Dart ist eine _1-standardisierte Programmiersprache, die hauptsächlich vom Unternehmen Google entwickelt wird. Die Sprache wurde als generelle Vielzweck-Programmiersprache entworfen, die insbesondere eine moderne Alternative zu JavaScript zur Verwendung in Webbrowsern darstellen soll. Dabei soll Dart einige grundsätzliche Probleme von _2 überwinden, die sich nach Ansicht der Entwickler von Dart nicht durch eine Weiterentwicklung von JavaScript beheben ließen.", "results": results};
  return task;      
}

void checkBadge(){
  String myBadge = "";
  switch (points){
    case >1200 : myBadge = "Gold";
    case >1000 : myBadge = "Silber";  
    case >800 : myBadge = "Platin";
    case >600 : myBadge = "Bronze";
    case >400 : myBadge = "Abzeichen";   
    default:
  }
   writeAt(TimerPosX+33, TimerPosY, "                  ");
  if (myBadge.length>0){ writeAt(TimerPosX+33, TimerPosY, "(${myBadge})", Color.Yellow); }
  if ( myBadge == "Gold"){ showEndScreen();}
}

void showEndScreen(){
  stdout.writeln("");
  stdout.writeln("");
  stdout.writeln("---------------------");
  stdout.writeln("Das Quiz ist beendet.");
  stdout.writeln("---------------------");
  exit(1);
}

void handleInput() async {
  myResult =[];
  void writeMyResult(String input){
    int pos = cursorPosX-inputcursorposx;
    while(myResult.length<=pos){myResult.add("");}
    myResult[pos]=input;    
    //writeAt(10, 10, "${myResult}");
  }

  await Isolate.spawn(readInput, receivePort.sendPort);
  // Warte auf die Eingabe vom Isolat  
  await for (var message in receivePort) { 

    if (message.char == 'q') { exit(1); } //quit = true; break;

    // Erlaubte Eingaben prüfen
    if (!blockinput) {
      if (message.char == '0') {    
        if (cursorPosX<inputcursorposx+maxInputLength){writeMyResult("0");writeChar("0");cursorPosX++;setCursor();}       
      } else if (message.char == '1') {
        if (cursorPosX<inputcursorposx+maxInputLength){writeMyResult("1");writeChar("1");cursorPosX++;setCursor();}        
      } else if (message.char == 'h') { //showHelp();
      } else if (message.controlChar == ControlCharacter.ctrlC) { exit(1);
      } else if (message.controlChar == ControlCharacter.ctrlN) { print("new game");// newGame alle Werte gesetten und clearscreen
      } else if (message.controlChar == ControlCharacter.ctrlR) { print("rules");//showRules();
      } else if (message.controlChar == ControlCharacter.ctrlQ) { // print("quit"); functioniert hier nicht
      } else if (message.controlChar == ControlCharacter.arrowLeft) {
        if (cursorPosX>inputcursorposx){cursorPosX--;setCursor();}
      } else if (message.controlChar == ControlCharacter.arrowRight) {  
        if (cursorPosX<inputcursorposx+maxInputLength-1){cursorPosX++;setCursor();}      
      } else if (message.controlChar == ControlCharacter.arrowUp) {
      } else if (message.controlChar == ControlCharacter.arrowDown) {  
      } else if (message.controlChar == ControlCharacter.backspace) {
        if (cursorPosX>inputcursorposx){cursorPosX--;writeChar("_");setCursor();}
      } else if (message.controlChar == ControlCharacter.enter) {   
        if (timer_01 != null) { stopTimer_01 = true; }
        checkResult();
      } else {}
    }
  }
}

void setCursor(){writeAt(cursorPosX, cursorPosY);}

void printTask(){
  // anzeigen des tasks setzen timerpos und setze timeout auf maxtime
}

void checkResult(){
  writeAt(TimerPosX, TimerPosY, "                                ");
  if (myResult.join()==task["result"]){
    writeAt(TimerPosX, TimerPosY, "richtig", Color.Green); addPoints(timeout*10);   
  } else {
    writeAt(TimerPosX, TimerPosY, "falsch ", Color.Red); if (timeout>0){addPoints( (maxtime-timeout)*-10);} else {timeout*10;}
  }
}

void handleTimer_01(){
  if (timeout>-maxtime){timeout--;}else{
    checkResult();
  }
  stdout.write("\x1B[?25l"); //Cursor unsichtbar machen
  writeAt(TimerPosX+6, TimerPosY, "$timeout");
  stdout.write("\x1B[?25h"); //Cursor sichtbar machen
  setCursor();
}

void startTimer(){
    timer_01 = Timer.periodic(Duration(seconds: 1), (Timer t) {
    if (stopTimer_01){t.cancel();} else { handleTimer_01(); }
  });
}

void writeAt(int posX, int posY, [String text="", Color fc = Color.Reset,]){ // color optional und default 
  stdout.write("\x1B[${fontColor[fc]}m\x1B[1m\x1B[${posY};${posX}H${text}");  
  fc = Color.Reset;
  stdout.write("\x1B[${fontColor[fc]}m\x1B[1m");
}

void writeChar(String char){ writeAt(cursorPosX, cursorPosY, char); }

void reset(){
  cursorPosX = 0;
  cursorPosY = 2;   
  TimerPosX = 36;
  TimerPosY = 2;
  timeout = maxtime;
  stdout.write("\x1B[2J"); // Bildschirm löschen 
  stdout.write("\x1B[=19h");
}

void readInput(SendPort sendPort) {
  while (true) {    
    final key = console.readKey();
    sendPort.send(key);
  }  
}

void showHelp(){  
  String help = 
  """
  AND                    Verknüpft zwei Bits, sodass das Ergebnis 1 ist, wenn beide Eingangsbits 1 sind, sonst 0.
  OR                     Verknüpft zwei Bits, sodass das Ergebnis 1 ist, wenn mindestens eines der Eingangsbits 1 ist, sonst 0.
  NOT                    Invertiert ein Bit, sodass aus 1 eine 0 und aus 0 eine 1 wird.
  NAND                   Verknüpft zwei Bits wie AND, invertiert dann aber das Ergebnis, sodass es 0 ist, wenn beide Eingangsbits 1 sind, sonst 1.
  NOR                    Verknüpft zwei Bits wie OR, invertiert dann aber das Ergebnis, sodass es 1 ist, wenn beide Eingangsbits 0 sind, sonst 0.
  XAND                   Eine nicht standardisierte Operation, die oft als Gleichheit (gleiche Bits ergeben 1) interpretiert wird, aber in der Praxis selten verwendet wird.
  XOR                    Verknüpft zwei Bits, sodass das Ergebnis 1 ist, wenn genau eines der Eingangsbits 1 ist, sonst 0.
  Arithmetic Shift Right Verschiebt alle Bits nach rechts, wobei das Vorzeichenbit (höchstes Bit) erhalten bleibt und in die neuen Positionen kopiert wird.
  Arithmetic Shift Left  Verschiebt alle Bits nach links, füllt die unteren Positionen mit 0 auf und das Vorzeichenbit kann sich ändern.
  Logical Shift Right    Verschiebt alle Bits nach rechts und füllt die höchsten Positionen mit 0, unabhängig vom Vorzeichen.
  Rotate Right           Verschiebt alle Bits nach rechts, wobei das niederwertigste Bit an die höchste Position rotiert wird.
  Rotate Left            Verschiebt alle Bits nach links, wobei das höchstwertige Bit an die niedrigste Position rotiert wird.

  Drücke (q) um zu beenden
  ( --- Starten mit Enter oder Leertaste --- )
  """;
  console.clearScreen();
  writeAt(0,0, help); // set fontcolor white
  while (true) {    
    final key = console.readKey(); 
    if (key.char == "q") { exit(1); }
    if (key.char == " ") { break; }
    if (key.controlChar == ControlCharacter.enter){ break; }
  }
}

void showRules(){
  String rules = 
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

    Drücke (q) um zu beenden
    ( --- Weiter mit Enter oder Leertaste --- )
  """;
  console.clearScreen();
  writeAt(0,0, rules); // set fontcolor white
  while (true) {    
    final key = console.readKey(); 
    if (key.char == "q") { exit(1); }
    if (key.char == " ") { break; }
    if (key.controlChar == ControlCharacter.enter){ break; }
  }
  
}