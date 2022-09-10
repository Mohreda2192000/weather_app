import 'package:flutter/material.dart';
import '../../../../core/model/history_model.dart';
import '../widgets/day_weather_widget.dart';

class DayWeatherPage extends StatelessWidget {
  final HistoryModel model;
  const DayWeatherPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: DayWeatherWidget(model: model,),
    );
  }
}
