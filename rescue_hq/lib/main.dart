import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resque HQ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(141, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('images/user.png'),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: _currentIndex == 0
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: const Color.fromARGB(141, 255, 255, 255),
                child: Column(children: [
                  Container(
                    height: 44,
                    width: 620,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 219, 219),
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 25,
                          ),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 20, minWidth: 25),
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  )
                ]),
              )
            : Container(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(10.0)),
                    const Text(
                      "Possible First Aid Options",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ExpansionTile(
                      title: const Text('Leg or Arm Fracture'),
                      children: const <Widget>[
                        ListTile(
                          title: Text(
                              "Stop any bleeding. Apply pressure to the wound with a sterile bandage, a clean cloth or a clean piece of clothing. \n\nImmobilize the injured area. Do not try to realign the bone or push a bone that's sticking out back in. If you've been trained in how to splint and professional help isn't readily available, apply a splint to the area above and below the fracture sites. Padding the splints can help reduce discomfort. \n\nApply ice packs to limit swelling and help relieve pain. Don't apply ice directly to the skin. Wrap the ice in a towel, piece of cloth or some other material. \n\nTreat for shock. If the person feels faint or is breathing in short, rapid breaths, lay the person down with the head slightly lower than the trunk and, if possible, elevate the legs."),
                        ),
                      ],
                      onExpansionChanged: (bool expanded) {},
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Health',
            icon: Icon(Icons.health_and_safety),
          ),
          BottomNavigationBarItem(
            label: 'First Aid',
            icon: Icon(Icons.local_hospital),
          )
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
