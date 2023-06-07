import 'package:battle_men_and_women/store/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddressProvider()),
      ],
      child: child,
    );
  }
}
