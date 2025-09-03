class Button {
  String text = "";
  int width = 0;
  int height = 0;
  int radius = 0;
  int fontSize = 14;
  int padding = 8;

  Button(this.text, {required this.width, required this.height, this.radius=0, this.fontSize=10, this.padding=2});
}

class Rectangle {
  int xLength = 0;
  int yLength = 0;

  Rectangle({required this.xLength, required this.yLength});

  int perimeter(){
    return (2*xLength+2*yLength);
  }

  int area(){ 
    return (xLength*yLength);
  }

  void scale(double factor){
    xLength = (xLength*factor).toInt();
    yLength = (yLength*factor).toInt();
  }

}

class Autor {
  String name = "";
  int geburtsjahr = 0; 

  Autor(this.name, [geburtsjahr=0]);
}

class Buch {
  String titel = "";
  int seitenzahl = 0;
  Autor autor = Autor("");

  Buch(this.autor, this.seitenzahl, this.titel);
}

