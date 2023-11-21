import 'package:flutter/material.dart';
import 'package:rescue_hq/pages/homepage.dart';
import 'package:rescue_hq/pages/possible_first_aid.dart';
import 'package:rescue_hq/widgets/homeappbar.dart';

class DatItem {
  String? id;
  String? dataText;

  DatItem({required this.id, required this.dataText});

  static List<DatItem> datalist() {
    return [
      DatItem(id: '01', dataText: 'Hospital'),
      DatItem(id: '02', dataText: 'Emergency'),
      DatItem(id: '03', dataText: 'Burn Centre'),
      DatItem(id: '04', dataText: 'Accident'),
      DatItem(id: '05', dataText: 'Brealthlessness'),
      DatItem(id: '06', dataText: 'Unconsciousness'),
    ];
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final dataslist = DatItem.datalist();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(
        title: '',
      ),
      //routes: {
      //  "/": (context) => const HomePage(),
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// List<DatItem> _searchItem = [];

class _MyHomePageState extends State<MyHomePage> {
  List<DatItem> _searchItem = [];
  final dataslist = DatItem.datalist();
  int _currentIndex = 0;

  @override
  void initState() {
    _searchItem = dataslist;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<DatItem> results = [];
    if (enteredKeyword.isEmpty) {
      results = dataslist;
    } else {
      results = dataslist
          .where((item) => item.dataText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _searchItem = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(141, 255, 255, 255),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const Icon(Icons.menu),
      //       SizedBox(
      //         height: 40,
      //         width: 40,
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(20),
      //           child: Image.asset('images/user.png'),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Center(
          child: _currentIndex == 2
              ? Container(
                  color: const Color.fromARGB(141, 255, 255, 255),
                  child: Column(children: [
                    const HomeAppBar(),
                    // searchBox(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      height: 44,
                      width: 620,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1, color: Colors.grey.shade400)),
                      child: TextField(
                        onChanged: (enteredKeyword) =>
                            _runFilter(enteredKeyword),
                        decoration: const InputDecoration(
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
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 25, bottom: 20),
                            child: const Text(
                              'Speed dial a specific service ',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                          ),
                          for (DatItem dataitem in _searchItem)
                            Hitem(
                              dataitem: dataitem,
                            ),
                        ],
                      ),
                    )
                  ]),
                )
              : _currentIndex == 3
                  ? Container(
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
                    )
                  : _currentIndex == 1
                      ? const Accordion() //first aid options page
                      : const HomePage()), //the home page
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
            color: Colors.white), // Change color for selected item
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        backgroundColor: const Color(0xFFFFD600),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Help',
            icon: Icon(
              Icons.medical_services_outlined,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Speed Dial',
            icon: Icon(
              Icons.speed,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          // BottomNavigationBarItem(
          //   label: 'First Aid',
          //   icon: Icon(
          //     Icons.local_hospital,
          //     color: Colors.white,
          //     size: 30.0,
          //   ),
          // )
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

class Hitem extends StatelessWidget {
  final DatItem dataitem;
  Hitem({Key? key, required this.dataitem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 53,
          width: 350,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: Colors.grey.shade400)),
            child: ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11)),
              tileColor: Colors.transparent,
              leading: const Icon(
                Icons.phone,
                color: Colors.black,
              ),
              title: Text(
                dataitem.dataText!,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w800
                    // decoration: TextDecoration.lineThrough,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
