void main(){
  print("${getTextList("dfsghsd")} - ${getTextList("yxvxcyv")} - ${getTextList("lhkljhl")}");
}

List<String> getTextList(String text){  
  List<String> localList = [];
  for (int i=0; i<text.length; i++){
    localList.add(text[i]);    
  }
  return localList;
}
