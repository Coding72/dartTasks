void main(){
  print("${Zeichen_zaehlen("1,2,3")} - ${Zeichen_zaehlen("4, 5, 6")} - ${Zeichen_zaehlen("7, 8, 9 ")}");
}

int Zeichen_zaehlen(String Text){ return Text.length; }