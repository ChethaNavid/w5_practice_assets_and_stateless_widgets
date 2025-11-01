import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.menu, color: Colors.white)],
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                WeatherCard(type: WeatherType.cloudy),
                SizedBox(height: 15),
                WeatherCard(type: WeatherType.sunnyCloudy),
                SizedBox(height: 15),
                WeatherCard(type: WeatherType.sunny),
                SizedBox(height: 15),
                WeatherCard(type: WeatherType.veryCloudy),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum WeatherType { sunny, cloudy, sunnyCloudy, veryCloudy }

class WeatherCard extends StatelessWidget {
  final WeatherType type;
  const WeatherCard({super.key, required this.type});

  Gradient get gradient {
    switch (type) {
      case WeatherType.cloudy:
        return LinearGradient(colors: [Colors.purpleAccent, Colors.purple]);
      case WeatherType.sunnyCloudy:
        return LinearGradient(colors: [Colors.greenAccent, Colors.green]);
      case WeatherType.sunny:
        return LinearGradient(colors: [Colors.redAccent, Colors.red]);
      case WeatherType.veryCloudy:
        return LinearGradient(colors: [Colors.orange, Colors.orangeAccent]);
    }
  }

  String get image {
    switch (type) {
      case WeatherType.cloudy:
        return "assets/ex4/cloudy.png";
      case WeatherType.sunnyCloudy:
        return "assets/ex4/sunnyCloudy.png";
      case WeatherType.sunny:
        return "assets/ex4/sunny.png";
      case WeatherType.veryCloudy:
        return "assets/ex4/veryCloudy.png";
    }
  }

  String get location {
    switch (type) {
      case WeatherType.cloudy:
        return "Phnom Penh";
      case WeatherType.sunnyCloudy:
        return "Paris";
      case WeatherType.sunny:
        return "Rome";
      case WeatherType.veryCloudy:
        return "Toulouse";
    }
  }

  String get minTemp {
    return "Min 10.0°C";
  }

  String get maxTemp {
    if(type == WeatherType.cloudy) {
      return "Max 30.0°C";
    }
    return "Max 40.0°C";
  }

  String get temp {
    switch(type) {
      case WeatherType.cloudy:
        return "12.2°C";
      case WeatherType.sunnyCloudy:
        return "22.2°C";
      case WeatherType.sunny:
        return "45.2°C";
      case WeatherType.veryCloudy:
        return "45.2°C";
    }
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black.withValues(alpha: 0.7),
      borderRadius: BorderRadius.circular(25),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CircleAvatar(backgroundImage: AssetImage(image)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      minTemp,
                      style: TextStyle(color: Colors.grey[300], fontSize: 11),
                    ),
                    Text(
                      maxTemp,
                      style: TextStyle(color: Colors.grey[300], fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -60,
            top: -20,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: gradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 35,
            child: Text(
              temp,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
