import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:the_weather/core/model/history_model.dart';

import '../core/network/remote/dio_helper.dart';
import 'day_weather/presentation/pages/day_weather_page.dart';

class ChooseDay extends StatelessWidget {
  ChooseDay({Key? key}) : super(key: key);
  TextEditingController controller=TextEditingController();
  TextEditingController controller1=TextEditingController();
  List<String>cities=[
    'Cairo',
    'Al Minya',
    'Alexandria',
    'Giza',
    'Asyut',
    'New Cairo',
    'Al Manshah',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Stack(
          alignment: Alignment.center,
          children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Image.asset(
              'assets/home.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DateTimePicker(
                    controller: controller,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Date',
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller:controller1 ,
                    decoration: InputDecoration(
                      hintText: 'city',
                      prefixIcon: Icon(Icons.location_city),
                      suffixIcon: dropdownButton(cities,controller1),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    DioHelper.getData(
                      url: 'forecast.json',
                      query: {
                        'q': 'Cairo',
                        'key': 'c205d3200b664613a54105410220709',
                        'dt':'2010-09-09',
                      },
                    ).then((value) {
                      late HistoryModel model;
                      model=HistoryModel.fromJson(value.data);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DayWeatherPage(
                            model: HistoryModel(forecast: model?.forecast,
                              location: model?.location,
                            ))),
                      );
                    }).catchError((error) {
                      print('error.toString()');
                    });
                  }, child: const Text('show weather',))
                ],
              ),
            ),
          ),
        ],)
      ),
    );
  }

  DropdownButton dropdownButton(List list,TextEditingController controller)=>DropdownButton(
    icon: const Icon(Icons.keyboard_arrow_down,),
    items: list.map<DropdownMenuItem<String>>((value) {
      return DropdownMenuItem(
        value: value,
        child:Text(value),
      );
    }).toList(),
    onChanged: (item){
      controller.text=item;
    },
  );
}
