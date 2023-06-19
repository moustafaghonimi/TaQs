import 'package:flutter/material.dart';

import '../../widget/buttunThemStyle.dart';
import '../../widget/cardSwap.dart';
import 'homeBottomBar.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = 'home';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Stack(
          children: [
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
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                'Cairo',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            'today,oct 02:32',
                            style: TextStyle(
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
                  height: h * 0.09,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.sunny,
                            size: 70,
                            color: Colors.yellowAccent,
                          ),
                          Text('Synny',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      const Text('23 C',
                          style: TextStyle(
                              fontSize: 80,
                              color: Colors.white70,
                              fontWeight: FontWeight.w600))
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
                    children: const [
                      Icon(Icons.wind_power, color: Colors.white70,),
                      Text('9 km/h', style: TextStyle(color: Colors.white),),
                      Text('wind', style: TextStyle(color: Colors.white70),)
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.water_drop_outlined, color: Colors.white70,),
                      Text('31 %', style: TextStyle(color: Colors.white),),
                      Text('Humidity', style: TextStyle(color: Colors.white70),)
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.waves, color: Colors.white70,),
                      Text('93 km/h', style: TextStyle(color: Colors.white),),
                      Text('Chance Of Rain', style: TextStyle(color: Colors.white70),)
                    ],
                  )
                ],),

                SizedBox(
                  height: h * 0.05,
                ),

                Expanded(child: HomeWaveBottomBar()),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 500),
              child: ParallaxViewPagerWidget(),
            ),

          ],

        ),
      ),
    );
  }
}
