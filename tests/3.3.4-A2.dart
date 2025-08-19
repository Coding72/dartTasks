void main(){

  List<List<List<Map<String, int>>>> myList = [
    [
      [
        {"Alpha": 24},
      ],
      [
        {"Beta": 25},
      ],
    ],
    [
      [ 
        {"Alpha": 34},
      ],
      [
        {"Beta": 35},
      ],
    ],
    [
      [
        {"Alpha": 44},
      ],
      [
        {"Beta": 45},
      ],
    ],
    [
      [
        {"Alpha": 54},
      ],
      [
        {"Beta": 55},
      ],
    ],
    [
      [
        {"Alpha": 64},
      ],
      [
        {"Beta": 65},
      ],
    ],
  ];

  /**

    Das Ausrufungszeichen (!) in Dart wird als Null-Sicherheitsoperator verwendet, um anzugeben, dass ein Wert nicht null sein sollte. 
    In dem Beispiel, das ich dir gegeben habe, wird es verwendet, um sicherzustellen, dass der Wert für "Beta" nicht null ist, falls "Alpha" nicht vorhanden ist.

      Null-Koaleszenz-Operator (??): Dieser Operator gibt den linken Wert zurück, wenn er nicht null ist. Andernfalls gibt er den rechten Wert zurück. 
      In diesem Fall wird zuerst versucht, den Wert von "Alpha" zu erhalten. Wenn "Alpha" jedoch nicht existiert (also null ist), wird der Wert von "Beta" zurückgegeben.

      Ausrufungszeichen (!): Dieses Zeichen wird verwendet, um dem Compiler zu sagen, dass du sicher bist, dass der Wert nicht null ist. 
      In dem Beispiel wird es verwendet, um sicherzustellen, dass der Wert von "Beta" existiert, wenn "Alpha" nicht vorhanden ist. 
      Es ist eine Möglichkeit, dem Compiler zu signalisieren, dass du die Verantwortung für die Null-Sicherheit übernimmst.
  */

  int result1 = (myList[0][0][0]['Alpha'] ?? 0) + (myList[3][0][0]['Alpha'] ?? 0) - ((myList[0][1][0]['Beta'] ?? 0) - (myList[0][0][0]['Alpha'] ?? 0));

  print (result1);

  int? alphaValue = myList[0][0][0]['Alpha'];
  int? betaValue = myList[0][1][0]['Beta'];
  if (alphaValue != null && betaValue != null) {
    int result2 = alphaValue + myList[3][0][0]['Alpha']! - (betaValue - alphaValue);
    print(result2);
  }

  late int alphaValue2 = myList[0][0][0]['Alpha']!;
  int result3 = alphaValue2 + myList[3][0][0]['Alpha']! - (myList[0][1][0]['Beta']! - alphaValue2);
  print(result3);

  int value1 = myList[0][0][0]['Alpha']!;
  int value2 = myList[3][0][0]['Alpha']!;
  int value3 = myList[0][1][0]['Beta']!;

  int result4 = value1 + value2 - (value3 - value1);
  print(result4);

  int result5 = myList[0][0][0]['Alpha']! + myList[3][0][0]['Alpha']! - (myList[0][1][0]['Beta']! - myList[0][0][0]['Alpha']!);
  
  print(result5); 

}

