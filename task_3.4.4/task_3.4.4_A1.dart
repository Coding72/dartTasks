enum Weekday { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void main(){
  Weekday? weekday;

  weekday = Weekday.monday;

  // ##### Mit if-else #####
  if (weekday == Weekday.monday || weekday == Weekday.tuesday) {
    print('Montage und Dienstage sind anstrengend');    
  } else if (weekday == Weekday.wednesday || weekday == Weekday.thursday){
    print('Mittwoch und Donnerstag sind ok');    
  } else if (weekday == Weekday.friday){
    print('Freitag ist super');
  } else if (weekday == Weekday.saturday || weekday == Weekday.sunday){
    print('Wochenende ist genial');
  } else {    
    print('Kein Tag ausgewählt');
  }

  // ##### Mit switch-case #####
  switch(weekday){
    case (Weekday.monday || Weekday.tuesday):
      print('Montage und Dienstage sind anstrengend');
    case (Weekday.friday):
      print('Freitag ist super');
    case (Weekday.saturday || Weekday.sunday): 
      print('Wochenende ist genial');
    default:
      print('Kein Tag ausgewählt');
  }

}