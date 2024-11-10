import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "package:emailjs/emailjs.dart" as emailjs;
import 'package:treasure_of_books/repositories/api_services.dart';
import 'package:treasure_of_books/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  String email;
  String name;
  String password;
  int otp;


  OtpVerificationScreen(this.email, this.name, this.password, this.otp);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();
  int otp=0;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('OTP Verification'),
        centerTitle: true,
        backgroundColor: Color(0xfff57c00), // Orange color as primary
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter the OTP sent to your number',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            _otpTextField(context),

            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {

                setState(() {
                  isLoading=true;
                });
                if(widget.otp==int.parse(_otpController.text)){
                  try {
                    ApiService()
                        .signup(widget.name,"librarycoders@gmail.com", widget.password);
                    Navigator.push(context, CupertinoPageRoute(
                      builder: (context) {
                        return BottomNavigationScreenSeller();
                      },
                    ));
                  } catch (e) {
                    print(e.toString());
                  }
                }

                setState(() {
                  isLoading=false;
                });



              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff57c00), // Primary color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: isLoading?CircularProgressIndicator(color: Colors.white,):Text(
                'Verify',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {  setState(() {
                isLoading=true;
              });
              otp=Random().nextInt(1000000);
              try {
                emailjs.send("service_fzys2cl","template_pp3eojr",
                    {
                      "to_name": "${widget.name}",
                      "message": "Welcome to Treasure of Books, your gateway to a world of captivating stories and knowledge. To complete your registration, please use the OTP (One-Time Password) below to verify your email:"
                          "Your OTP: ${otp}"

                          "For your security, please do not share this code with anyone."

                          "If you did not request this code, please ignore this email."

                          "Thank you for joining Treasure of Books! We’re excited to have you embark on your reading journey with us.",
                      "reply_to": "${widget.email}",
                    },emailjs.Options(privateKey: "Ob_YLEy8Nu49rqYJgMOVA",publicKey: "6E-suaRvL2R-zIPKa"));
                print("Success");


              } on Exception catch (e) {
                print(e.toString());
                // TODO
              }

              setState(() {
                isLoading=false;
              }); // Handle resend OTP logic here
              },
              child:isLoading?CircularProgressIndicator(color: Colors.white,): Text(
                'Resend OTP',
                style: TextStyle(
                  color: Color(0xfff57c00),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xfff57c00)),
      ),
      child: TextField(
        controller: _otpController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
