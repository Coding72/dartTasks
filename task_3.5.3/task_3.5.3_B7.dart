void main(){
  print("${isEven(4)} - ${isEven(-5)} - ${isEven(6)}");
}

String isEven(int number){  
  switch (number){
    case <0 : return "negativ" ;
    case >0 : return "positiv" ;
    default : return "0";
  }
}
