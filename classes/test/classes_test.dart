import 'package:classes/classes.dart';
import 'package:test/test.dart';

// extend test package

void main() {
  //testButton();
  //testRectangle();
  testBuch();
}

void testButton(){
  test('Button attributes test', () {

    Button button = Button('In den Warenkorb', width: 100, height: 50);

    expect(button.text, 'In den Warenkorb'); 
    expect(button.width, 100); 
    expect(button.height, 50);
    expect(button.radius, 0);
    expect(button.fontSize, 10);
    expect(button.padding, 2);
  });
}

void testRectangle(){   
  group('Rectangle tests', () {
    test('Calculate perimeter', () {
      Rectangle rectangle = Rectangle(xLength: 5, yLength: 10);
      expect(rectangle.perimeter(), 30);
    });

    test('Calculate area', () {
      Rectangle rectangle = Rectangle(xLength: 5, yLength: 10);
      expect(rectangle.area(), 50);
    });

    test('Scale rectangle dimensions', () {
      Rectangle rectangle = Rectangle(xLength: 4, yLength: 6);
      rectangle.scale(2.5);

      expect(rectangle.xLength, 10);
      expect(rectangle.yLength, 15);
    });

    test('Scale rectangle dimensions with rounding', () {
      Rectangle rectangle = Rectangle(xLength: 3, yLength: 7);
      rectangle.scale(1.5); 

      expect(rectangle.xLength, 4);
      expect(rectangle.yLength, 10);
    });
  });
}

void testBuch(){
  group('Autor tests', () {
    test('Autor initialisieren', () {
      Autor autor = Autor('Max Mustermann', 1980);
      expect(autor.name, 'Max Mustermann'); // Erwartung: name sollte 'Max Mustermann' sein
      expect(autor.geburtsjahr, 1980);       // Erwartung: geburtsjahr sollte 1980 sein
    });

    test('Autor ohne Geburtsjahr initialisieren', () {
      Autor autor = Autor('Anna Müller');
      expect(autor.name, 'Anna Müller'); // Erwartung: name sollte 'Anna Müller' sein
      expect(autor.geburtsjahr, 0);       // Erwartung: geburtsjahr sollte 0 sein (Standardwert)
    });
  });

  group('Buch tests', () {
    test('Buch initialisieren', () {
      Autor autor = Autor('Max Mustermann', 1980);
      Buch buch = Buch(autor, 300, 'Dart für Einsteiger');

      expect(buch.titel, 'Dart für Einsteiger'); // Erwartung: titel sollte 'Dart für Einsteiger' sein
      expect(buch.seitenzahl, 300);              // Erwartung: seitenzahl sollte 300 sein
      expect(buch.autor.name, 'Max Mustermann'); // Erwartung: autor.name sollte 'Max Mustermann' sein
      expect(buch.autor.geburtsjahr, 1980);      // Erwartung: autor.geburtsjahr sollte 1980 sein
    });
  });
}
