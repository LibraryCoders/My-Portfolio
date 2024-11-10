import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treasure_of_books/view/screens/asma_ul_husna/asma_ul_husna.dart';

class AsmaUlHusnaHomeScreen extends StatefulWidget {
  const AsmaUlHusnaHomeScreen({super.key});

  @override
  State<AsmaUlHusnaHomeScreen> createState() => _AsmaUlHusnaHomeScreenState();
}

class _AsmaUlHusnaHomeScreenState extends State<AsmaUlHusnaHomeScreen> {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Scaffold(body: Container(width: width,height: height,decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/asma_home.png',),fit: BoxFit.fill)),child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return AsmaUlHusna();
          },));
        },
        child: Container(
          height: 50,
          width: width*0.55,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 2),
            color: Color(0xffF59B13),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              "Al-Asma-ul-Husna",
              style: GoogleFonts.dosis(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      SizedBox(height: 10,),
      GestureDetector(
        onTap: () {
       /*   Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return HomeScreen();
          },));*/
        },
        child: Container(
          height: 50,
          width: width*0.55,
          decoration: BoxDecoration(
            color: Color(0xffF59B13),
            border: Border.all(color: Colors.white,width: 2),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              "Share",
              style: GoogleFonts.dosis(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      SizedBox(height: 10,),
      GestureDetector(
        onTap: () {
          /*   Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return HomeScreen();
          },));*/
        },
        child: Container(
          height: 50,
          width: width*0.55,
          decoration: BoxDecoration(
            color: Color(0xffF59B13),
            border: Border.all(color: Colors.white,width: 2),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              "Rate",
              style: GoogleFonts.dosis(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    ],),),);
  }
}
