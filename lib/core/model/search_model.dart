
class SearchModel{
  List<City>?city;

   SearchModel.fromJson(Map<String, dynamic> json) {
    city= List.of(json["city"])
        .map((i) =>City.fromJson(i))
        .toList();
  }


}
class City{
  String?id;
  String?name;
  String?region;
  String?country;
  String?lat;
  String?lon;
  String?url;

  City.fromJson(Map<String, dynamic> json) {
    id= json["id"].toString();
    name= json["name"].toString();
    region= json["region"].toString();
    country= json["country"].toString();
    lat= json["lat"].toString();
    lon= json["lon"].toString();
    url= json["url"].toString();
  }
//

}