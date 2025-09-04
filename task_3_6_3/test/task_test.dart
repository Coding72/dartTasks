//import 'package:task_3_6_3/debug.dart';
import 'package:task_3_6_3/classes.dart';
import 'package:test/test.dart';

void main() {
  //parentTest
  testMilch();
  testButter();
  testGeschmolzeneButter();
}

void testMilch(){
  group('Milch test', () {
    test('Milch backen', (){
      Milch milch = Milch();      
      String result = milch.backen();
      expect(result, equals('Milch hinzugeben'));
      expect(result, equals('Butter schmelzen'));      
    });
  });

}

void testButter(){
  
}

void testGeschmolzeneButter(){

  
}
