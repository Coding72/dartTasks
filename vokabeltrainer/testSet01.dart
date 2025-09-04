void main(){

Set<String> teilnehmer1 = {"Fahrrad", "Deniz", "Fabian"};
Set<String> teilnehmer2 = {"Jan", "Erhan" ,"Fahrrad", "Deniz", "Fabian"};

print(teilnehmer2.difference(teilnehmer1));

print(teilnehmer2.toList());

String gesuchterTeilnehmer = "Fahrrad";

// Überprüfen, ob der gesuchte Teilnehmer im Set ist
if (teilnehmer2.contains(gesuchterTeilnehmer)) {
  print('$gesuchterTeilnehmer ist im Set enthalten.');
} else {
  print('$gesuchterTeilnehmer ist nicht im Set enthalten.');
}

//records und tupel
  
}