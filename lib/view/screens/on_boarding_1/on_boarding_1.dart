import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../on_boarding_2/on_boarding_2.dart';

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({super.key});

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/rec.png"),
                    fit: BoxFit.fill)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "skip",
                          style: GoogleFonts.concertOne(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  SizedBox(
                    height: 470,
                    width: 420,
                    child: Image.asset(
                      "assets/images/book.png",
                      fit: BoxFit.fill,
                    ),
                  ),

                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Text(
                      "diverse books",
                      style: GoogleFonts.concertOne(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22,right: 22),
                    child: Text(
                      "from interactive pictures books to charming\nbedtime stories,our collection offers a\nvariety of options for every stage of your\nchilds development",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) {
                              return OnBoardingTwo();
                            },));
                          },
                          child: Container(
                            width: 110,
                            height: 34,
                            decoration: BoxDecoration(
                              color: Color(0xffD55D0D),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(19),
                                  bottomLeft: Radius.circular(19)),
                            ),
                            child: Center(
                              child: Text(
                                "next",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
      ),
    );
  }
}
