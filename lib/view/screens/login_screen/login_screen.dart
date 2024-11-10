import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treasure_of_books/view/screens/home_screen/home_screen.dart';
import 'package:treasure_of_books/view/screens/sign_up_screen/sign_up_screen.dart';

import '../../../repositories/api_services.dart';
import '../bottom_navigation_screen/bottom_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isClick = false;
  bool isLoaing=false;
  late TextEditingController textEditingController;
  late TextEditingController textEditingController1;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController1 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    textEditingController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFAC63D),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: 56,
                  ),
                  Text(
                    "Login your account",
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
                      labelStyle:
                          GoogleFonts.poppins(fontSize: 14, color: Color(0xffA3470A)),
                      hintStyle:
                          GoogleFonts.poppins(fontSize: 20, color: Color(0xffA3470A)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      prefixIcon: Image.asset("assets/images/user.jpg"),
                      hintText: "Email",
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
                      labelStyle:
                          GoogleFonts.poppins(fontSize: 14, color: Color(0xffA3470A)),
                      hintStyle:
                          GoogleFonts.poppins(fontSize: 20, color: Color(0xffA3470A)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      prefixIcon: Image.asset("assets/images/lock.jpg"),
                      suffixIcon: Image.asset("assets/images/eye.jpg"),
                      hintText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "Remember me",
                                style: GoogleFonts.dosis(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffA3470A),
                                ),
                              ),
          
                            ]),
                        Text(
                          " Forget Password?",
                          style: GoogleFonts.dosis(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA3470A),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () async {
                      try{


                       await ApiService().signin(textEditingController.text, textEditingController1.text);
                        //Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            CupertinoPageRoute(
                              builder: (context) {
                                return BottomNavigationScreenSeller();
                              },
                            ));
                      }catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is an erro ${e.toString()}")));

          
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffD55D0D),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: GoogleFonts.dosis(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.dosis(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA3470A),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //Navigator.pop(context);
                            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) {
                              return SignUpScreen();
                            },));
                          },
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.dosis(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]),
          
          
          
          
          
                ]),
              ),
          
              SizedBox(width: MediaQuery.of(context).size.width,child: Image.asset("assets/images/sign_up.png",fit: BoxFit.fitWidth,)),
          
            ],
          ),
        ));
  }
}
