import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'content.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'AWASTHI VITALITY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyHomePageModel {
  final String image;
  final String title;
  final List<String> desc;
  final String color;

  MyHomePageModel(
      {required this.image,
      required this.title,
      required this.desc,
      required this.color});
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController();
  final List<MyHomePageModel> _modelList = [
    MyHomePageModel(
      image: "assets/buyer.png",
      title: "Builder (\u{20B9}${4999})",
      desc: ["Property promotion on website","Photoshoot & Reels of property","Google & meta ads.","Relationship Manager for Assistance","Customer Support","Privacy to Leads"],
      color: "#000000",
    ),
    MyHomePageModel(
      image: "assets/employee.png",
      title: "Buyer",
      desc: ["Three free listing property","\u{20B9}${99} one featured ad. for 30 days"],
      color: "#000000",
    ),
    MyHomePageModel(
      image: "assets/buyer.png",
      title: "Broker",
      desc: ["Example1", "Example2", "Example3", "Example100"],
      color: "#000000",
    ),
  ];
  int _curr = 0;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F6FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        elevation: 0,
        centerTitle: true,
        title: const Center(
            child: Text(
          "Our Subscription Models",

          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,fontFamily: 'Poppins',),
        )),
        backgroundColor: const Color(0xffF2F6FF),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
        children: _modelList.map((model) => Pages(model: model)).toList(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            child: const Text(
              ' Next ',
              style:
                  TextStyle(fontSize: 15, backgroundColor: Colors.transparent),
            ),
            onPressed: () {
              if (_curr != _modelList.length - 1) {
                controller.jumpToPage(_curr + 1);
              } else {
                controller.jumpToPage(0);
              }
            },
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _modelList.length,
                (index) => Container(
                  height: 8,
                  width: _curr == index ? 16 : 8,
                  margin: const EdgeInsets.only(right: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final MyHomePageModel model;

  Pages({required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 50,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        shadowColor: Colors.black,
        color: Colors.white,
        child: SizedBox(
          width: 280,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0, 10,10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
               mainAxisSize: MainAxisSize.min,
              children: <Widget>[

              Positioned(
              top: 0,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(10),
                    ) // green shaped
                ),
                child: const Text("CHOCOLATE",style: TextStyle(fontSize: 15,fontFamily: "Roboto"),),
              ),
              ),
                Image.asset(
                  model.image,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 20),
                Text(
                  model.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0, 0, 0),
                child : Text(
                  model.desc.map((x) => "• $x\n").reduce((x, y) => "$x$y"),
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 12,fontFamily: 'Poppins'),
                ),
            ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Buy Plan',
                      style: TextStyle(fontSize: 18,fontFamily: 'Poppins',),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
