import 'package:the_weather/core/model/current_weather_model.dart';

class CurrentWeekWeatherModel{
  LocationModel?location;
  CurrentModel?current;
  ForecastDayModel?forecast;

  CurrentWeekWeatherModel.fromJson(Map<String, dynamic> json) {
    location= LocationModel.fromJson(json["location"]);
    current= CurrentModel.fromJson(json["current"]);
    forecast= ForecastDayModel.fromJson(json["forecast"]);
  }

}


class LocationModel{
  String?name;
  String?region;
  String?country;
  String?lat;
  String?lon;
  String?tz_id;
  String?localtime_epoch;
  String?localtime;

  LocationModel.fromJson(Map<String, dynamic> json) {
    name= json["name"].toString();
    region= json["region"].toString();
    country= json["country"].toString();
    lat= json["lat"].toString();
    lon= json["lon"].toString();
    tz_id= json["tz_id"].toString();
    localtime_epoch= json["localtime_epoch"].toString();
    localtime= json["localtime"].toString();
  }


}

class CurrentModel{
  String?last_updated_epoch;
  String?last_updated;
  String?temp_c;
  String?temp_f;
  String?is_day;
  ConditionModel?condition;
  String?wind_mph;
  String?wind_kph;
  String?wind_degree;
  String?wind_dir;
  String?pressure_mb;
  String?pressure_in;
  String?precip_mm;
  String?precip_in;
  String?humidity;
  String?cloud;
  String?feelslike_c;
  String?feelslike_f;
  String?vis_km;
  String?vis_miles;
  String?uv;
  String?gust_mph;
  String?gust_kph;

  CurrentModel.fromJson(Map<String, dynamic> json) {
    condition = ConditionModel.fromJson(json["condition"]);
    last_updated_epoch = json["last_updated_epoch"].toString();
    last_updated = json["last_updated"].toString();
    temp_c = json["temp_c"].toString();
    temp_f = json["temp_f"].toString();
    is_day = json["is_day"].toString();
    wind_mph = json["wind_mph"].toString();
    wind_kph = json["wind_kph"].toString();
    wind_degree = json["wind_degree"].toString();
    wind_dir = json["wind_dir"].toString();
    pressure_mb = json["pressure_mb"].toString();
    pressure_in = json["pressure_in"].toString();
    precip_mm = json["precip_mm"].toString();
    precip_in = json["precip_in"].toString();
    humidity = json["humidity"].toString();
    cloud = json["cloud"].toString();
    feelslike_c = json["feelslike_c"].toString();
    feelslike_f = json["feelslike_f"].toString();
    vis_km = json["vis_km"].toString();
    vis_miles = json["vis_miles"].toString();
    uv = json["uv"].toString();
    gust_mph = json["gust_mph"].toString();
    gust_kph = json["gust_kph"].toString();
  }
//

//

}

class ForecastDayModel{
  List<ForecastOneDayModel>?forecastday;

  ForecastDayModel.fromJson(Map<String, dynamic> json) {
    forecastday= List.of(json["forecastday"])
        .map((i) => ForecastOneDayModel.fromJson(i) )
        .toList();
  }
//

}

class ForecastOneDayModel{
  String?date;
  String?date_epoch;
  DayModel ?day;
  AstroModel? astro;
  List<HourModel>?hour;
  ForecastOneDayModel.fromJson(Map<String, dynamic> json) {
    date= json["date"].toString();
    date_epoch= json["date_epoch"].toString();
    day= DayModel.fromJson(json["day"]);
    astro= AstroModel.fromJson(json["astro"]);
    hour= List.of(json["hour"])
        .map((i) => HourModel.fromJson(i))
        .toList();
  }
//

}

class DayModel{
  String?maxtemp_c;
  String?maxtemp_f;
  String?mintemp_c;
  String?mintemp_f;
  String?avgtemp_c;
  String?avgtemp_f;
  String?maxwind_mph;
  String?maxwind_kph;
  String?totalprecip_mm;
  String?totalprecip_in;
  String?avgvis_km;
  String?avgvis_miles;
  String?avghumidity;
  String?daily_will_it_rain;
  String?daily_chance_of_rain;
  String?daily_will_it_snow;
  String?daily_chance_of_snow;
  String?uv;
  ConditionModel?condition;

