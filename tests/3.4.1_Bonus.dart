
void main(){

  int a = 42;  
  int b = (5 * ++a + 3) * (a-- - 40); 

  int c = (a++ * 3 + 2) * (++a -b ~/ 10); 
  double d = (b * 1.5 + c) / (a - b % c);
  String e = "${1 * 2}${b ~/ 10}"; 
  String f = (c * 3 + b ~/ 5).toString(); 
 
  String g = e + f + d.toString(); 

  List<int> h = [1, 2, 3, 4, 5];
  h.add(a); 
  h.addAll([7, 8, 9]); 
  int i = h[h.length - 2] * h[2] + h.first; 

  String j = (a+10).toString() + (b ~/ 100).toString(); 
  int k = h[4] * (c ~/ b) + h[2]; 

  List<int> l = [a, b, c]; 
  l.add(b ~/10);
  l.add(c % 100);

  String m = l[2].toString() + l[1].toString(); 
  int n = m.length * l.length + i; 

  bool o = g.length > m.length;
  bool p = h[3] > l[2]; 
  int q = (h.length + l.length) * (j.length - 1); 


  print(a);
  print(b);
  print(c);
  print(d);
  print(e);
  print(f);
  print(g);
  print(h);
  print(i);
  print(j);
  print(k);
  print(l);
  print(m);
  print(n);
  print(o);
  print(p);
  print(q);

  // stdout.write("asdfasdf");


}