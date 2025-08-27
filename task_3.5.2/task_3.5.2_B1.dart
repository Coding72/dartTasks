void main() {  
  convertMinutesToTime(179);
}

void convertMinutesToTime(int minutes){
  print("${minutes ~/ 60} Stunden, ${minutes % 60} Minuten");
}


