import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'navbar.dart';
import 'utils/responsivelayout.dart';

String _pp =
    'https://www.freeprivacypolicy.com/live/33f0b9a9-e874-45e1-abaf-1a0793acc0f2';
@override
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Purohith',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orangeAccent.shade100,
        Colors.orangeAccent.shade200
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: FadeInImage.assetNetwork(
              placeholder: "assets/mockup.png",
              image: "assets/mockup.png",
              imageScale: .85,
              fadeInDuration: const Duration(seconds: 1),
              fadeInCurve: Curves.easeInCirc,
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hello!",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  RichText(
                    text: TextSpan(
                        text: "Welcome to ",
                        style: TextStyle(fontSize: 50, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Purohith",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87))
                        ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 100,
                    width: 350,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Ink.image(
                        image: AssetImage("gl.png"),
                        fit: BoxFit.fill,
                        child: InkWell(
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextButton(
                      onPressed: () async {
                        await canLaunch(_pp)
                            ? await launch(_pp)
                            : throw 'Could not launch $_pp';
                      },
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SmallChild extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Hello!",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(fontSize: 40, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Purohith',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: FadeInImage.assetNetwork(
                placeholder: "assets/mockup.png",
                image: "assets/mockup.png",
                height: 500,
                width: 250,
                fadeInDuration: const Duration(seconds: 1),
                fadeInCurve: Curves.easeInCirc,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 50,
                width: 175,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Ink.image(
                    image: AssetImage("gl.png"),
                    fit: BoxFit.fill,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: TextButton(
                  onPressed: () async {
                    await canLaunch(_pp)
                        ? await launch(_pp)
                        : throw 'Could not launch $_pp';
                  },
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
