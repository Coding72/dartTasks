enum eSex{male, female}
void main(){

  eSex sex;
  sex=eSex.male;
  int age = 24;

  switch(sex){
    case eSex.male:
      switch(age){
        case >=20 && <25: print("Im Schnitt 181,4m"); 
        case >=25 && <30: print("Im Schnitt 181,3m"); 
        case >=30 && <35: print("Im Schnitt 180,4m");
        default:
          switch (age){
            case < 18 : print("Zu jung"); 
            case >= 35 : print("Zu alt");
            //default:
          }
      }
    case eSex.female:
      switch(age){
        case >=20 && <25: print("Im Schnitt 167,5m");
        case >=25 && <30: print("Im Schnitt 167,3m");
        case >=30 && <35: print("Im Schnitt 167,2m");
        default:
          switch (age){
            case < 18 : print("Zu jung"); 
            case >= 35 : print("Zu alt");
            //default:
          }
      }
  }

}