class CurrentWeatherModel{
  LocationModel?location;
  CurrentModel?current;

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    location= LocationModel.fromJson(json["location"]);
    current= CurrentModel.fromJson(json["current"]);
  }
//

}
class LocationModel{
  String?name;
  String?region;
  String?country;
  String?tz_id;
  String?localtime;
  String?lat;
  String?lon;
  LocationModel.fromJson(Map<String,dynamic>json)
  {
    name=json["name"].toString();
    region=json["region"].toString();
    country=json["country"].toString();
    tz_id=json["tz_id"].toString();
    localtime=json["localtime"].toString();
    lat=json["lat"].toString();
    lon=json["lon"].toString();
  }
}

class CurrentModel{
  ConditionModel?condition;
  String?last_updated;
  String?wind_dir;
  String?temp_c;
  String?temp_f;
  String?is_day;
  String?wind_mph;
 String? wind_kph;
  String?wind_degree;
 String? pressure_mb;
 String? pressure_in;
 String? precip_mm;
 String? precip_in;
 String? humidity;
  String?cloud;
  String?feelslike_c;
  String?feelslike_f;
  String?vis_km;
  String?vis_miles;
  String?uv;
  String?gust_mph;
  String?gust_kph;

  CurrentModel.fromJson(Map<String, dynamic> json) {
    condition= ConditionModel.fromJson(json["condition"]);
    last_updated= json["last_updated"].toString();
    wind_dir= json["wind_dir"].toString();
    temp_c= json["temp_c"].toString();
    temp_f= json["temp_f"].toString();
    is_day= json["is_day"].toString();
    wind_mph= json["wind_mph"].toString();
    wind_kph= json["wind_kph"].toString();
    wind_degree= json["wind_degree"].toString();
    pressure_mb= json["pressure_mb"].toString();
    pressure_in= json["pressure_in"].toString();
    precip_mm= json["precip_mm"].toString();
    precip_in= json["precip_in"].toString();
    humidity= json["humidity"].toString();
    cloud= json["cloud"].toString();
    feelslike_c= json["feelslike_c"].toString();
    feelslike_f= json["feelslike_f"].toString();
    vis_km= json["vis_km"].toString();
    vis_miles= json["vis_miles"].toString();
    uv= json["uv"].toString();
    gust_mph= json["gust_mph"].toString();
    gust_kph= json["gust_kph"].toString();
  }
//

}

class ConditionModel{
  String?text;
  String?icon;
  String?code;
  ConditionModel.fromJson(Map<String,dynamic>json){
    text=json["text"].toString();
    icon=json["icon"].toString();
    code=json["code"].toString();
  }
}