void main(){
  print("${concatText(["dfsghsd", "sdgsdfg"])} - ${concatText(["vncvbn", "sdgsdhkjlhjklfg"])} - ${concatText(["dfsasdfyxcvghsd", "sdgsdfrtwterg"])}");
}

String concatText(List<String> texts){
  // mindestens ein element
  String concat = "";
  for (int i=0; i<texts.length; i++){
    concat += texts[i];
    //if (i>0){texts[0]+=texts[i];}
  }
 //return texts[0];
 return concat;
}