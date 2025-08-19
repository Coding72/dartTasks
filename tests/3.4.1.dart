
void main(){

  int a=6;
  int b=3 * ++a;
  int c = 2 * a++;
  double d = b / c;
  String e = "$a";
  String f = a.toString();
  String g = e + f + f;
  bool h = a == b;
  bool i = a != b;
  bool j = a > b;
  bool k = f.length > (c * 4000).toString().length;
  bool l = g.length == c;
  bool m = 1 <= --b;
  bool n = 3 == (d > 0.5);
  List<int> o = [1, 2, 3] + [4, 5, 6];
  bool p = g[0] == (3 + 3).toString();
  int q = o.first * o.last + o[1] - o.length;

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