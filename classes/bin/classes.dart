import 'package:classes/classes.dart';

void main(List<String> arguments) {

  Button b = Button(
    'In den Warenkorb',
    width: 96,
    height: 32,
    radius: 4,
    fontSize: 14,
    padding: 8
  );

  Rectangle rectangle;
  rectangle = Rectangle(xLength:2, yLength:3);

  print("Fläche: ${rectangle.area()}");
  print("Umfange: ${rectangle.perimeter()}");

  rectangle.xLength = 10;
  print("Fläche: ${rectangle.area()}");
  print("Umfange: ${rectangle.perimeter()}");

  rectangle.scale(0.5);
  print("Fläche: ${rectangle.area()}");
  print("Umfange: ${rectangle.perimeter()}");

  rectangle.scale(2);
  print("Fläche: ${rectangle.area()}");
  print("Umfange: ${rectangle.perimeter()}");

  Autor autor = Autor("");

  Buch buch = Buch(autor, 0, "");

  autor.name = "Ralph";

  buch.titel = "Classes in Dart & Flutter";
  buch.seitenzahl = 112;
  //buch.autor.name = "Ralph";
  
  print("Der Titel des Buches ist ${buch.titel}.");
  print("Die Seitenzahl des Buches ist ${buch.seitenzahl}.");
  print("Der Name des Autors ist ${buch.autor.name}.");

}
