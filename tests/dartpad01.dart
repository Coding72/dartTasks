int main(){

  final List<String> heroNames = [
    'Lara Croft',
    'Indiana Jones',
    'Nathan Drake',
    'Elena Fisher',
    'Sam Fisher',
    'Solid Snake',
    'Geralt von Riva',
    'Aloy',
    'Master Chief',
    'Kratos',
  ];

  final String firstHero = heroNames.first;
  final String lastHero = heroNames.last;
  final String oneBeforeLastHero1 = heroNames[heroNames.length-2];
  final String oneBeforeLastHero2 = heroNames[heroNames.indexOf(heroNames.last)-1];
  
  final int numberOfHeroes = heroNames.length;

  final String userFirstName = "Angi";
  final String userLastName = "Petzold";

  // Initialen des Benutzers
  final String displayName = userFirstName[0]+userLastName[0];


  Map<String, int> map;  map={"1": 2, "2":1 };

  print({"1": 2, "2":1 }["1"]);

  return 0;
}