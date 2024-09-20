import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherProviderTrue =
    Provider.of<WeatherProvider>(context, listen: true);
    var weatherProviderFalse =
    Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      backgroundColor:(weatherProviderTrue.isDay)?Colors.white:Colors.grey,
      appBar: AppBar(
        backgroundColor: (weatherProviderTrue.isDay)?Colors.white:Colors.grey,
        leading: Icon(Icons.more_vert_outlined),
        actions: [
          GestureDetector(
            onTap: () {
              weatherProviderFalse.favouriteCity(
                weatherProviderTrue
                    .weatherModal!.locationModal.name,
                weatherProviderTrue
                    .weatherModal!.currentModal.temp_c,
                weatherProviderTrue
                    .weatherModal!.currentModal.condition.text,
                weatherProviderTrue
                    .weatherModal!.currentModal.condition.icon,
              );
              islike=islike!;
              Navigator.of(context).pushNamed('/save');
            },
            child: Icon((islike)?Icons.favorite:Icons.favorite_border,
              color:(islike)?Colors.red:Colors.black,
            ),
          ),
          SizedBox(width: 20,),
        ],
      ),
        body: FutureBuilder(future: weatherProviderFalse.fetchDataFromApi(),
            builder: (context, snapshot) {
              weatherProviderFalse.time();
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      TextField(
                      //controller: txtSearch,
                      style: const TextStyle(color: Colors.black),
                      onSubmitted: (value) {
                        weatherProviderFalse.changeTheme();
                        weatherProviderFalse.searchWeather(value);
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  weatherProviderTrue.weatherModal!.locationModal.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                  ),
                                ),
                                Text(
                                  '${date.day} ${weatherProviderTrue.month} ${date.year}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                         SizedBox(height:20,),
                         Container(
                         height: 200,
                           width: 200,
                           decoration: BoxDecoration(
                             image: DecorationImage(image:
                             (weatherProviderTrue.isDay)?
                            AssetImage('asset/img/Sun.png'): AssetImage('asset/img/MoonW.png'),
                           ),
                         ),
                         ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${weatherProviderTrue.weatherModal!.currentModal.temp_c}°C',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text( (weatherProviderTrue.isDay)?'Good Morning':'Good Night',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 80,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.sunny_snowing),
                                Text('SUNRISE'),
                                Text('7:00'),
                              ],
                            ),
                  
                            Column(
                              children: [
                                Icon(Icons.thermostat),
                                Text('WIND'),
                                Text('4m/s'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.landslide_rounded),
                                Text('TEMPRATURE'),
                                Text('23'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
            }
              else
                  {
                    return const Center(
                        child: CircularProgressIndicator(),);
                  }
            }
        )
    );
  }
}
