void main(){
  print("${getLetterNumberMap(["dfsghsd", "sdgsdfg"])} - ${getLetterNumberMap(["vncvbn", "sdgsdhkjlhjklfg"])} - ${getLetterNumberMap(["dfsasdfyxcvghsd", "sdgsdfrtwterg"])}");
}

Map<String, int> getLetterNumberMap(List<String> texts){
  Map<String, int> tempMap = {};
  for (int i=0; i<texts.length; i++){
    tempMap[texts[i]] = texts[i].length;
  }
  return tempMap;
}