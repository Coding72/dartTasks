void main(){
  int count = 0;

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

  // Variante 2: entries filtern
  // count2 = daten.entries.where((e) => e.value != null).length;

  // Berechne den Durchschnitt der Temperaturen, Niederschlagsmenge und Windgeschwindigkeit
  // count = daten.values.where((v) => v != null).length; 

  double? avgTemp = ((temps[0] ?? 0) + (temps[1] ?? 0)  + (temps[2] ?? 0)) / (temps.where((e) => e != null).length>0 ? temps.where((e) => e != null).length : 1);
  double? avgRain = ((rains[0] ?? 0) + (rains[1] ?? 0)  + (rains[2] ?? 0)) / (rains.where((e) => e != null).length>0 ? rains.where((e) => e != null).length : 1);
  double? avgWind = ((winds[0] ?? 0) + (winds[1] ?? 0)  + (winds[2] ?? 0)) / (winds.where((e) => e != null).length>0 ? winds.where((e) => e != null).length : 1);

  print('Durchschnittstemperatur: $avgTemp');
  print('Durchschnittliche Niederschlagsmenge: $avgRain');
  print('Durchschnittliche Windgeschwindigkeit: $avgWind');

}