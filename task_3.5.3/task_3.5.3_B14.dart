void main(){
  print("${calcTemp(12, true)} - ${calcTemp(80, false)} - ${calcTemp(20, true)}");
}

/// true => von Celsius in Fahrenheit
double calcTemp(double temp, [bool direction = true]){
  return double.parse((direction ? (temp*1.8+32) : (temp/1.8-32)).toStringAsFixed(2));
}