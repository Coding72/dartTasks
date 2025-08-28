void main(){
    print("${getSmallestNumber([1,2,3])} - ${getSmallestNumber([4, 5, 6])} - ${getSmallestNumber([7, 8, 9 ])}");
}

int getSmallestNumber(List<int> numbers){
  int smallest = numbers[0]; //liste sollte mind. 1 element enthalten
  for (int i=0; i<numbers.length; i++){
    if (smallest>numbers[i]){ smallest = numbers[i]; }
  }
  
  return smallest; 
  
  
}