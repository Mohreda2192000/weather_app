import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:the_weather/core/network/remote/dio_helper.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      backgroundColor: Color(0xff80ace9),
      appBar: AppBar(
        backgroundColor: Color(0xff80ace9),
        elevation: 0,
        iconTheme: const IconThemeData (
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        title: const Text('The Weather'),
        actions: [
          false
              ? TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.clear)),
                  ),
                )
              : IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '33˚',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 45),
                      ),
                      SizedBox(
                        height: 010,
                      ),
                      Text(
                        'El Hay El Asher ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '43˚/24˚ Feels like 34˚',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sun, 2:55 pm',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.wb_sunny_sharp,
                    color: Color(0xffffbc09),
                    size: 70,
                  )
                ],
              ),

            ),
            Container(
                child: SfCartesianChart(
                  title: ChartTitle(text: 'Home'),

                ),
            )
          ],
        ),
      ),

    );
  }
}
