import 'package:coastella/screens/selectAddressScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAccountInfo extends StatefulWidget {
  static const routeName = 'editAccount';


  @override
  _EditAccountInfoState createState() => _EditAccountInfoState();
}

class _EditAccountInfoState extends State<EditAccountInfo> {

  String name = "", phone= "", address= "";

  void _getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('userName');
    phone = prefs.getString('userPhone');
    address = prefs.getString('userAddress');
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    final _color = Theme.of(context).primaryColor;

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
          "Edit Your Profile",
          style: GoogleFonts.nunitoSans(color: _color),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/editProfile.png",
                  height: _mediaQuery.height * 0.3,
                  fit: BoxFit.contain,
                )),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Color(0xfff0efef),
              child: Container(
                width: _mediaQuery.width * 0.85,
                padding: EdgeInsets.symmetric(
                    horizontal: _mediaQuery.width * 0.05,
                    vertical: _mediaQuery.height * 0.01),
                child: TextField(
                  controller: TextEditingController()..text = phone,
                  enabled: false,
                  style: GoogleFonts.nunitoSans(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Phone Number", border: InputBorder.none),
                  cursorColor: _color,
                  textCapitalization: TextCapitalization.words,
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(
              height: _mediaQuery.height * 0.01,
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                width: _mediaQuery.width * 0.85,
                padding: EdgeInsets.symmetric(
                    horizontal: _mediaQuery.width * 0.05,
                    vertical: _mediaQuery.height * 0.01),
                child: TextField(
                  autofocus: false,
                  controller: TextEditingController()..text = name,
                  style: GoogleFonts.nunitoSans(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Name", border: InputBorder.none),
                  cursorColor: _color,
                  textCapitalization: TextCapitalization.words,
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(
              height: _mediaQuery.height * 0.01,
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(SelectAddressScreen.routeName);
                    },
                    child: Container(
                      width: _mediaQuery.width * 0.85,
                      padding: EdgeInsets.symmetric(
                          horizontal: _mediaQuery.width * 0.05,
                          vertical: _mediaQuery.height * 0.01),
                      child: TextField(
                        controller: TextEditingController()..text = address == "" ? "Add Your Address" : address, maxLines: 1,
                        style: GoogleFonts.nunitoSans(fontSize: 18),
                        decoration: InputDecoration(
                            labelText: "Address", border: InputBorder.none),
                        cursorColor: _color,
                        enabled: false,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _mediaQuery.height * 0.02,
            ),
            Container(
              height: _mediaQuery.height * 0.06,
              width: _mediaQuery.width * 0.4,
              child: RaisedButton(
                child: Text(
                  "Update",
                  style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                color: _color,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
