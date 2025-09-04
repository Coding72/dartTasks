
class Pet {
  String type;
  String name;
  int age;

  Pet({this.type="", this.name="", this.age=0}){

  } 

  void dispose() {
    // Hier kannst du Ressourcen freigeben
    print('$name wird freigegeben.');
  }
}

void test({required int a}){}

void main() {  

  List<Pet> pets = [
    Pet(type: "Hund", name: "Lassi", age: 3),
    Pet(type: "Katze", name: "Miau", age: 2),
    Pet(type: "Vogel", name: "Tweety", age: 1),
  ];

  // Ausgabe der Liste von Haustieren
  for (var pet in pets) {
    print("Type: ${pet.type}, Name: ${pet.name}, Age: ${pet.age}");
    pet.dispose();
  }
 
 
  test(a: 12);

}
