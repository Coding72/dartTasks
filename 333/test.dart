void main(){

  String x="Java",y="Pyhton",z="Ruby",w="Kotlin",v="Swift";
  w=x;
  v=w;
  x=y;
  y=z;
  z=v;
  v=w;
  w=y;

  print("$x-$y-$z-$w-$v");


  String a2="Apfel", b2="Birne", c2="Kirsche", d2="Mango";

  b2=c2;
  d2=a2;
  c2=d2;
  a2=b2;
  d2=c2;
  b2=d2;

  print("$a2-$b2-$c2-$d2");

  int ac=100, bc=200, cc=300, dc=400, ec=500;

  cc=ac;
  ec=bc;
  ac=dc;
  bc=cc;
  dc=ec;
  cc=bc;
  ec=ac;

  print("a=$ac, b=$bc, c=$cc, d=$dc, e=$ec");

  int xd=42, yd=55, zd=89, wd=73, vd=91, ud=64;
  wd=xd;
  ud=yd;
  xd=vd;
  yd=zd;
  vd=wd;
  zd=ud;
  wd=yd;
  ud=vd;

  print("x=$xd, y=$yd, z=$zd, w=$wd, v=$vd");

}