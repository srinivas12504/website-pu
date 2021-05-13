import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:website_purohith/utils/responsivelayout.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String _fb = "https://www.facebook.com/purohithapp";
  String _insta = "https://www.instagram.com/purohithapp/";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                height: 60,
                child: Image.asset("assets/slogo.png"),
              ),
              SizedBox(width: 16),
              Text(
                "Purohith App",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              )
            ],
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              TextButton(
                  onPressed: () {
                    Alert(
                      context: context,
                      title: "About",
                      buttons: [],
                      content: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Purohith is an app available on Android and soon for iOS, which connects the Devotees with the Purohiths for various auspicious occasions. You can book an appointment with the local Purohith on the app nearest to your location. They will arrive to your location and perform the ritual for a price. The app also contains Panchangam to check auspicious as well as malicious times in a day. There will be further developments down the road such as, Daily Horoscope, Devotional Content based on your interests.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ).show();
                  },
                  child: Text(
                    "About",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
              SizedBox(width: 8),
              TextButton(
                  onPressed: () {
                    Alert(
                      type: AlertType.info,
                      context: context,
                      title: "Features",
                      buttons: [],
                      content: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "There are two seperate apps for both the Devotees and the Purohiths for ease of use. Accounts can be created using both your Google sign-in and Mobile Number. Panchangam is also available in the app. The app also uses location services in order to show Purohiths near you.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ).show();
                  },
                  child: Text(
                    "Features",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
              SizedBox(width: 18),
              IconButton(
                tooltip: "Our Facebook page",
                icon: Image.asset("assets/fb.png"),
                onPressed: () async {
                  await canLaunch(_fb)
                      ? await launch(_fb)
                      : throw 'Could not launch $_fb';
                },
              ),
              SizedBox(width: 10),
              IconButton(
                tooltip: "Our Instagram page",
                icon: Image.asset("assets/ig.png"),
                onPressed: () async {
                  await canLaunch(_insta)
                      ? await launch(_insta)
                      : throw 'Could not launch $_insta';
                },
              ),
            ])
          else
            Row(
              children: [
                IconButton(
                  icon: Image.asset("assets/fb.png"),
                  tooltip: "Our Facebook page",
                  onPressed: () async {
                    await canLaunch(_fb)
                        ? await launch(_fb)
                        : throw 'Could not launch $_fb';
                  },
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Image.asset("assets/ig.png"),
                  tooltip: "Our Instagram page",
                  onPressed: () async {
                    await canLaunch(_insta)
                        ? await launch(_insta)
                        : throw 'Could not launch $_insta';
                  },
                ),
                SizedBox(width: 10),
                PopupMenuButton(
                  tooltip: "More",
                  icon: Icon(Icons.menu),
                  onSelected: (result) {
                    if (result == 0) {
                      Alert(
                        context: context,
                        title: "About",
                        buttons: [],
                        content: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Purohith is an app available on Android and soon for iOS, which connects the Devotees with the Purohiths for various auspicious occasions. You can book an appointment with the local Purohith on the app nearest to your location. They will arrive to your location and perform the ritual for a price. The app also contains Panchangam to check auspicious as well as malicious times in a day. There will be further developments down the road such as, Daily Horoscope, Devotional Content based on your interests.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ).show();
                    } else {
                      Alert(
                        type: AlertType.info,
                        context: context,
                        title: "Features",
                        buttons: [],
                        content: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "There are two seperate apps for both the Devotees and the Purohiths for ease of use. Accounts can be created using both your Google sign-in and Mobile Number. Panchangam is also available in the app. The app also uses location services in order to show Purohiths near you.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ).show();
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("About"),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text("Features"),
                      value: 1,
                    ),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}
