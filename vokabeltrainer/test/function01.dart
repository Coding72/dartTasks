//#region [rgba(165,245,205,0.1)] ===== imports =====
  import 'dart:async';
  import "dart:io";
//#endregion ===== imports =====
/*
class Color {
  static const Color white = Color._('white');
  static const Color green = Color._('green');
  
  final String name;
  
  const Color._(this.name);
  
  @override
  String toString() => name;
}
*/

  enum Color {black, red, green, yellow, blue, lightBlue, magenta, cyan, white, _default, reset}
  Map<Color,String> fontColor = { Color.black:"30", Color.red:"31", Color.green:"32", Color.yellow:"33", Color.blue:"34", Color.lightBlue:"38;2;150;180;250", Color.magenta:"35", Color.cyan:"36", Color.white:"37", Color._default:"39", Color.reset:"0" };


void printMessage(String msg, {int duration = 5, Color fc = Color.white}) {
  // Nachricht ausgeben
  print('Nachricht: $msg, Farbe: $fc, Dauer: $duration Sekunden');

  // Verzögerung von 'duration' Sekunden
  Future.delayed(Duration(seconds: duration), () {
    // Cursor zurücksetzen und die Zeile löschen
    stdout.write('\x1B[1A\x1B[2K'); // Cursor nach oben und Zeile löschen
  });
}

void main() {
  // Aufruf mit nur dem optionalen Parameter für die Farbe
  printMessage("Dies ist eine Testnachricht", fc: Color.green);
}
