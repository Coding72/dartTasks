void main(){
  print("${sum([1,2,3])} - ${sum([4, 5, 6])} - ${sum([7, 8, 9 ])}");
}

double sum(List<int> numbers){int sum =0;for (int i=0; i<numbers.length;i++){sum+=numbers[i];} return sum/numbers.length;}
