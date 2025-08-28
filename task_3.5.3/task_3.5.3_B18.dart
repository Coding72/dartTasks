void main(){
  print("${getTime(1843)} / ${getTime(1239)} / ${getTime(47723)}");
}

List<int> getTime(int seconds){
  List<int> temp = [0,0,0];
  temp[0] = seconds ~/ (60*60); // Stunden
  temp[1] = (seconds % (60*60)) ~/ 60; // Minuten
  temp[2] = seconds % 60; // Sekunden
  return (temp);
}