  DayModel.fromJson(Map<String, dynamic> json) {
    condition = ConditionModel.fromJson(json["condition"]);
    maxtemp_c = json["maxtemp_c"].toString();
    maxtemp_f = json["maxtemp_f"].toString();
    mintemp_c= json["mintemp_c"].toString();
    mintemp_f= json["mintemp_f"].toString();
    avgtemp_c= json["avgtemp_c"].toString();
    avgtemp_f= json["avgtemp_f"].toString();
    maxwind_mph= json["maxwind_mph"].toString();
    maxwind_kph= json["maxwind_kph"].toString();
    totalprecip_mm= json["totalprecip_mm"].toString();
    totalprecip_in= json["totalprecip_in"].toString();
    avgvis_km= json["avgvis_km"].toString();
    avgvis_miles= json["avgvis_miles"].toString();
    avghumidity= json["avghumidity"].toString();
    daily_will_it_rain= json["daily_will_it_rain"].toString();
    daily_chance_of_rain= json["daily_chance_of_rain"].toString();
    daily_will_it_snow= json["daily_will_it_snow"].toString();
    daily_chance_of_snow= json["daily_chance_of_snow"].toString();
    uv= json["uv"].toString();
  }
//

}

class AstroModel{

  String?sunrise;
  String?sunset;
  String?moonrise;
  String?moonset;
  String?moon_phase;
  String?moon_illumination;

  AstroModel.fromJson(Map<String, dynamic> json) {
    sunrise= json["sunrise"].toString();
    sunset= json["sunset"].toString();
    moonrise= json["moonrise"].toString();
    moonset= json["moonset"].toString();
    moon_phase= json["moon_phase"].toString();
    moon_illumination= json["moon_illumination"].toString();
  }
//

}

class HourModel{
  ConditionModel ?condition;
  String?time_epoch;
  String?time;
  String?temp_c;
  String?temp_f;
  String?is_day;
  String?wind_mph;
  String?wind_kph;
  String?wind_degree;
  String?wind_dir;
  String?pressure_mb;
  String?pressure_in;
  String?precip_mm;
  String?precip_in;
  String?humidity;
  String?cloud;
  String?feelslike_c;
  String?feelslike_f;
  String?windchill_c;
  String?windchill_f;
  String?heatindex_c;
  String?heatindex_f;
  String?dewpoint_c;
  String?dewpoint_f;
  String?will_it_rain;
  String?chance_of_rain;
  String?will_it_snow;
  String?chance_of_snow;
  String?vis_km;
  String?vis_miles;
  String?gust_mph;
  String?gust_kph;
  String?uv;

   HourModel.fromJson(Map<String, dynamic> json) {
     condition= ConditionModel.fromJson(json["condition"]);
     time_epoch= json["time_epoch"].toString();
     time= json["time"].toString();
     temp_c= json["temp_c"].toString();
     temp_f= json["temp_f"].toString();
     is_day= json["is_day"].toString();
     wind_mph= json["wind_mph"].toString();
     wind_kph= json["wind_kph"].toString();
     wind_degree= json["wind_degree"].toString();
     wind_dir= json["wind_dir"].toString();
     pressure_mb= json["pressure_mb"].toString();
     pressure_in= json["pressure_in"].toString();
     precip_mm= json["precip_mm"].toString();
     precip_in= json["precip_in"].toString();
     humidity= json["humidity"].toString();
     cloud= json["cloud"].toString();
     feelslike_c= json["feelslike_c"].toString();
     feelslike_f= json["feelslike_f"].toString();
     windchill_c= json["windchill_c"].toString();
     windchill_f= json["windchill_f"].toString();
     heatindex_c= json["heatindex_c"].toString();
     heatindex_f= json["heatindex_f"].toString();
     dewpoint_c= json["dewpoint_c"].toString();
     dewpoint_f= json["dewpoint_f"].toString();
     will_it_rain= json["will_it_rain"].toString();
     chance_of_rain= json["chance_of_rain"].toString();
     will_it_snow= json["will_it_snow"].toString();
     chance_of_snow= json["chance_of_snow"].toString();
     vis_km= json["vis_km"].toString();
     vis_miles= json["vis_miles"].toString();
     gust_mph= json["gust_mph"].toString();
     gust_kph= json["gust_kph"].toString();
     uv= json["uv"].toString();
  }
//

}