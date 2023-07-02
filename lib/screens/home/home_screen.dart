import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:provider/provider.dart';
import 'package:taqs/provider/weatherProvider.dart';
import 'package:taqs/screens/search/search.dart';

import '../../widget/cardSwap.dart';
import '../constant.dart';
import 'homeBottomBar.dart';
import 'package:taqs/screens/waitingScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late FlutterGifController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = FlutterGifController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.repeat(
        min: 0,
        max: 20,
        period: const Duration(milliseconds: 1000),
      );
    });

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WeatherProvider>(context, listen: false).getWeather(context);
    });
    // Provider.of<WeatherProvider>(context, listen: false).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<WeatherProvider>(context);

    // convertLocationToAddress();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          weather.weatherData == null
              ?const WaitingScreen()
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
                        color: Colors.orange,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, SearchPlacesScreen.routName);
                          Navigator.pushNamed(context, HomeScreen.routName);
                        },
                        child: const Text('press Here To Reload Screen',
                            style: TextStyle(color: Colors.orangeAccent)),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: w*0.6,
                                      child: Text(
                                        weather.weatherData!.location!.name ?? '',
                                        style: const TextStyle(
                                            fontSize: 40,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w600,),maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: w*0.65,
                                  child: Text(
                                    '  ${weather.weatherData!.location!.country ?? ''} - ${weather.weatherData!.current!.observationTime.toString()}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Search Type'),
                                IconButton(
                                  icon: Icon(Icons.map, color: Colors.white),
                                  onPressed: () {

                                    Navigator.pushNamed(context, SearchByMap.routName);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.search, color: Colors.white),
                                  onPressed: () {

                                    Navigator.pushNamed(context, SearchByMap.routName);
                                    // Navigator.pushNamed(context, SearchByMap.routName);
                                  },
                                ),
                              ],
                            ),

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
                            Row(
                              children: [
                                SizedBox(
                                  width: w / 2,
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                        fontSize: 70.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        WavyAnimatedText(
                                            '${weather.weatherData!.current!.temperature.toString()} °c'),
                                      ],
                                      isRepeatingAnimation: true,
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // SizedBox(width: 30,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  width: w * 0.14,
                                  child: GifImage(
                                    controller: controller,
                                    image: AssetImage(
                                      getImage(weather.weatherData!.current!
                                          .weatherDescriptions!.first),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.35,
                                  child: Text(
                                    '     ${weather.weatherData!.current!.weatherDescriptions!.first}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: getColor(weather
                                            .weatherData!
                                            .current!
                                            .weatherDescriptions!
                                            .first),
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.18,
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
