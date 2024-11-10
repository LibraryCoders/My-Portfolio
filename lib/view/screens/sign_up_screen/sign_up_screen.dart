import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treasure_of_books/view/screens/login_screen/login_screen.dart';
/*import package:emailjs/emailjs.dart as emailjs;*/
import "package:emailjs/emailjs.dart" as emailjs;
import 'package:treasure_of_books/view/screens/otp_screen/otp_screen.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isClick = false;
  bool isLoading=false;
  int otp=0;
  late TextEditingController textEditingController;
  late TextEditingController textEditingController2;
  late TextEditingController textEditingController1;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    textEditingController2.dispose();
    textEditingController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFAC63D),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 56,
              ),
              Text(
                "create account",
                style: GoogleFonts.concertOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                    color: Colors.black),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: textEditingController,
                style: TextStyle(color: Color(0xffA3470A)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xffA3470A)),
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xffA3470A)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  prefixIcon: Image.asset("assets/images/user.jpg"),
                  hintText: "full name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: textEditingController1,
                style: TextStyle(color: Color(0xffA3470A)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xffA3470A)),
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xffA3470A)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  prefixIcon: Image.asset("assets/images/sms.jpg"),
                  hintText: "email",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: textEditingController2,
                style: TextStyle(color: Color(0xffA3470A)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xffA3470A)),
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xffA3470A)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  prefixIcon: Image.asset("assets/images/lock.jpg"),
                  suffixIcon: Image.asset("assets/images/eye.jpg"),
                  hintText: "password",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: FittedBox(
                          child: Checkbox(
                            side: BorderSide(color: Color(0xffA3470A)),
                            activeColor:Color(0xffA3470A),
                            value: isClick,
                            onChanged: (value) {
                              setState(() {
                                isClick = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Text(
                        "i agree to the",
                        style: GoogleFonts.dosis(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA3470A),
                        ),
                      ),
                      Text(
                        " term ",
                        style: GoogleFonts.dosis(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        " and ",
                        style: GoogleFonts.dosis(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA3470A),
                        ),
                      ),
                      Text(
                        "privacy policy.",
                        style: GoogleFonts.dosis(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 120,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLoading=true;
                  });
                  otp=Random().nextInt(1000000);
                  try {
                    emailjs.send("service_fzys2cl","template_pp3eojr",
                        {
                      "to_name": "${textEditingController.text}",
                      "message": "Welcome to Treasure of Books, your gateway to a world of captivating stories and knowledge. To complete your registration, please use the OTP (One-Time Password) below to verify your email:"
                        "Your OTP: ${otp}"

                       "For your security, please do not share this code with anyone."

                        "If you did not request this code, please ignore this email."

                        "Thank you for joining Treasure of Books! We’re excited to have you embark on your reading journey with us.",
                      "reply_to": "${textEditingController1.text}",
                    },emailjs.Options(privateKey: "Ob_YLEy8Nu49rqYJgMOVA",publicKey: "6E-suaRvL2R-zIPKa"));
                    print("Success");
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return OtpVerificationScreen(textEditingController1.text, textEditingController.text, textEditingController2.text, otp);
                    },));

                  } on Exception catch (e) {
                    print(e.toString());
                    // TODO
                  }

                  setState(() {
                    isLoading=false;
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffD55D0D),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Center(
                    child: isLoading?CircularProgressIndicator(): Text(
                      "Sign up",
                      style: GoogleFonts.dosis(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account? ",
                          style: GoogleFonts.dosis(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA3470A),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) {
                        return LoginScreen();
                      },));
                          },
                          child: Text(
                            "Log In",
                            style: GoogleFonts.dosis(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ])

            ]),
          ),
        ));
  }
}
