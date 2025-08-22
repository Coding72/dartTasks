void main(){
  
  List<int> points = [4, 5, 4, 2, 6 ,6 ,3];
  
  int sum = 0;
  for (var point in points){ sum += point; }
  print("Länge der Liste: "+points.length.toString());
  print("Summe: "+(sum).toString());
  print("Durchschnitt: "+(sum/points.length).toString());

  // version 2
  // als funktion zur Laufzeit falls die Liste dynamisch wächst.
  for (var point in points.asMap().entries){
      if (point.key > 0){points[0]+=points[point.key];}
      //print("Durchschnitt (bis pos->"+point.key.toString()+", "+points[0].toString()+"/"+(point.key+1).toString()+"): "+(points[0]/(point.key+1)).toString());
      if (point.key >= points.length-1){ print((points[0]/(point.key+1)).toString()); }
      //print((points[0]/(point.key+1)).toString());
  }

}