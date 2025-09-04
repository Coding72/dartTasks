// Aufgabe 1

enum DriveType { hand, electro, petrol }

class Tool {  
  DriveType drivetype;
  String brand = "";
  DateTime? warranty; 
  int age = 0;

  Tool(this.drivetype, [this.brand="noname", warranty, age]);
}

class ApplePicker extends Tool {
  double length = 0;
  bool teleskop = false;
  //DriveType drivetype = DriveType.hand;

  ApplePicker(this.length, this.teleskop, super.drivetype);
}

class Trimmer extends Tool {

  Trimmer(super.drivetype);
}

class Grocery {
  String name ="";
  String manufacturer = "";
  double weight = 0;
  double price = 0;

  Grocery({this.name="", this.manufacturer="", this.weight=0, this.price=0});

  void setName(String name){ 
    this.name = name;
  }

  String getName(){ 
    return name; 
  }

  String backen([String action=""]){
    return action;
  }

}

// Aufgabe 2

class Milch extends Grocery {

  Milch({super.name="", super.manufacturer="", super.weight=0, super.price=0}){ print("Rezept lesen");}

  @override
  void setName(String name){ this.name = name; }

  @override
  String backen([String action="hinzugeben"]){
    print( super.backen("Milch hinzugeben") );
    return "";
  }

}

class Butter extends Grocery {

  Butter({super.name="", super.manufacturer="", super.weight=0, super.price=0});

  @override
  void setName(String name){ this.name = name; }

  @override
  String backen([String action="schmelzen"]){ 
    print("Butter schmelzen");
    return "";
  }
}

class GeschmolzeneButter extends Butter {

  GeschmolzeneButter({super.name="", super.manufacturer="", super.weight=0, super.price=0});

  @override
  void setName(String name){ this.name = name; }

  @override
  String backen([String action="hinzugeben"]){ 
    print( super.backen("geschmolzene Butter hinzugebenn") );
    return "";
  }

}