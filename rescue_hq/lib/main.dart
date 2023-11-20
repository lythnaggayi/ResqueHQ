import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Accordion()));

class Accordion extends StatefulWidget {
  const Accordion({Key? key}) : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResqueHQ'),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: Column(
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
    );
  }
}
