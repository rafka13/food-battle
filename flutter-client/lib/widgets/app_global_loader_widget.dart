import 'package:flutter/material.dart';

class AppLoaderWidget extends StatelessWidget {
  AppLoaderWidget({
    Key? key,
  }) : super(key: key);
  final isLoading = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.black87,
                backgroundColor: Colors.white)));
  }
}
