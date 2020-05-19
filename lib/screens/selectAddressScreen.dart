import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SelectAddressScreen extends StatefulWidget {
  static const routeName = '/selectAddress';

  @override
  _SelectAddressScreenState createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  LatLng userPosition = LatLng(13.3366806, 74.7494914);
  String userAddress = "";
  Completer<GoogleMapController> _controller = Completer();

  Future<void> _getCurrentUserLocation() async {
    final hasPermission = await Location().hasPermission();
    final hasService = await Location().serviceEnabled();

    if (hasPermission == PermissionStatus.granted && hasService) {
      final userLocation = await Location().getLocation().catchError((er) {
        print("Errorrr" + er);
      });
      final GoogleMapController controller = await _controller.future;
      setState(() {
        userPosition = LatLng(userLocation.latitude, userLocation.longitude);
        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: userPosition, zoom: 16),),);
        _getAddress(userPosition);
      });
    } else if (hasPermission == PermissionStatus.granted && !hasService) {
      await Location().requestService();
      _getCurrentUserLocation();
    } else {
      await Location().requestPermission().then((value) {
        if(value == PermissionStatus.denied){
          final alert = AlertDialog(
            title: Text("Permission Denied"),
            content: Text("Your home location will be displayed to the retailer for home delivery service."),
            actions: <Widget>[
              FlatButton(
                child: Text("Deny"),
                onPressed: ()=>Navigator.pop(context),
              ),
              FlatButton(
                child: Text("Give Permission"),
                onPressed: _getCurrentUserLocation,
              ),
            ],
          );
          showDialog(context: context, builder: (ctx){
            return alert;
          });
        }else{
          _getCurrentUserLocation();
        }
      });
    }
  }

  _getAddress(LatLng latLng) async {
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    setState(() {
      userAddress = placemark[0].name +
          " " +
          placemark[0].subLocality +
          " " +
          placemark[0].locality +
          " " +
          placemark[0].postalCode;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentUserLocation();
  }

  @override
  Widget build(BuildContext context) {

    final _color = Theme.of(context).primaryColor;
    final _mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: _color,
          ),
        ),
        title: Text(
          "Select your location",
          style: GoogleFonts.nunitoSans(color: _color),
        ),
        elevation: 5,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapToolbarEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: userPosition,
              zoom: 16,
            ),
            markers: {
              Marker(
                markerId: MarkerId("user"),
                position: userPosition,
                draggable: true,

              ),
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (val) {
              setState(() {
                userPosition = val;
                _getAddress(val);
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(right: _mediaQuery.width * 0.025),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                _getCurrentUserLocation();
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.all(_mediaQuery.height * 0.008),
                                child: Icon(
                                  Icons.my_location,
                                  color: _color,
                                  size: _mediaQuery.height * 0.035,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: _mediaQuery.width * 0.07),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: _mediaQuery.height * 0.02,
                          ),
                          Text(
                            "Your address :",
                            style: GoogleFonts.nunitoSans(
                                fontSize: 18, color: _color),
                          ),
                          TextField(
                            maxLines: 2,
                            style: GoogleFonts.nunitoSans(fontSize: 18),
                            controller: TextEditingController()
                              ..text = userAddress,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
