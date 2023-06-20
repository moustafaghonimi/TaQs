import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqs/provider/weatherProvider.dart';

import '../../widget/cardSwap.dart';
import '../constant.dart';
import 'homeBottomBar.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WeatherProvider>(context, listen: false).getWeather(context);
    });
    // Provider.of<WeatherProvider>(context, listen: false).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<WeatherProvider>(context);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor:weather.weatherData==null
      //     ?Colors.black :getThemeColor(weather.weatherData!.current!.weatherDescriptions!.first).shade300,
      body: Stack(
        children: [
          weather.weatherData == null
              ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
          )
              : Image.asset(
                  getImageBg(
                      weather.weatherData!.current!.weatherDescriptions!.first),
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Stack(
              children: [
                if (weather.weatherData == null)
                  Center(
                      child: Column(
                    children: [
                      const CircularProgressIndicator(
                        color: Colors.white70,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.routName);
                        },
                        child: const Text('press Here To Reload Screen',
                            style: TextStyle(color: Colors.white70)),
                      )
                    ],
                  ))
                else
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      Provider.of<WeatherProvider>(context)
                                          .cityName,
                                      style: const TextStyle(
                                          fontSize: 40,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${weather.weatherData!.location!.country ?? ''} - ${weather.weatherData!.current!.observationTime.toString()}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const Icon(Icons.search, color: Colors.white),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.07,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  getImage(weather.weatherData!.current!
                                      .weatherDescriptions!.first),
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  width: w*0.4,
                                  child: Text(
                                      weather.weatherData!.current!
                                          .weatherDescriptions!.first,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400),),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    weather.weatherData!.current!.temperature
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 80,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600)),
                                const Text('°c',
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.2,
                      ),
                      // Spacer(
                      //   flex: 1,
                      // ),
                      const Divider(
                        color: Colors.white70,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                Icons.wind_power,
                                color: Colors.white70,
                              ),
                              Text(
                                weather.weatherData!.current!.windDegree
                                    .toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Text(
                                'wind',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.water_drop_outlined,
                                color: Colors.white70,
                              ),
                              Text(
                                weather.weatherData!.current!.humidity
                                    .toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              const Text(
                                'Humidity',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                Icons.waves,
                                color: Colors.white70,
                              ),
                              Text(
                                weather.weatherData!.current!.visibility
                                    .toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              const Text(
                                'visibility',
                                style: TextStyle(color: Colors.white70),
                              )
                            ],
                          )
                        ],
                      ),

                      SizedBox(
                        height: h * 0.05,
                      ),

                      Expanded(child: HomeWaveBottomBar()),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 500),
                  child: weather.weatherData == null
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white70,
                          ),
                        )
                      : ParallaxViewPagerWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
