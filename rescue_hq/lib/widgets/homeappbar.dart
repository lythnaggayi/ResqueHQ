import 'package:flutter/material.dart';

//this is the  appbar
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      padding: const EdgeInsets.all(25.0),
      child: const Row(
        children: [
          Icon(Icons.sort, size: 30.0, color: Color(0xFFFFFFFF)),
          Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text("ResqueHQ",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ))),
          // const Spacer(),
          // InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, "cartPage");
          //     },
          //     child: const Icon(Icons.contacts,
          //         size: 32.0, color: Color(0xFF4C53A5)))
        ],
      ),
    );
  }
}
