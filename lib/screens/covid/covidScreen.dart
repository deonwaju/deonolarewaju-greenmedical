
import 'package:deon_greenmed/pages/covid/covidpage.dart';
import 'package:deon_greenmed/util/margin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CovidHome2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  const YMargin(60),
                  Text(
                    'Covid-19',
                    style: GoogleFonts.cabin(
                        textStyle:
                        TextStyle(fontSize: 21, color: Color(0xff989CAC))),
                  ),
                  const YMargin(4),
                  Text(
                    'Tracker',
                    style: GoogleFonts.cabin(
                      textStyle: TextStyle(
                          fontSize: 27,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const YMargin(10),
            covidPage(),
          ],
        ),
      ),
    );
  }
}
