import 'package:flutter/material.dart';
//import 'package:geocoding/geocoding.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:share/share.dart';

//import 'home.dart';
class MyLocation extends StatefulWidget {
  final String label;
  const MyLocation({Key key, this.label}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

String label = label;

class _MyLocationState extends State<MyLocation> {
  //Position _currentPosition;
  String _currentAddress;
//String label = label;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentAddress != null) Text(_currentAddress),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                //   _getCurrentLocation();
                //  share(context, _currentPosition);
              },
            ),
            // ignore: deprecated_member_use
            //  FlatButton(
            //   child: Text("Share"),
            //  onPressed: () {
            //    share(context, _currentPosition);
            //  share(context, _currentPosition);
            //   },
            //  ),
          ],
        ),
      ),
    );
  }

  // _getCurrentLocation() {
  // String labels;
  // labels = widget.label;
  //Geolocator.getCurrentPosition(
  // desiredAccuracy: LocationAccuracy.best,
  //  forceAndroidLocationManager: true)
  // .then((Position position) {
  // setState(() {
  //  _currentPosition = position;
  // _getAddressFromLatLng();
  // share(context, _currentPosition);
  // });
  //  }).catchError((e) {
  //  print(e);
  // });
  //}

  // _getAddressFromLatLng() async {
  //  try {
  //  List<Placemark> placemarks = await placemarkFromCoordinates(
  //  _currentPosition.latitude, _currentPosition.longitude);

  //Placemark place = placemarks[0];

  //setState(() {
  //  _currentAddress =
  // "${place.locality}, ${place.postalCode}, ${place.country}";
  // });
  // } catch (e) {
  //  print(e);
  // }
  //}

  // share(BuildContext context, Position _currentPosition) {
  // final RenderBox box = context.findRenderObject();
  // String _msg = 'Help Me';
  // String _labels;
  // _labels = widget.label;

  // Share.share(
  // "${_currentPosition.latitude} - ${_currentPosition.longitude}-${_currentPosition.timestamp}- $_labels",
  //  subject: _msg, //_currentPosition.timestamp.timeZoneName,
  //  sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  //}
}
