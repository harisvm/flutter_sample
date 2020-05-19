import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Containers/Cart.dart';
import 'package:flutterapp/CustomWidgets/ButtonCustom.dart';
import 'package:flutterapp/CustomWidgets/CustomButton.dart';
import 'package:flutterapp/CustomWidgets/TextFieldCustom.dart';
import 'package:flutterapp/Models/AddressModel.dart';
import 'package:flutterapp/Screens/CartScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<AddressScreen> {
  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController pincode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextFieldCustom(
        controller: addressLine1,
        hint: 'Address Line 1',
      ),
      TextFieldCustom(
        controller: addressLine2,
        hint: 'Address Line 2',
      ),
      TextFieldCustom(
        controller: city,
        hint: 'City',
      ),
      TextFieldCustom(
        controller: landmark,
        hint: 'LandMark',
      ),
      TextFieldCustom(
        controller: pincode,
        hint: 'Pincode',
      ),
      CustomButton(
        text: 'Save',color: Color(0xff00BC9C)
        ,
        width: 150,
        onPressed: () {
          print(addressLine2.text);
          AddressModel addressModel = AddressModel(addressLine1.text,
              addressLine2.text, city.text, landmark.text, pincode.text);
          if (addressLine1.text.toString().isNotEmpty &&
              addressLine2.text.toString().isNotEmpty &&
              city.text.toString().isNotEmpty &&
              pincode.text.toString().isNotEmpty) {
            Navigator.pushNamed(context, '/second',
                arguments: CartScreen(
                  addressModel: addressModel,
                ));
          } else {
            Fluttertoast.showToast(
                msg: "Please Fill all fields",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
      )
    ]);
  }
}
