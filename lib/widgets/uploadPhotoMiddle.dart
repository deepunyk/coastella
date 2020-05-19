import 'package:auto_size_text/auto_size_text.dart';
import 'package:coastella/widgets/typeOrderScreenBottom.dart';
import 'package:coastella/widgets/typeOrderScreenTop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UploadPhotoMiddle extends StatefulWidget {
  @override
  _UploadPhotoMiddleState createState() => _UploadPhotoMiddleState();
}

class _UploadPhotoMiddleState extends State<UploadPhotoMiddle> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _pickedTime;
  int _selectedOption = 1;

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: _time,);
    if (t != null)
      setState(
        () {
          _pickedTime = t;
        },
      );
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).primaryColor;
    final _mediaQuery = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: _mediaQuery.height * 0.035,
            child: AutoSizeText(
              "Select day",
              style: GoogleFonts.nunitoSans(fontSize: 40),
              maxLines: 1,
            ),
          ),
        ),
        SizedBox(
          height: _mediaQuery.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  child: Material(
                    color: _selectedOption == 1 ? _color : Colors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedOption = 1;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: _mediaQuery.width * 0.02,
                            vertical: _mediaQuery.height * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Today",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w600,
                                  color: _selectedOption == 1
                                      ? Colors.white
                                      : _color),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${DateFormat.MMMEd().format(DateTime.now())}",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w400,
                                  color: _selectedOption == 1
                                      ? Colors.white
                                      : _color),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: _mediaQuery.width * 0.05,
            ),
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  child: Material(
                    color: _selectedOption == 2 ? _color : Colors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedOption = 2;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: _mediaQuery.width * 0.02,
                            vertical: _mediaQuery.height * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Tomorrow",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w600,
                                  color: _selectedOption == 2
                                      ? Colors.white
                                      : _color),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${DateFormat.MMMEd().format(DateTime.now().add(Duration(days: 1)))}",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w400,
                                  color: _selectedOption == 2
                                      ? Colors.white
                                      : _color),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: _mediaQuery.height * 0.02,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            height: _mediaQuery.height * 0.08,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    _pickTime();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _mediaQuery.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: _mediaQuery.height * 0.04,
                          color: _color,
                        ),
                        SizedBox(
                          width: _mediaQuery.width * 0.02,
                        ),
                        Container(
                          height: _mediaQuery.height * 0.035,
                          width: _mediaQuery.width * 0.6,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            _pickedTime == null
                                ? "Click here to add your pickup time"
                                : "Pick Up Time : ${formatTimeOfDay(_pickedTime)}",
                            style: GoogleFonts.nunitoSans(fontSize: 40),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
