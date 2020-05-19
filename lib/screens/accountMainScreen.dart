import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/widgets/accountScreenBottom.dart';
import 'package:coastella/widgets/accountScreenTop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountMainScreen extends StatefulWidget {
  @override
  _AccountMainScreenState createState() => _AccountMainScreenState();
}

class _AccountMainScreenState extends State<AccountMainScreen> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery
        .of(context)
        .size;

    return Column(
      children: <Widget>[
        AccountTop(),
        SizedBox(
          height: _mediaQuery.height*0.07,
        ),
        AccountBottom(),
      ],
    );
  }
}
