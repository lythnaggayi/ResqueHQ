import 'package:flutter/material.dart';
import 'package:rescue_hq/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => const HomePage(),
      },
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
      backgroundColor: const Color.fromARGB(141, 255, 255, 255),
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
                color: Colors.blue,
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Health',
            icon: Icon(Icons.health_and_safety),
          ),
          BottomNavigationBarItem(
            label: 'Emergency',
            icon: Icon(Icons.emergency),
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
