import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var weatherData;

  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=77da1bc4aa5146fdbbb100022240606&q=thrissur'));
    if (response.statusCode == 200) {
      setState(() {
        weatherData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade900,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0)
                        )
                      ),
                      child:Column(
                        children: [
                          Text("Weather App",style: TextStyle(color: Colors.white,
                          fontSize: 20,fontWeight: FontWeight.bold,),),
                        ],
                      )
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Container(
                      height: 580,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade900,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0)
                        )
                      ),
                    ),
                  ),
                ],
              ),
                 Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Center(
                      child: weatherData == null
                      ? CircularProgressIndicator() // Show a loading indicator while fetching data
                      : WeatherInfo(weatherData:weatherData), 
                      ),
                     ],
                   ),
            ],
          )
           
                
            ),
      );
  }
}

class WeatherInfo extends StatelessWidget {
  final Map weatherData;

  WeatherInfo({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    var location = weatherData['location'];
    var current = weatherData['current'];
    var cityName = location['name'];
    var localtime = location['localtime'];
    var weatherCondition = current['condition']['text'];
    var weatherIcon = 'https:${current['condition']['icon']}';
    var temperatureC = current['temp_c'];
    var windKph = current['wind_kph'];

    return 
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
        SizedBox(height: 10),
        Text(
          cityName,
          style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
        Text(
          localtime,
          style: TextStyle(fontSize: 18,
          color: Colors.white,),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.network(weatherIcon),
                Text(
                  '${temperatureC}°C',
                  style: TextStyle(fontSize: 44,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,),
                ),
                Text(
                  weatherCondition,
                  style: TextStyle(fontSize: 18,
                  color: Colors.white,),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 90,
              width: 103,
              decoration: BoxDecoration(
             //color: Color.fromARGB(255, 159, 208, 249),
              borderRadius: BorderRadius.circular(12)
            ),
              child: Column(
                children: [
                  Icon(Icons.air, size: 32,
                  color: Colors.white,),
                  Text(
                    '${windKph} kph',
                    style: TextStyle(fontSize: 16,
                    color: Colors.white,),
                  ),
                  Text(
                    'Wind',
                    style: TextStyle(fontSize: 16,
                    color: Colors.white,),
                  ),
                ],
              ),
            ),
            Container(
              height: 90,
              width: 103,
              decoration: BoxDecoration(
             // color: Color.fromARGB(255, 159, 208, 249),
              borderRadius: BorderRadius.circular(12)
            ),
              child: Column(
                children: [
                  Icon(Icons.wb_sunny, size: 32,
                  color: Colors.white,),
                  Text(
                    'Sunrise: 6:00',
                    style: TextStyle(fontSize: 16,
                    color: Colors.white,),
                  ),
                ],
              ),
            ),
            
            Container(
              height: 90,
              width: 103,
              decoration: BoxDecoration(
          //    color: Color.fromARGB(255, 159, 208, 249),
              borderRadius: BorderRadius.circular(12)
            ),
              child: Column(
                children: [
                  Icon(Icons.thermostat, size: 32,
                  color: Colors.white,),
                  Text(
                    '49°F',
                    style: TextStyle(fontSize: 16,
                    color: Colors.white,),
                  ),
                  Text(
                    'Temperature',
                    style: TextStyle(fontSize: 16,
                    color: Colors.white,),
                  ),
                ],
              ),
            ),
          ],
        ),
         ],
      ),
    );
}
}
