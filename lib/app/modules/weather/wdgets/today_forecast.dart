import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ForecastToday(String time, String temp, String wind, String rainChance,
    IconData weatherIcon, size) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            time,
            style: GoogleFonts.questrial(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        Row(children: [

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: FaIcon(
                  weatherIcon,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              SizedBox(width: 10,),
              Text(
                '$temp˚C',
                style: GoogleFonts.questrial(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              SizedBox(width: 10,),
              Text(
                '$wind km/h',
                style: GoogleFonts.questrial(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              SizedBox(width: 10,),
              Text(
                '$rainChance %',
                style: GoogleFonts.questrial(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
        ],)
      ],
    ),
  );
}
