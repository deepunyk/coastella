import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOrderTop extends StatefulWidget {
  @override
  _TextOrderTopState createState() => _TextOrderTopState();
}

class _TextOrderTopState extends State<TextOrderTop> {
  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).primaryColor;
    final _mediaQuery = MediaQuery.of(context).size;

    return Container(
      height: _mediaQuery.height * 0.4,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: _mediaQuery.width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _mediaQuery.width * 0.1,
              vertical: _mediaQuery.height * 0.03),
          child: Column(
            children: <Widget>[
              Text("Order List", style: GoogleFonts.nunitoSans(fontSize: 20, fontWeight: FontWeight.w700),),
              Expanded(
                child: TextField(
                  cursorColor: _color,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: GoogleFonts.nunitoSans(fontSize: 18),
                  decoration: InputDecoration.collapsed(
                      hintText: "Enter List of items here",
                      hintStyle: GoogleFonts.nunitoSans(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
