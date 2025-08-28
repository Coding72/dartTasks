void main(){
  print("${getTextsLetterCount(["dfsghsd", "sdgsdfg"])} - ${getTextsLetterCount(["vncvbn", "sdgsdhkjlhjklfg"])} - ${getTextsLetterCount(["dfsasdfyxcvghsd", "sdgsdfrtwterg"])}");
}

List<String> getTextsLetterCount(List<String> texts){  
  List<String> localList = [];  
  for (int i=0; i<texts.length; i++){
    localList.add("${texts[i]} -> ${texts[i].length}");
  }
  return localList;
}
