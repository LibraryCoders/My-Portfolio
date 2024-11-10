import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treasure_of_books/view/screens/sign_up_screen/sign_up_screen.dart';

class OnBoardingThree extends StatefulWidget {
  const OnBoardingThree({super.key});

  @override
  State<OnBoardingThree> createState() => _OnBoardingThreeState();
}

class _OnBoardingThreeState extends State<OnBoardingThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/abc.png"),
                    fit: BoxFit.fill)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "lets Start!",
                  style: GoogleFonts.concertOne(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
              ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) {
                          return SignUpScreen();
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
                            "start",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
            ])));
  }
}
