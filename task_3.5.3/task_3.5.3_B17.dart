void main(){
  print("${reversNumber(1843)} / ${reversNumber(1239)} / ${reversNumber(-58783)}");
}

int reversNumber(int number){
 
  int fac = 1;
  int temp = 0;  
  int newnumber = 0;  
  int isneg=1; if (number < 0) {isneg=-1; number*=isneg;}
  temp = number;

  while (temp > 0){
    int digit = temp % 10;
    newnumber = newnumber * 10 + digit;
    temp ~/=10;
  } 

  return (newnumber*isneg);
}

