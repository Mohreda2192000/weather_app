import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather/core/cubit/cubit.dart';
import 'package:the_weather/core/network/remote/dio_helper.dart';
import 'package:the_weather/current_weather.dart';
import 'package:the_weather/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<WeatherAppCubit>(create: (context) => WeatherAppCubit()..createDatabase()..getCurrentWeekWeather()),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primaryColor: Colors.indigo,
        ),
        home: SplashPage(),
      ),
    );
  }
}
