void reverseInitials(String Vorname, String Nachname){
  print("${Vorname[Vorname.length-1]}.${Nachname[Nachname.length-1]}");
}

void main(Object){
  reverseInitials("Firstname", "Surname");
  reverseInitials("Johnny", "Depp");
  reverseInitials("Tom", "Cruise");
}