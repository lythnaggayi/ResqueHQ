import 'package:flutter/material.dart';
import 'package:rescue_hq/pages/mappage.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      const HomeAppBar(),
      Container(
        padding: const EdgeInsets.only(top: 15.0),
        child: const Column(children: [
          Text(
            'Are you in trouble?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "Push the button below to send your location to a nearby emergency service.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFFB0BCE5),
                fontWeight: FontWeight.normal),
          ),
        ]),
      ),
      Container(
          // temporary height'/
          //height: 500,
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(children: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MapPage()));
                },
                child: const WaveAnimation(
                  child: Button(),
                ))
          ])),
    ]));
  }
}
