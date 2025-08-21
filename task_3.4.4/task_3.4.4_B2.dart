// test ohne conditions

enum chars {warrior, mage ,archer}
enum dayTimes {morning, noon, night}
enum weather {sunny, rainy, stormy}
enum all {sunny, rainy, stormy, morning, noon, night}

void main(){ 

  // ##### Declaration & Initialisation #####
  chars eCharacter = chars.archer;
  dayTimes eDayTimes = dayTimes.noon;
  weather eWeather = weather.rainy;

  Map<chars,String> charNames = {chars.warrior:"Krieger", chars.mage:"Magier", chars.archer:"Bogenschütze"};
  Map<dayTimes,String> dayTimeNames = {dayTimes.morning:"Morgens", dayTimes.noon:"bei Tag", dayTimes.night:"Nachts"};
  Map<weather,String> weatherNames = {weather.sunny:"bei Sonne", weather.rainy:"bei Regen", weather.stormy:"bei Sturm"};
  
  // ##### Rating Map/List #####
  Map<int,String> mRating = {0: "Nicht optimal", 35: "Könnte besser sein", 50:"Durchschnittlich", 95: "Sehr gefährlich"};  
  List<int> ratingValue = [0, 35, 50, 95];
  List<String> ratingText = ["Nicht optimal", "Könnte besser sein", "Durchschnittlich", "Sehr gefährlich"];

  // ##### Variables & Constants #####  
  int strength = 0;
  String rating="";
  const baseAttack = 50;
  int dayTimeStep = 30; //35 bei 100 
  int weatherStep = 15; //((dayTimeStep(-5?)/2).round(); ?

  // short-funktion: zur konkatenation
  String message() => "Dein ${charNames[eCharacter]} hat ${dayTimeNames[eDayTimes]} und ${weatherNames[eWeather]} eine Angriffsstärke von $strength! $rating";

List<Map<chars,List<Map<all,int>>>> values =[
  {  // list-1=dayTimes, list-2=weather
    chars.warrior:[{all.morning:1, all.noon:-1, all.night:-1}, {all.sunny:1, all.rainy:-1, all.stormy:-1}],
    chars.mage:[{all.morning:1, all.noon:-1, all.night:-1}, {all.sunny:1, all.rainy:-1, all.stormy:-1}],
    chars.archer:[{all.morning:1, all.noon:-1, all.night:-1}, {all.sunny:1, all.rainy:-1, all.stormy:-1}]
  }
];

List<int> step = [30, 15]; // dayTime, weather
strength=baseAttack;
for (int j=0; j<values.length; j++){
  values[j].forEach((key, value1) {
    value1[0].forEach((key, value2) { 
      // check ==
      strength += value2*step[0]; });
    value1[1].forEach((key, value2) { strength += value2*step[1]; });    
  });
}

print(strength); 
 
  // Version 1 uses the map
  mRating.forEach((key, value){
    if (strength >= key){rating=value;};
  }); 

  print(message());
  
}