import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          const Icon(Icons.sort, size: 30.0, color: Color(0xFFFFFFFF)),
          const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text("ResqueHQ",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ))),
          const Spacer(),
          badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red,
                padding: EdgeInsets.all(7.0),
              ),
              badgeContent: const Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "cartPage");
                  },
                  child: const Icon(Icons.shopping_bag_outlined,
                      size: 32.0, color: Color(0xFF4C53A5))))
        ],
      ),
    );
  }
}
