import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqs/provider/weatherProvider.dart';
import 'package:taqs/widget/CardData.dart';

class ParallaxViewPagerWidget extends StatefulWidget {
  @override
  _ParallaxViewPagerWidgetState createState() =>
      _ParallaxViewPagerWidgetState();
}

class _ParallaxViewPagerWidgetState extends State<ParallaxViewPagerWidget> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WeatherProvider>(context, listen: false).getWeather(context);
    });
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return CardPageWidget(pageOffset - index, pageOffset);
        },
        itemCount: 3,
      ),
    );
  }
}

class CardPageWidget extends StatelessWidget {
  final double offset;
  final double pageOffset;

  CardPageWidget(this.offset, this.pageOffset);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    var weather = Provider.of<WeatherProvider>(context);
    print(" offest ${pageOffset}");
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
          color: Colors.white30,
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: weather.loading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.orange,
                ))
              : pageOffset == 0
                  ? CardData(
                      offset: offset,
                      page: pageOffset,
                      str1: 'Wind In ${weather.weatherData!.location!.name}',
                      str2:
                          'Wind Degree ${weather.weatherData!.current!.windDegree} kmph',
                      str3:
                          'Wind Speed ${weather.weatherData!.current!.windSpeed}',
                      str4:
                          'wind Direction ${weather.weatherData!.current!.windDir}',
                      icons: const Icon(
                        Icons.wind_power_rounded,
                        color: Colors.white,
                        weight: 100,
                        size: 60,
                      ),
                    )
                  : pageOffset == 1
                      ? CardData(
                          offset: offset,
                          page: pageOffset,
                          str1:
                              'Humidity in ${weather.weatherData!.location!.name}',
                          str2:
                              'Humidity Degree ${weather.weatherData!.current!.humidity}',
                          str3:
                              'Pressure ${weather.weatherData!.current!.pressure} mb',
                          str4:
                              'Humidity Degree ${weather.weatherData!.current!.humidity}',
                          icons: const Icon(
                            Icons.water_drop,
                            color: Colors.blue,
                            weight: 100,
                            size: 60,
                          ),
                        )
                      : CardData(
                          offset: offset,
                          page: pageOffset,
                          str1:
                              'Visibility in ${weather.weatherData!.location!.name}',
                          str2:
                              'Visibility Degree ${weather.weatherData!.current!.visibility}',
                          str3:
                              'Precip ${weather.weatherData!.current!.precip} mm' ,
                          str4:
                              'Visibility Degree ${weather.weatherData!.current!.visibility}',
                          icons: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                            weight: 400,
                            size: 65,
                          ),
                        )

          //     Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: <Widget>[
          //               Transform.translate(
          //                 offset: Offset(
          //                     -offset * MediaQuery.of(context).size.width / 2, 0),
          //               ),
          //               Transform.translate(
          //                 offset: Offset(
          //                     -offset * MediaQuery.of(context).size.width / 2, 0),
          //                 child:
          //                   Text(
          //                   'Wind In : ${weather.weatherData!.location!.name}',
          //                   style: TextStyle(fontSize: 30),
          //                 ),
          //               ),
          //                const ClipRRect(
          //                 borderRadius:
          //                     BorderRadius.vertical(top: Radius.circular(32)),
          //                 child:  Icon(
          //                   Icons.wind_power,
          //                   color: Colors.white70,
          //                   weight: 100,
          //                   size: 60,
          //
          //                 ),
          //               ),
          //               const SizedBox(height: 8),
          //               Transform.translate(
          //                 offset: Offset(
          //                     -offset * MediaQuery.of(context).size.width / 2, 0),
          //                 child:
          // Text ('Wind Degree ${weather.weatherData!.current!.windDegree}',
          //                   style: const TextStyle(
          //                       fontSize: 25, color: Colors.white70),
          //                 ),
          //               ),
          //               const SizedBox(height: 6),
          //               Transform.translate(
          //                 offset: Offset(
          //                     -offset * MediaQuery.of(context).size.width / 2, 0),
          //                 child: Text(
          //                   'Wind Speed : ${weather.weatherData!.current!.windSpeed}',
          //                   style: const TextStyle(
          //                       fontSize: 20, color: Colors.white70),
          //                 ),
          //               ),
          //               const SizedBox(height: 6),
          //               Transform.translate(
          //                 offset: Offset(
          //                     -offset * MediaQuery.of(context).size.width / 2, 0),
          //                 child:Text(
          //                   'wind Direction : ${weather.weatherData!.current!.windDir}',
          //                   style: const TextStyle(
          //                       fontSize: 16, color: Colors.white70),
          //                 ),
          //               ),
          //             ],
          //           ),
          ),
    );
  }
}
