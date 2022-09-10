import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather/features/day_weather/presentation/pages/day_weather_page.dart';

import '../../../../core/cubit/cubit.dart';
import '../../../../core/cubit/states.dart';
import '../../../../core/model/current_week_weather_model.dart';
import '../../../../core/model/history_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  CurrentWeatherWidget({Key? key}) : super(key: key);
  CurrentWeekWeatherModel? model;
  List<String>week=[
    'Today',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherAppCubit,WeatherAppStates>(
      listener: (context,state){
        if(state is WeatherAppGetCurrentWeekWeatherStates){
          model=state.currentWeekWeatherModel;
        }
      },
      builder: (context,state){
        WeatherAppCubit cubit=WeatherAppCubit.get(context)..getCurrentWeekWeather();
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Stack(
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
              (state is WeatherAppGetCurrentWeekWeatherLoadingStates)?
              const CircularProgressIndicator(color: Colors.indigo,):
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                '${model?.current?.temp_c}˚',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 50),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${model?.location?.name}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                '${model?.current?.feelslike_c}˚/${model?.current?.feelslike_f}˚ Feels like ${model?.current?.feelslike_c}˚',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${model?.location?.localtime}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.shield_moon_outlined,
                            color: Color(0xffffbc09),
                            size: 70,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2c3157).withOpacity(.6),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Colors.white),
                                      color: Colors.indigo,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '$index ${index < 13 ? 'AM' : 'PM'}',
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Icon(
                                          Icons.sunny,
                                          color: Colors.orangeAccent,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${model?.forecast?.forecastday?[0].hour?[index].temp_c}˚',
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.water_drop,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              '${model?.forecast?.forecastday?[0].hour?[index].will_it_rain}%',
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 500,
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: const Color(0xff2c3157).withOpacity(.6),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DayWeatherPage(
                                          model: HistoryModel(forecast: model?.forecast?.forecastday?[index],
                                              location: model?.location,
                                          ))),
                                    );
                                  },
                                  child: Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 15),
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1, color: Colors.white),
                                        color: Colors.indigo,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            week[index],
                                            style: const TextStyle(
                                                color: Colors.white, fontSize: 16),
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const  Icon(
                                                Icons.water_drop,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                '${model?.forecast?.forecastday?[index].day?.daily_will_it_rain}%',
                                                style: const TextStyle(
                                                    color: Colors.white, fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.sunny,
                                            color: Colors.orangeAccent,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.shield_moon_outlined,
                                            color: Colors.orangeAccent,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${model?.forecast?.forecastday?[index].day?.mintemp_c}˚',
                                            style: const TextStyle(
                                                color: Colors.white, fontSize: 16),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${model?.forecast?.forecastday?[index].day?.maxtemp_c}˚',
                                            style: const TextStyle(
                                                color: Colors.white, fontSize: 16),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                itemCount: 7,
                              ),),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 150,
                              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2c3157).withOpacity(.6),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('Sunrise',style: TextStyle(color: Colors.white,fontSize: 18,),),
                                        const SizedBox(height: 5,),
                                        Text('${model?.forecast?.forecastday?[0].astro?.sunrise}',style: const TextStyle(color: Colors.white,fontSize: 18,),),
                                        const SizedBox(height: 5,),
                                        Icon(Icons.sunny,color: Colors.orange[500],size: 70,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('Sunset',style: TextStyle(color: Colors.white,fontSize: 18,),),
                                        const SizedBox(height: 5,),
                                        Text('${model?.forecast?.forecastday?[0].astro?.sunset}',style: const TextStyle(color: Colors.white,fontSize: 18,),),
                                        const SizedBox(height: 5,),
                                        Icon(Icons.sunny,color: Colors.orange[800],size: 70,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 150,
                              padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff2c3157).withOpacity(.6),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.sunny_snowing,color: Colors.orange[700],size: 50,),
                                        const SizedBox(height: 5,),
                                        const Text('UV index',style: TextStyle(color: Colors.white,fontSize: 18,),),
                                        const SizedBox(height: 5,),
                                        Text('${model?.forecast?.forecastday?[0].day?.uv}',style: const TextStyle(color: Colors.white,fontSize: 18,),),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.wind_power,color: Colors.grey,size: 50,),
                                        const SizedBox(height: 5,),
                                        const Text('Wind',style: TextStyle(color: Colors.white,fontSize: 18,),),
                                        const SizedBox(height: 5,),
                                        Text('${model?.forecast?.forecastday?[0].day?.maxwind_kph} km/h',style: const TextStyle(color: Colors.white,fontSize: 18,),),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.water_drop,color: Colors.blue[300],size: 50,),
                                        const SizedBox(height: 5,),
                                        const Text('Humidity',style: TextStyle(color: Colors.white,fontSize: 18,),),
                                        const SizedBox(height: 5,),
                                        Text('${model?.forecast?.forecastday?[0].day?.avghumidity}%',style: const TextStyle(color: Colors.white,fontSize: 18,),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
