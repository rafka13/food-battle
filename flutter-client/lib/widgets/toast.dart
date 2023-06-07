import 'package:flutter/material.dart';

class ToastContainer extends StatelessWidget {
  const ToastContainer({
    Key? key,
    required this.text,
    this.color = Colors.green,
  }) : super(key: key);
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center),
    );
  }
}
