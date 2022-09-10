
import 'package:sqflite/sqflite.dart';
import 'package:the_weather/core/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather/core/model/current_week_weather_model.dart';
import 'package:path/path.dart' as p;
import '../network/remote/dio_helper.dart';

class WeatherAppCubit extends Cubit<WeatherAppStates>{
  WeatherAppCubit() : super(WeatherAppInitStates());
  static WeatherAppCubit get(context) => BlocProvider.of(context);
  late CurrentWeekWeatherModel currentWeekWeather;

  void getCurrentWeekWeather(){
    emit(WeatherAppGetCurrentWeekWeatherLoadingStates());
    DioHelper.getData(
      url: 'forecast.json',
      query: {
        'q': 'London',
        'key': 'c205d3200b664613a54105410220709',
        'days':7,
        'aqi':'no',
        'alerts':'no'
      },
    ).then((value) {
       // late CurrentWeatherModel model;
       // model=CurrentWeatherModel.fromJson(value.data);
       // print(model.location!.name);
      currentWeekWeather=CurrentWeekWeatherModel.fromJson(value.data);
      print(currentWeekWeather.location!.name);
      emit(WeatherAppGetCurrentWeekWeatherStates(currentWeekWeather));
    }).catchError((error) {
      print('error.toString()');
      emit(WeatherAppGetCurrentWeekWeatherErrorStates());

    });
  }

  late Database database;

  void createDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = p.join(databasePath, 'tasks.db');
    openAppDatabase(path: path);
    emit(TodoDatabaseTableCreatedState());
  }

  void openAppDatabase({
    required String path,
  }) {
    openDatabase(
      path,
      version: 1,
      onCreate: (database, version) {
        //debugPrint('database created');
        database
            .execute(
          ('CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT,date TEXT,statue TEXT)'),
        )
            .then((value) {
          //debugPrint('table created');
          return null;
        }).catchError((error) {
          //debugPrint('table not created$error');
        });
      },
      onOpen: (database) {
        //debugPrint('database opened');
        emit(TodoDatabaseOpenedState());
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(TodoDatabaseTableCreatedState());
    }).catchError((error) {});
  }

  void insertDatabase({
    required String title,
    required String date,
    required String statue,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        ('INSERT INTO Tasks (title ,date ,statue) VALUES("$title","$date","$statue")'),
      )
          .then((value) {
        //debugPrint('row $value inserted');
        emit(TodoDatabaseInsertedState());
        getDataFromDatabase(database);
      }).catchError((error) {
        //debugPrint('row not inserted  $error');
      });
    });
  }
  List<Map>fav=[];
  List<Map>other=[];
  List<Map>all=[];
  void getDataFromDatabase(Database database) {
    database.rawQuery(('SELECT * FROM Tasks')).then((value) {
      all = value;
      for (var element in all) {
        if (element['statue'] == 'other') {
          other.add(element);
        } else {
          fav.add(element);
        }
      }
      //debugPrint('RowGet = $value');
      emit(TodoGetDataFromDatabaseState());
    }).catchError((error) {
      //debugPrint('RowGet = $error');
    });
  }

  void deleteFromDatabase({required int id}) {
    database.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
      emit(TodoDeleteDatabaseState());
      getDataFromDatabase(database);
    });
  }
}