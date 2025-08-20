
### Vorlesung

``` Dart
main(){
  String? user = 'Lea';
  user = null;
  String name = user ?? 'Gast';
  //print (name);
  
  // wert1 ?? wert2
  // Wird zu wert1, falls er nicht null ist. Ansonsten zu wert2.

  // variable ??= Wert
  // Wird wer1 nur zugewiesen, falls er nicht nul ist
 
  String? name1 = null; // == String? name1;

  name1 ??= 'Gast';

  String? name3; //mit ? wird name3 null zugewiesen, ohne ? kann name3 kein null annehmen
  //String name2 = "Test" + name3!; // führt zum compilerfehler
 // print (name31!);// dem compiler wird gesagt -> garantiert kein null, aber dann doch -> crash

  //ternär-operator
  //true?true:false condition?ausgabe-true:ausgabe-false

  // nullcheck, nullchecking
  // null safety

  print("adsf" + (name3 ?? "x")); print(name3);  // name3 kein bangoperator da ?? auf null prüft
  print("adsf" + (name3 ??= "x")); print(name3);

  int? test;
  


 //!bang-Operator
 //nullableVariable!

 //String? name ....

 // unsauberes coding, besser gleich richtig deklarieren und initialisierten und mit bedingungen arbeiten.
  
  
}

```

## Task 3.4.3

### Aufgabe 1

``` Dart
void main(){
  // Liste hat garantiert immer 3 Elemente
  List<Map<String, double?>> weatherData = [
    {'temp': 5.3, 'rain': 0.9, 'wind': null},
    {'temp': 4.5, 'rain': null, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': null}
  ];

  // Erstelle leere Liste für Temperaturen, Niederschlagsmenge und Windgeschwindigkeit
  List<double?> temps = [];
  List<double?> rains = [];
  List<double?> winds = [];

  // Füge die Temperaturen, Temperaturen, Niederschlagsmenge und Windgeschwindigkeit der Wetterdaten in die Liste ein
  temps.add(weatherData[0]['temp']);  temps.add(weatherData[1]['temp']); temps.add(weatherData[2]['temp']);
  rains.add(weatherData[0]['rain']);  rains.add(weatherData[1]['rain']); rains.add(weatherData[2]['rain']);
  winds.add(weatherData[0]['wind']);  winds.add(weatherData[1]['wind']); winds.add(weatherData[2]['wind']);


  // Berechne den Durchschnitt der Temperaturen, Niederschlagsmenge und Windgeschwindigkeit
  double? avgTemp = ((temps[0] ?? 0) + (temps[1] ?? 0)  + (temps[2] ?? 0)) / 3;
  double? avgRain = ((rains[0] ?? 0) + (rains[1] ?? 0)  + (rains[2] ?? 0)) / 3;
  double? avgWind = ((winds[0] ?? 0) + (winds[1] ?? 0)  + (winds[2] ?? 0)) / 3;

  print('Durchschnittstemperatur: $avgTemp');
  print('Durchschnittliche Niederschlagsmenge: $avgRain');
  print('Durchschnittliche Windgeschwindigkeit: $avgWind');

}
```

### Bonus Aufgabe 1

``` Dart
void main(){
  // Liste hat garantiert immer 3 elemente
  List<Map<String, double?>> weatherData = [
    {'temp': 5.3, 'rain': 0.9, 'wind': null},
    {'temp': 4.5, 'rain': null, 'wind': 16.8},
    {'temp': null, 'rain': 3.8, 'wind': null}
  ];

  double? x =  weatherData[2]['temp'] ?? (weatherData[0]['temp'] ?? ((4.5 >= (weatherData[1]['temp']??0))?(weatherData[1]['temp']??0):(weatherData[1]['wind']??0))); 
  print(x);  

  weatherData[0]['temp'] = null;
  x =  weatherData[2]['temp'] ?? (weatherData[0]['temp'] ?? ((4.5 >= (weatherData[1]['temp']??0))?(weatherData[1]['temp']??0):(weatherData[1]['wind']??0)));
  print(x);

  weatherData[1]['temp'] = 4.6;
  x =  weatherData[2]['temp'] ?? (weatherData[0]['temp'] ?? ((4.5 >= (weatherData[1]['temp']??0))?(weatherData[1]['temp']??0):(weatherData[1]['wind']??0)));
  print(x);

}
```

