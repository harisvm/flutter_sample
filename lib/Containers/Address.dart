import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/AddressScreen.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: AddressScreen(),
    );
  }
}
