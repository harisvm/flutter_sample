import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ApiOperations/FetchPhotos.dart';
import 'package:flutterapp/CustomWidgets/ButtonCustom.dart';
import 'package:flutterapp/CustomWidgets/CustomButton.dart';
import 'package:flutterapp/Lists/AlbumList.dart';
import 'package:flutterapp/Models/AddressModel.dart';
import 'package:flutterapp/Models/Album.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  final AddressModel addressModel;
  final String address;

  const CartScreen({Key key, this.addressModel, this.address})
      : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<Welcome> futureAlbum;
  CartScreen cartScreen;

  @override
  void initState() {
    futureAlbum = FetchPhotos().fetchAlbum();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    cartScreen = ModalRoute.of(context).settings.arguments ?? CartScreen();

    print('cartScreen.addressModel--------');
    print(cartScreen.addressModel);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
//        SafeArea(
//          child: FutureBuilder<Welcome>(
//            future: futureAlbum,
//            builder: (context, snapshot) {
//              print(snapshot.data);
//              if (snapshot.hasData) {
//                return snapshot.hasData
//                    ? AlbumList(albumList: snapshot.data)
//                    : Center(child: CircularProgressIndicator());
//              } else if (snapshot.hasError) {
//                return Text("${snapshot.error}");
//              }
//
//              // By default, show a loading spinner.
//              return CircularProgressIndicator();
//            },
//          ),
//          left: true,
//        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Card(
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blueGrey, width: 2.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        cartScreen?.addressModel.toString() ??
                            "Add Address".toString() ??
                            '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/address');
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.add_location,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        getLocation(context);
                      }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                    child: Text(
                      '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ]),
          ),
        ),
        SizedBox(
          width: 400,
          child: Card(
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blueGrey, width: 2.0),
                borderRadius: BorderRadius.circular(4.0)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(150, 10, 10, 0),
                child: Text(
                  'Summary',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Text(
                  'Subtotal :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Text(
                  'Delivery Cost :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Text(
                  'Discount :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 10, 5),
                child: Text(
                  'Total :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green),
                  textAlign: TextAlign.start,

                ),
              ),
            ]),


          ),
        ),
        CustomButton(
          text: 'Place Order',
          color: Color(0xff00BC9C),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          height: 10,
          width: MediaQuery.of(context).size.width,
        )
      ]),
    );
  }
}

Future<LocationResult> getLocation(BuildContext context) async {
  LocationResult result = await showLocationPicker(
      context, 'AIzaSyAA_mtnF1SDxg5-gsDepQo0a0r2IPLUTpU');

  return result;
}
