bool main(){
  for (int i=0;i<100;i++){
    if (i<10) {print("Kleine Zahl: $i");} // else
    if (i<60) {print("Mittlere Zahl: $i");}
    if (i>=60) {print("Große Zahl: $i");}
  }

  return false;
}