void main(){
  print("${findLetter("dfsghsd", "d")} - ${findLetter("yxvxcyv", "x")} - ${findLetter("lhkljhl", "l")}");
}

int findLetter(String text, String search){
  int count =0; 
  for (int i=0; i<text.length;i++){ 
    text[i]== search ? count++ : false;
  } 
  return count;
} // search darf nicht mehr als 1 zeichen haben, checken
