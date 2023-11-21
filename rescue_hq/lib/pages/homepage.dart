import 'package:flutter/material.dart';
import 'package:rescue_hq/widgets/button.dart';
import 'package:rescue_hq/widgets/homeappbar.dart';
import 'package:rescue_hq/widgets/waveanimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const HomeAppBar(),
        Container(
            // temporary height
            //height: 500,
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(children: [
              InkWell(
                  onTap: () {},
                  child: const WaveAnimation(
                    child: Button(),
                  ))
            ]))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Medical',
            icon: Icon(Icons.medical_services_outlined),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
