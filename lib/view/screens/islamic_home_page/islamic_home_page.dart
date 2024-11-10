import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treasure_of_books/view/screens/asma_ul_husna_splash_screen/asma_ul_husna_splash_screen.dart';
import 'package:treasure_of_books/view/screens/quran/quran.dart';

void main() {
  runApp(IslamicApp());
}

class IslamicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IslamicHomeScreen(),
    );
  }
}

class IslamicHomeScreen extends StatefulWidget {
  @override
  _IslamicHomeScreenState createState() => _IslamicHomeScreenState();
}

class _IslamicHomeScreenState extends State<IslamicHomeScreen> {
  int _currentIndex = 0;

  final List<String> _sliderImages = [
    'assets/images/quran.jpg',
    'assets/images/asma_ul_husna.jpg',
    'assets/images/ahadeeth.jpg',
    'assets/images/calender.jpg',
  ];

  final List<String> _titles = [
    'Quran',
    'Asma ul Husna',
    'Ahadees',
    'Islamic Calendar',
  ];

  final List<String> _descriptions = [
    'Read the holy Quran, the ultimate guide for Muslims.',
    'Explore the beautiful names of Allah and their meanings.',
    'Discover the sayings of Prophet Muhammad (PBUH).',
    'Stay updated with important Islamic dates and events.',
  ];

  final Color primaryColor = Color(0xffFAC63D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: Text(
          "Islamic Books",
          style: GoogleFonts.lato(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffFAC63D), Colors.orange.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          Column(
            children: [
              // Top Slider
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0, // Increased height for a more substantial look
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    viewportFraction: 0.85, // Reduce viewport fraction for a more focused effect
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: _sliderImages.asMap().entries.map((entry) {
                    int index = entry.key;
                    String imagePath = entry.value;

                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0), // Adjust margin for spacing
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), // More rounded corners for elegance
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25), // More pronounced shadow
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Overlay gradient for text visibility
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.6), // Darker overlay
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              // Centered text description
                              Positioned(
                                bottom: 20,
                                left: 20,
                                right: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _titles[index], // Title of the slide
                                      style: GoogleFonts.lato(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Explore the beauty and wisdom of Islamic literature. Dive into profound teachings and inspiring stories that shape our beliefs and values.',
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white70,
                                        height: 1.4, // Adjust line height for readability
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),


              // Navigation Options
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: _titles.length,
                  itemBuilder: (context, index) {


                    return GestureDetector(
                      onTap: () {
                        if(index==1){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) {
                            return AsmaUlHusnaSplashScreen();
                          },));
                        }else{
                          Navigator.push(context, CupertinoPageRoute(builder: (context) {
                            return QuranScreen();
                          }));
                        }


                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        transform: Matrix4.identity()..scale(1.05),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                _sliderImages[index % _sliderImages.length],
                                fit: BoxFit.cover,
                                color: Colors.black26, // Overlay color
                                colorBlendMode: BlendMode.darken,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.5),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Remove Icon and Add Title and Description
                                    Text(
                                      _titles[index],
                                      style: GoogleFonts.lato(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        _descriptions[index],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffFEE7B0), Color(0xffFAC63D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
