import 'package:battle_men_and_women/fortune_wheel_screen.dart';
import 'package:battle_men_and_women/services/screen_navigation_const.dart';
import 'package:battle_men_and_women/services/size_config.dart';
import 'package:battle_men_and_women/services/validators.dart';
import 'package:battle_men_and_women/store/address_provider.dart';
import 'package:battle_men_and_women/widgets/app_hide_keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _formKey = GlobalKey<FormState>();
  SizeConfig sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    final addressInit = Provider.of<AddressProvider>(context);
    final buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        // foregroundColor: Colors.white,
        // borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.fromLTRB(75, 20, 75, 20));
    return AppHideKeyBoardWidget(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/bc.jpg',
                    ),
                    fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30),
                  const Text('FOOD BATTLE',
                      style: TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                // bottomLeft
                                offset: Offset(-1.5, -1.5),
                                color: Colors.white),
                            Shadow(
                                // bottomRight
                                offset: Offset(1.5, -1.5),
                                color: Colors.black),
                            Shadow(
                                // topRight
                                offset: Offset(1.5, 1.5),
                                color: Colors.black),
                            Shadow(
                                // topLeft
                                offset: Offset(-1.5, 1.5),
                                color: Colors.black),
                          ])),
                  const SizedBox(height: 50),
                  // Container for BSC Address Inputs
                  Container(
                    width: sizeConfig.widthSize(context, 70),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: addressInit.adress1C,
                            decoration: const InputDecoration(
                              labelText: 'Enter Address 1',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              var defaultValidator =
                                  Validator.of(context).isEthereum(value);

                              return defaultValidator;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: addressInit.adress2C,
                            decoration: const InputDecoration(
                              labelText: 'Enter Address 2',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              var defaultValidator =
                                  Validator.of(context).isEthereum(value);

                              return defaultValidator;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        changeScreen(context, const FortuneWheelScreen());
                      }
                    },
                    style: buttonStyle,
                    child: const Text('Play', style: TextStyle(fontSize: 25)),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
