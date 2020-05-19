import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/widgets/typeOrderScreenBottom.dart';
import 'package:coastella/widgets/typeOrderScreenTop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeOrderScreen extends StatefulWidget {
  static const routeName = '/typeOrder';

  @override
  _TypeOrderScreenState createState() => _TypeOrderScreenState();
}

class _TypeOrderScreenState extends State<TypeOrderScreen> {
  @override
  Widget build(BuildContext context) {

    Color _color = Theme.of(context).primaryColor;
    final _mediaQuery = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Color(0xfffff3f3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: _color,
          ),
        ),
        title: Text(
          "Place Order",
          style: GoogleFonts.nunitoSans(color: _color),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TypeOrderScreenTop(),
            TypeOrderScreenBottom()
          ],
        ),
      ),
    );
  }
}
