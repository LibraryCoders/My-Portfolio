import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:treasure_of_books/view/screens/login_screen/login_screen.dart';
import 'package:treasure_of_books/view/screens/pdf_viewer_screen/pdf_viewer_screen.dart';

import '../../../constants/constants.dart';
import '../../../models/book.dart';
import '../islamic_home_page/islamic_home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> queries = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    queries = _getRandomQueries();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async{
                          SharedPreferences shared=await SharedPreferences.getInstance();
                          shared.setBool("isLogin", false);
                          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) {
                            return LoginScreen();
                          },), (route) => false,);
                        },
                        child: Container(
                          width: 140,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: appOrangeColor),
                          child: Center(
                            child: Text(
                              "log out",
                              style: GoogleFonts.dosis(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade100,
                                      ),
                                      right: BorderSide(
                                          color: Colors.grey.shade100)),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 5,
                                        offset: Offset(-5, -5),
                                        inset: true),
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        blurRadius: 8,
                                        offset: Offset(6, 6),
                                        inset: true),
                                  ]),
                              height: 45,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    color: appOrangeColor,
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        ),
                        SizedBox(
                          height: 25,
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                        )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    width: width,
                    height: height * 0.22,
                    decoration: BoxDecoration(
                        color: appOrangeColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.28,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "ready for a",
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              Text(
                                "journey?",
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 100,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Color(0xffD55D0D),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30)),
                                ),
                                child: Center(
                                  child: Text(
                                    "Read",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Image.asset(
                          "assets/images/dns 1.png",
                        )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      SizedBox(
                          width: width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "quran-e-pak",
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, CupertinoPageRoute(
                                    builder: (context) {
                                      return IslamicHomeScreen();
                                    },
                                  ));
                                },
                                child: SizedBox(
                                    height: height * 0.18,
                                    width: width * 0.45,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/images/quran.PNG",
                                          fit: BoxFit.fill,
                                        ))),
                              )
                            ],
                          )),
                      Expanded(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      SizedBox(
                          width: width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "audio books",
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                  height: height * 0.18,
                                  width: width * 0.45,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "assets/images/audio_books.png",
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: queries.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            queries[index],
                            style: GoogleFonts.concertOne(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        FutureBuilder<List<Book>>(
                          future:
                              fetchBooks(), // Call your modified API fetching function here
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: height * 0.15,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(left: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              CupertinoPageRoute(
                                            builder: (context) {
                                              return PDFViewerScreen(
                                                  pdfLink: snapshot
                                                      .data![index].pdfLink);
                                            },
                                          ));
                                        },
                                        child: SizedBox(
                                          width: width * 0.26,
                                          height: height * 0.15,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageUrl: snapshot
                                                  .data![index].thumbnail,
                                              placeholder: (context, url) =>
                                                  Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: SizedBox(
                                                  width: width * 0.26,
                                                  height: height * 0.15,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: SizedBox(
                                                      height: height * 0.13,
                                                      width: width * 0.3,
                                                      child: Shimmer.fromColors(
                                                          baseColor:
                                                              Color(0xffFDF1E6),
                                                          highlightColor:
                                                              Color(0xffFFE09A),
                                                          child: Container(
                                                            color: Colors
                                                                .grey.shade50,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.book),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }else{
                              return SizedBox(
                                height: height * 0.15,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(left: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: InkWell(
                                        onTap: () {

                                        },
                                        child: SizedBox(
                                          width: width * 0.26,
                                          height: height * 0.15,
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(left: 5),
                                              child: SizedBox(
                                                width: width * 0.26,
                                                height: height * 0.15,
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                  child: SizedBox(
                                                    height: height * 0.13,
                                                    width: width * 0.3,
                                                    child: Shimmer.fromColors(
                                                        baseColor:
                                                        Color(0xffFDF1E6),
                                                        highlightColor:
                                                        Color(0xffFFE09A),
                                                        child: Container(
                                                          color: Colors
                                                              .grey.shade50,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ),
                                          ),
                                        ),
                                      );
                                  },
                                ),
                              );
                            }

                            /*else{
                              return GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(left: 10),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: SizedBox(
                                      width: width * 0.26,
                                      height: height * 0.15,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: SizedBox(
                                          height: height * 0.13,
                                          width: width * 0.3,
                                          child: Shimmer.fromColors(
                                              baseColor: Color(0xffFDF1E6),
                                              highlightColor: Color(0xffFFE09A),
                                              child: Container(
                                                color: Colors.grey.shade50,
                                              )),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }*/

                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Book>> fetchBooks() async {
  final url = Uri.parse('https://teasurebooks.vercel.app/api/books');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decode the JSON response
      final List<dynamic> jsonData = json.decode(response.body);

      // Map the JSON to a list of Book objects
      return jsonData.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed to load books. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching books: $e');
  }
}

List<String> _getRandomQueries() {
  // Updated list of top searched and most readable queries
  List<String> queries = [
    "Fiction",
    "Non-Fiction",
    "Science Fiction",
    "Islamic",
    "Urdu",
    "Harry Potter",
    "Fantasy",
    "Children's Books",
    "Young Adult (YA) Fiction",
    "Mystery & Thrillers",
    "Romance",
    "Biographies & Memoirs",
    "History",
    "Self-Help",
    "Comics",
    "Graphic Novels",
    "Classics",
    "Poetry",
    "Religious Books", // New category
    "Urdu Novels", // New category
    "Urdu Stories", // New category
    "English Novels", // New category
    "English Stories" // New category
  ];

  // Shuffle the list to get random queries
  queries.shuffle(Random());

  // Return the first 5 unique queries
  return queries.take(5).toList();
}
