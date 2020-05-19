import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Containers/OrderHistory.dart';
import 'package:flutterapp/Containers/Profile.dart';
import 'package:flutterapp/Containers/main.dart';

import 'package:flutterapp/Screens/LauncherScreen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_map_location_picker/generated/i18n.dart'
    as location_picker;

class FirstPage extends StatefulWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var currentTabIndex = 0;

  @override
  void initState() {
    getLocation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: currentTabIndex == 0
              ? LauncherScreen()
              : currentTabIndex == 1 ? Profile() : OrderHistory(),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentTabIndex,
              onTap: (index) {
                print('--------');
                print(getLocation);
                print(index);
                setState(() {
                  currentTabIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: new Icon(
                        Icons.home,
                      ),
                    ),
                    title: Text("Home"),
                    backgroundColor: Color(0xff01A0C7)),
                BottomNavigationBarItem(
                    icon: IconButton(icon: new Icon(Icons.settings)),
                    title: Text("Profile")),
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: new Icon(Icons.history),
                    ),
                    title: Text("Order History"))
              ])),
    );
  }
}

// ignore: non_constant_identifier_names
onTap_(int n, BuildContext context) {
  switch (n) {
    case 0:
      //Navigator.pushNamed(context, '/launcher');
      break;
    case 1:
      //  Navigator.pushNamed(context, '/profile');
      break;
    case 2:
      // Navigator.pushNamed(context, '/order');
      break;
  }
}

Future<LocationResult> getLocation(BuildContext context) async {
  LocationResult result = await showLocationPicker(
      context, 'AIzaSyDy4BcDNpntc1fSKH5o9hLwy1Li3GPIOoc');

  return result;
}
