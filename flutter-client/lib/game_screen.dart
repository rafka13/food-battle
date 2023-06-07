import 'package:battle_men_and_women/main.dart';
import 'package:battle_men_and_women/repository/send_address_repository.dart';
import 'package:battle_men_and_women/store/address_provider.dart';
import 'package:battle_men_and_women/widgets/app_global_loader_widget.dart';
import 'package:battle_men_and_women/widgets/global_navigator.dart';
import 'package:battle_men_and_women/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.image});
  final String? image;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FToast fToast;
  bool isConfirm = false;
  int first = 20;
  int second = 20;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    fToast = FToast();
    fToast.init(context);
  }

  bool isLoading = false;

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addressInit = Provider.of<AddressProvider>(context);
    return Scaffold(
        body: Row(
      children: [
        Flexible(
          flex: first,
          // flex: first,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (second > 1) {
                  first++;
                  second--;
                }
              });
              if (second == 1) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        alignment: Alignment.center,
                        title: const Center(
                            child: Text(
                          'Red WINS',
                          style: TextStyle(fontSize: 36),
                        )),
                        actions: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      setState(() {
                                        isConfirm = true;
                                      });
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 15,
                                                        color: Colors.grey)
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: AppLoaderWidget()),
                                          );
                                        },
                                      );
                                      Map<String, dynamic> sendUserNft = {
                                        "address":
                                            addressInit.adress1C.text.trim()
                                      };
                                      var response =
                                          await SendAdressRepository.sendAdress(
                                              sendUserNft);

                                      if (response) {
                                        setState(() {
                                          isConfirm = false;
                                        });

                                        showDialog(
                                          barrierDismissible: false,
                                          context: navigatorKey.currentContext!,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'assets/success.png',
                                                    fit: BoxFit.cover,
                                                    height: 120,
                                                  ),
                                                ],
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              title: const Text(
                                                'Successfully sent',
                                                style: TextStyle(fontSize: 36),
                                                textAlign: TextAlign.center,
                                              ),
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        first = 20;
                                                        second = 20;
                                                      });
                                                      GlobalNavigator.pop();
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'RESTART',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      GlobalNavigator.pop();
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Back',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    )),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        setState(() {
                                          isConfirm = false;
                                        });
                                        fToast.showToast(
                                          child: const ToastContainer(
                                              text: "Error occured",
                                              color: Colors.redAccent),
                                          gravity: ToastGravity.BOTTOM,
                                          toastDuration:
                                              const Duration(seconds: 2),
                                        );
                                      }
                                    },
                                    child: Image.asset(
                                      'assets/wolt.png',
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      setState(() {
                                        isConfirm = true;
                                      });
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 15,
                                                        color: Colors.grey)
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: AppLoaderWidget()),
                                          );
                                        },
                                      );
                                      Map<String, dynamic> sendUserNft = {
                                        "address":
                                            addressInit.adress1C.text.trim()
                                      };
                                      var response =
                                          await SendAdressRepository.sendAdress(
                                              sendUserNft);

                                      if (response) {
                                        setState(() {
                                          isConfirm = false;
                                        });

                                        showDialog(
                                          barrierDismissible: false,
                                          context: navigatorKey.currentContext!,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'assets/success.png',
                                                    fit: BoxFit.cover,
                                                    height: 120,
                                                  ),
                                                ],
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              title: const Text(
                                                'Successfully sent',
                                                style: TextStyle(fontSize: 36),
                                                textAlign: TextAlign.center,
                                              ),
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        first = 20;
                                                        second = 20;
                                                      });
                                                      GlobalNavigator.pop();
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'RESTART',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      GlobalNavigator.pop();
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Back',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    )),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        setState(() {
                                          isConfirm = false;
                                        });
                                        fToast.showToast(
                                          child: const ToastContainer(
                                              text: "Error occured",
                                              color: Colors.redAccent),
                                          gravity: ToastGravity.BOTTOM,
                                          toastDuration:
                                              const Duration(seconds: 2),
                                        );
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Image.asset(
                                        'assets/glovo.png',
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      );
                    });
              }
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.red,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: -90,
                    child: Transform.scale(
                      scaleX: 1,
                      scaleY: 1,
                      child: SizedBox(
                          height: 180, child: Image.asset(widget.image!)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // const VerticalDivider(color: Colors.white),
        Flexible(
          flex: second,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (first > 1) {
                  second++;
                  first--;
                }
              });
              if (first == 1) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        alignment: Alignment.center,
                        title: const Center(
                            child: Text(
                          'Yellow WINS',
                          style: TextStyle(fontSize: 36),
                        )),
                        actions: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      setState(() {
                                        isConfirm = true;
                                      });
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 15,
                                                        color: Colors.grey)
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: AppLoaderWidget()),
                                          );
                                        },
                                      );
                                      Map<String, dynamic> sendUserNft = {
                                        "address":
                                            addressInit.adress2C.text.trim()
                                      };
                                      var response =
                                          await SendAdressRepository.sendAdress(
                                              sendUserNft);

                                      if (response) {
                                        setState(() {
                                          isConfirm = false;
                                        });

                                        showDialog(
                                          barrierDismissible: false,
                                          context: navigatorKey.currentContext!,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'assets/success.png',
                                                    fit: BoxFit.cover,
                                                    height: 120,
                                                  ),
                                                ],
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              title: const Text(
                                                'Successfully sent',
                                                style: TextStyle(fontSize: 36),
                                                textAlign: TextAlign.center,
                                              ),
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        first = 20;
                                                        second = 20;
                                                      });
                                                      GlobalNavigator.pop();
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'RESTART',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      GlobalNavigator.pop();
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Back',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    )),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        setState(() {
                                          isConfirm = false;
                                        });
                                        fToast.showToast(
                                          child: const ToastContainer(
                                              text: "Error occured",
                                              color: Colors.redAccent),
                                          gravity: ToastGravity.BOTTOM,
                                          toastDuration:
                                              const Duration(seconds: 2),
                                        );
                                      }
                                    },
                                    child: Image.asset(
                                      'assets/wolt.png',
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      setState(() {
                                        isConfirm = true;
                                      });
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 15,
                                                        color: Colors.grey)
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: AppLoaderWidget()),
                                          );
                                        },
                                      );
                                      Map<String, dynamic> sendUserNft = {
                                        "address":
                                            addressInit.adress2C.text.trim()
                                      };
                                      var response =
                                          await SendAdressRepository.sendAdress(
                                              sendUserNft);

                                      if (response) {
                                        setState(() {
                                          isConfirm = false;
                                        });

                                        showDialog(
                                          barrierDismissible: false,
                                          context: navigatorKey.currentContext!,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'assets/success.png',
                                                    fit: BoxFit.cover,
                                                    height: 120,
                                                  ),
                                                ],
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              title: const Text(
                                                'Successfully sent',
                                                style: TextStyle(fontSize: 36),
                                                textAlign: TextAlign.center,
                                              ),
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        first = 20;
                                                        second = 20;
                                                      });
                                                      GlobalNavigator.pop();
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'RESTART',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      GlobalNavigator.pop();
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Back',
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    )),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        setState(() {
                                          isConfirm = false;
                                        });
                                        fToast.showToast(
                                          child: const ToastContainer(
                                              text: "Error occured",
                                              color: Colors.redAccent),
                                          gravity: ToastGravity.BOTTOM,
                                          toastDuration:
                                              const Duration(seconds: 2),
                                        );
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Image.asset(
                                        'assets/glovo.png',
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      );
                    });
              }
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.amber,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: -100,
                    child: SizedBox(
                        height: 180, child: Image.asset(widget.image!)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
