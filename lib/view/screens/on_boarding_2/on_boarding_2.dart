import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../on_boarding_3/on_boarding_3.dart';

class OnBoardingTwo extends StatefulWidget {
  const OnBoardingTwo({super.key});

  @override
  State<OnBoardingTwo> createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),

            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  "Skip",
                  style: GoogleFonts.concertOne(
                      fontSize: 17, fontWeight: FontWeight.w600),
                ),
              )
            ],
            ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2,
            ),
            SizedBox(height: height*0.17,),
            Container(
                child: SizedBox(
                  height: height*0.3,
                  width: width,
                  child: Image.asset(
                    "assets/images/dnn 1.png",
                    fit: BoxFit.cover,

                  ),
                )),
            SizedBox(
              height: height*0.03,
            ),
            Expanded(
              child: Container(
                width: width,
                  decoration: BoxDecoration(
                    color: Color(0xffFAC63D),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0)),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 30,top: 30),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Text(
                          "audio books",
                          style: GoogleFonts.concertOne(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          "Spark your child's love for storytelling \nour engaging audio books,designed \n their creativity and foster lifelong live\n reading",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) {
                              return OnBoardingThree();
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
                      ]))
              ),
            )],
        ));
  }
}
