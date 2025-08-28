void main(){
  print("${findLetter("dfsghsd", "d")} - ${findLetter("yxvxcyv", "x")} - ${findLetter("lhkljhl", "l")}");
}

bool findLetter(String text, String search){
  bool hasLetter = false;
  for (int i=0; i<text.length;i++){ 
    if (text[i]== search) { 
      hasLetter=true;
      i=text.length;
    }
  } 
  return hasLetter;
} // search darf nicht mehr als 1 zeichen haben, checken
