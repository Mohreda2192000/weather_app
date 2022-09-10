import '../model/current_week_weather_model.dart';

abstract class WeatherAppStates{}

class WeatherAppInitStates extends WeatherAppStates{}
class WeatherAppGetCurrentWeekWeatherLoadingStates extends WeatherAppStates{}
class WeatherAppGetCurrentWeekWeatherStates extends WeatherAppStates{
  final CurrentWeekWeatherModel currentWeekWeatherModel;
  WeatherAppGetCurrentWeekWeatherStates(this.currentWeekWeatherModel);

}
class WeatherAppGetCurrentWeekWeatherErrorStates extends WeatherAppStates{}
class TodoDatabaseTableCreatedState extends WeatherAppStates{}
class TodoDatabaseOpenedState extends WeatherAppStates{}
class TodoDatabaseInsertedState extends WeatherAppStates{}
class TodoDeleteDatabaseState extends WeatherAppStates{}
class TodoGetDataFromDatabaseState extends WeatherAppStates{}
