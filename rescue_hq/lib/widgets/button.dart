import 'package:flutter/material.dart';


//this is the big round button on the home page


class Button extends StatelessWidget {

  const Button({super.key});


  @override

  Widget build(BuildContext context) {

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [

      CircleAvatar(

          radius: 15,

          backgroundColor: Colors.white,

          child: Container(

            height: 15,

            width: 15,

            decoration: const BoxDecoration(

                shape: BoxShape.circle,

                gradient: LinearGradient(

                    colors: [Color(0xffD053A3), Color(0xff842990)])),

          ))

    ]);

  }

}

