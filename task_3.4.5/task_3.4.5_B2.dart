void main(){
  List<String> names = ['Julietta', 'Benjamino', 'Hans-Günther', 'Evalinea', 'Fiona', 'Gregory', 'Leonhart'];
  List<int> points = [4, 5, 4, 2, 6 ,6 ,3];
  Map<String, int> names_points = {};
  
  if (names.length == points.length){
    int i=0; while (i<names.length){
      names_points[names[i]] = points[i];
      i++;
    }
  }

  for ( String name in names_points.keys){ print(name); }
  for ( int point in names_points.values){ print(point); }
  for ( String name in names_points.keys){ print(name+" - "+names_points[name].toString()); }

}