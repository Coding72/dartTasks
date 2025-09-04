import 'package:task_3_6_3/classes.dart';

void main(List<String> arguments) {

  // Aufgabe 1

  ApplePicker applePicker = ApplePicker(5.5, true, DriveType.hand);
  Trimmer trimmer = Trimmer(DriveType.petrol);
  
  applePicker.length=1;
  trimmer.age=1;

  // Aufgabe 2

  Milch milch = Milch();
  print(milch.backen());
  milch.setName("Milch");

  Butter butter = Butter();
  butter.backen();

  GeschmolzeneButter geschmolzeneButter = GeschmolzeneButter(weight:15.5);
  geschmolzeneButter.backen();

}