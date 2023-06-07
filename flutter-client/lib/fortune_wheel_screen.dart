import 'dart:async';
import 'dart:math';

import 'package:battle_men_and_women/game_screen.dart';
import 'package:battle_men_and_women/services/screen_navigation_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class FortuneWheelScreen extends StatefulWidget {
  const FortuneWheelScreen({super.key});

  @override
  State<FortuneWheelScreen> createState() => _FortuneWheelScreenState();
}

class _FortuneWheelScreenState extends State<FortuneWheelScreen> {
  StreamController<int> controller = StreamController<int>();

  List<String> images = [
    'assets/burger.png',
    'assets/sushi.png',
  ];
  int random = 0;
  void setRandom() {
    random = Random().nextInt(2);
    controller.add(random);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  icon: const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  )),
            ),
            SizedBox(
              height: size.height * .1,
            ),
            SizedBox(
              height: size.height * .5,
              child: FortuneWheel(
                selected: controller.stream,
                onFling: () {
                  setRandom();
                },
                indicators: const <FortuneIndicator>[
                  FortuneIndicator(
                    alignment: Alignment
                        .topCenter, // <-- changing the position of the indicator
                    child: TriangleIndicator(
                      color: Colors
                          .redAccent, // <-- changing the color of the indicator
                    ),
                  ),
                ],
                items: images
                    .asMap()
                    .map((i, value) => MapEntry(
                        i,
                        FortuneItem(
                            style: const FortuneItemStyle(
                              color: Colors
                                  .transparent, // <-- custom circle slice fill color
                              borderColor: Colors
                                  .black87, // <-- custom circle slice stroke color
                              borderWidth:
                                  3, // <-- custom circle slice stroke width
                            ),
                            child: Transform.rotate(
                              angle: 20,
                              child: Image.asset(
                                value,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ))))
                    .values
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: setRandom,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(75, 20, 75, 20)),
              child: const Text(
                'ROLL',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    // borderRadius: BorderRadius.circular(10),
                    padding: const EdgeInsets.fromLTRB(75, 20, 75, 20)),
                onPressed: () {
                  changeScreen(context, Home(image: images[random]));
                },
                child: const Text(
                  'PLAY',
                  style: TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
