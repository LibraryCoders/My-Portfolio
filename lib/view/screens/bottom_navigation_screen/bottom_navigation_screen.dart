import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treasure_of_books/constants/constants.dart';
import 'package:treasure_of_books/view/screens/asma_ul_husna_splash_screen/asma_ul_husna_splash_screen.dart';
import 'package:treasure_of_books/view/screens/islamic_home_page/islamic_home_page.dart';

import '../home_screen/home_screen.dart';








// ignore: must_be_immutable
class BottomNavigationScreenSeller extends StatefulWidget {
  BottomNavigationScreenSeller({
    Key? key,
    this.currentIndex = 0,
  });
  int currentIndex = 0;

  @override
  State<BottomNavigationScreenSeller> createState() => _BottomNavigationScreenSellerState();
}

class _BottomNavigationScreenSellerState extends State<BottomNavigationScreenSeller> {
  List<IconData> items = [
    Icons.home,
    Icons.event_available,
    Icons.groups_rounded,
    Icons.calendar_month,
    Icons.menu,

  ];

  final List<Widget> _children = [
    HomeScreen(),
    IslamicHomeScreen(),
    AsmaUlHusnaSplashScreen(),
   /* Calender(),
    Profile()*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[widget.currentIndex],
      bottomNavigationBar: Container(
        height: Platform.isIOS ? null : 65,
        decoration:  BoxDecoration(
          color: Colors.white,

        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: appOrangeColor,
          onTap: (index) async {

            setState(() {
              widget.currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.currentIndex,
          showSelectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: List.generate(
            items.length,
                (index) {
              return BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: widget.currentIndex == index
                            ? CupertinoColors.activeGreen
                            : Colors.lightGreen.withOpacity(0.50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(items[index]),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 5,
                        width: 48,
                        decoration: BoxDecoration(
                          color: widget.currentIndex == index
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: '',
              );
            },
          ),
        ),
      ),
    );
  }
}

/*class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNavItemTapped(int index) async {
    if (AuthModel().authentication.currentUser == null) {
      // Show a dialog if the user is null
      await GeneralDialogs.showLoginDialogue(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          HomeScreen(),
          LikesScreen(),
          MyAds(),
          SettingsAndProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: _onNavItemTapped,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: AppColors.brownTwo,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
            activeColor: AppColors.brownTwo,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.ads_click),
            title: Text('My Ads'),
            activeColor: AppColors.brownTwo,
          ),
          BottomNavyBarItem(
            icon: AuthModel().authentication.currentUser==null ?GestureDetector(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder:  (context){
                return SettingsAndProfileScreen();
              }));
            },child: Icon(Icons.person)) : Icon(Icons.person),
            title: Text('Profile'),
            activeColor: AppColors.brownTwo,
          ),
        ],
      ),
    );
  }
}*/

