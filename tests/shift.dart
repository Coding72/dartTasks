/**
  @Links:
    https://coderscratchpad.com/dart-bitwise-operators/#Left_Shift
    https://dart.dev/language/operators#bitwise-and-shift-operators
    https://pub.dev/packages/binary
 */ 

void main() {
  print("=== SCHNELLE MULTIPLIKATION/DIVISION ===");
  int zahl = 15;
  print("$zahl << 1 = ${zahl << 1}  // * 2 = ${zahl * 2}");
  print("$zahl << 3 = ${zahl << 3}  // * 8 = ${zahl * 8}");
  print("${zahl * 4} >> 2 = ${(zahl * 4) >> 2}  // / 4 = ${(zahl * 4) / 4}");
  
  print("\n=== BIT-FLAGS VERWALTEN ===");
  // Berechtigungen als Bits speichern
  const int READ = 1;      // 001
  const int WRITE = 2;     // 010  
  const int EXECUTE = 4;   // 100
  
  int permissions = 0;
  
  // Berechtigung hinzufügen
  permissions |= READ;
  permissions |= WRITE;
  print("Nach READ+WRITE: ${permissions.toRadixString(2).padLeft(3, '0')}");
  
  // Berechtigung prüfen
  bool canRead = (permissions & READ) != 0;
  bool canExecute = (permissions & EXECUTE) != 0;
  print("Kann lesen: $canRead, Kann ausführen: $canExecute");
  
  // Berechtigung entfernen
  permissions &= ~WRITE;  // WRITE-Bit löschen
  print("Nach WRITE entfernen: ${permissions.toRadixString(2).padLeft(3, '0')}");
  
  print("\n=== FARB-MANIPULATION (RGB) ===");
  int farbe = 0xFF5733; // Orange in Hex
  
  // RGB-Komponenten extrahieren
  int rot = (farbe >> 16) & 0xFF;
  int gruen = (farbe >> 8) & 0xFF;
  int blau = farbe & 0xFF;
  
  print("Farbe: #${farbe.toRadixString(16).toUpperCase()}");
  print("Rot: $rot, Grün: $gruen, Blau: $blau");
  
  // Neue Farbe zusammensetzen
  int neueFarbe = (rot << 16) | (gruen << 8) | blau;
  print("Rekonstruiert: #${neueFarbe.toRadixString(16).toUpperCase()}");
  
  print("\n=== HASH-FUNKTIONEN OPTIMIEREN ===");
  String text = "Hallo";
  int hash = simpleHash(text);
  print("Hash von '$text': $hash");
  
  print("\n=== BIT-PACKING FÜR SPEICHER-EFFIZIENZ ===");
  // 4 Werte (0-15) in einem int speichern
  int packed = packValues(12, 7, 3, 15);
  print("Gepackt: ${packed.toRadixString(2).padLeft(16, '0')}");
  
  List<int> unpacked = unpackValues(packed);
  print("Entpackt: $unpacked");
  
  print("\n=== ZIRKULÄRE ROTATION ===");
  int wert = int.parse('11010000', radix: 2);
  // int wert = 0b11010000; // 208
  print("Original:      ${wert.toRadixString(2).padLeft(8, '0')}");
  print("Links rotate:  ${rotateLeft(wert, 3).toRadixString(2).padLeft(8, '0')}");
  print("Rechts rotate: ${rotateRight(wert, 3).toRadixString(2).padLeft(8, '0')}");
}

// Einfache Hash-Funktion mit Shifts
int simpleHash(String text) {
  int hash = 0;
  for (int i = 0; i < text.length; i++) {
    hash = ((hash << 5) - hash) + text.codeUnitAt(i);
    hash = hash & 0xFFFFFFFF; // 32-bit begrenzen
  }
  return hash;
}

// 4 Nibbles (4-bit Werte) in einem int packen
int packValues(int a, int b, int c, int d) {
  return (a << 12) | (b << 8) | (c << 4) | d;
}

// 4 gepackte Nibbles extrahieren
List<int> unpackValues(int packed) {
  return [
    (packed >> 12) & 0xF,
    (packed >> 8) & 0xF,
    (packed >> 4) & 0xF,
    packed & 0xF
  ];
}

// Zirkuläre Bit-Rotation (8-bit)
int rotateLeft(int value, int positions) {
  value &= 0xFF;
  return ((value << positions) | (value >> (8 - positions))) & 0xFF;
}

int rotateRight(int value, int positions) {
  value &= 0xFF;
  return ((value >> positions) | (value << (8 - positions))) & 0xFF;
}