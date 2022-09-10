import 'package:flutter/material.dart';
import '../../../drawer/drawer_widget.dart';
import '../widgets/current_weather_widget.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: CurrentWeatherWidget(),
    );
  }
}
