import 'package:flutter/material.dart';

import '../current_weather/presentation/pages/current_weather_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => CurrentWeatherPage()),
        ModalRoute.withName('/aa'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/home.png',fit: BoxFit.cover,),),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/sun.png',
                fit: BoxFit.cover,
                width:150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
