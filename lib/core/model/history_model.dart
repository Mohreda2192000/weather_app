import 'package:the_weather/core/model/current_week_weather_model.dart';

class HistoryModel{
  LocationModel?location;
  ForecastOneDayModel?forecast;

  HistoryModel({required this.location, required this.forecast});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    location= LocationModel.fromJson(json["location"]);
    forecast= ForecastOneDayModel.fromJson(json["forecast"]);
  }
}