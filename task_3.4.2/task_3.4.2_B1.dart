void main(List<String> arguments) {
  double orderValue = 0; //(Bestellwert in Euro als Dezimalzahl)
  double sum = 0; // Endsumme
  double distance = 0; // (Entfernung in km als Dezimalzahl) 
  bool rushHour = false; // (Boolean für Hauptverkehrszeit)
  bool isRaining = false; // (Boolean für aktuelles Regenwetter)
  int orderSize = 0; // (Anzahl der Artikel als Ganzzahl)  
  // -----------------------
  double Lieferkosten = 0;
  double Mengenrabatt = 0;
  double Mindestzuschlag = 0;
  // ---- testdaten --------
  orderValue=18.5; distance=4.2; rushHour=false; isRaining=false; orderSize=2;
  //orderValue=55.9; distance=8.8; rushHour=true; isRaining=true; orderSize=6;
  //orderValue=12.4; distance=11.2; rushHour=false; isRaining=false; orderSize=1;

  //  Grundliefergebühr
  if (distance <= 5){
    print("Günstige Lieferung");
    Lieferkosten = 2.5;
  } else if (distance > 5 && distance<=10){ 
    print("Standardlieferung");
    Lieferkosten = 3.5;
  } else if (distance>10){
    print("Premium-Lieferung");
    Lieferkosten = 5.0;
  }

  // Distanzzuschlag
  if (distance > 5){ 
    if (distance % 1 == 0) {
      Lieferkosten = Lieferkosten + (distance - 5 - (distance % 1)) * 0.3;
    } else {
      Lieferkosten = Lieferkosten + (distance - 5 - (distance % 1) + 1) * 0.3; // +1 für den angefahrenen KM
    }
  }

  // Wetterzuschlag bei Regen
  if (isRaining == true){
    Lieferkosten = Lieferkosten + 1.5;
  }

  // Hauptverkehrszeitzuschlag
  if (rushHour == true){
    Lieferkosten = Lieferkosten + 2;
  }

  // Mengenrabatt
  if (orderSize >= 3){
    Mengenrabatt = orderValue -.5;
  } else if (orderSize > 5) {
    Mengenrabatt = orderValue -1;
  } else if (orderSize > 8) {
    Mengenrabatt = orderValue -2;
  }

  // Mindestbestellwert
  if ((orderValue * orderSize) < 15){
    Mindestzuschlag = 5;
  }

  // Maximalkosten-Regel
  if ((Lieferkosten * 0.4) > orderValue) {
    print("Die Lieferkosten dürfen nie mehr als 40% des Bestellwerts betragen");
  } else {
    sum = (orderValue) + Mindestzuschlag - Mengenrabatt + Lieferkosten;

    // Aufrunden auf volle 10 Cent
    sum = sum * 10;    

    double y=0;
    if (sum % 1 == 0) {
      y = y + (sum - (sum % 1));
    } else {
      y =y + (sum - (sum % 1) + 1); // +1 für den angefahrenen KM
    }
    sum = y / 10;
    String sLieferkosten = Lieferkosten.toStringAsFixed(2);
    print("Die Lieferkosten betragen: $sLieferkosten€");

  }
 
}

