import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
          radius: 12,
          backgroundColor: Colors.white,
          child: Container(
            height: 13,
            width: 13,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xffD053A3), Color(0xff842990)])),
          ))
    ]);
  }
}
