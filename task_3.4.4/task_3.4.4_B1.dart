enum chars {warrior, mage ,archer}
enum dayTimes {morning, noon, night}
enum weather {sunny, rainy, stormy}

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
  
  // Conditions - wird NICHT alles abgedeckt !
  strength = baseAttack;
  switch (eCharacter){
    case chars.warrior:
      switch (eWeather){
        default:      
      }
      switch (eDayTimes){
        case dayTimes.noon:
          strength+=dayTimeStep;
        case dayTimes.night:
          strength-=dayTimeStep;
        default:
      }
    case chars.mage:      
      switch (eWeather){
        case weather.stormy:
          strength+=weatherStep;
        case weather.sunny:
          strength-=weatherStep;
        default:
      }
      switch (eDayTimes){
        case dayTimes.night:
          strength+=dayTimeStep;
        default:
      }
    case chars.archer:      
      switch (eWeather){
        case weather.rainy:
          strength-=weatherStep;
        case weather.sunny:
          strength+=weatherStep;
        default:
      }
      switch (eDayTimes){
        case dayTimes.noon:
          strength+=dayTimeStep;
        default:
      }
    }
 
    // Version 1 uses the map
    mRating.forEach((key, value){
      if (strength >= key){rating=value;};
    });    

    // Version 2 uses 2 lists
    int i=ratingValue.length-1; while(i>-1){
      if (strength >= ratingValue[i]){rating=ratingText[i];i=0;};
      i--;
    }

    // output full conText
    print(message());
  
}