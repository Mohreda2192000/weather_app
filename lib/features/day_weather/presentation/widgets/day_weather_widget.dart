import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubit/cubit.dart';
import '../../../../core/cubit/states.dart';
import '../../../../core/model/current_week_weather_model.dart';
import '../../../../core/model/history_model.dart';

class DayWeatherWidget extends StatelessWidget {
  final HistoryModel model;
  const DayWeatherWidget({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherAppCubit,WeatherAppStates>(
      listener: (context,state){
      },
      builder: (context,state){
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
                                '${model?.forecast?.day?.maxtemp_c}˚',
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
                                '${model?.forecast?.day?.maxtemp_f}˚/${model?.forecast?.day?.maxtemp_c}˚ Feels like ${model?.forecast?.day?.maxtemp_c}˚',
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
                                          '${model?.forecast?.hour?[index].temp_c}˚',
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
                                              '${model?.forecast?.hour?[index].will_it_rain}%',
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
                                        Text('${model?.forecast?.astro?.sunrise}',style: const TextStyle(color: Colors.white,fontSize: 18,),),
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
                                        Text('${model?.forecast?.astro?.sunset}',style: const TextStyle(color: Colors.white,fontSize: 18,),),
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
                                        Text('${model?.forecast?.day?.uv}',style: const TextStyle(color: Colors.white,fontSize: 18,),),
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
                                        Text('${model?.forecast?.day?.maxwind_kph} km/h',style: const TextStyle(color: Colors.white,fontSize: 18,),),
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
                                        Text('${model?.forecast?.day?.avghumidity}%',style: const TextStyle(color: Colors.white,fontSize: 18,),),
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
