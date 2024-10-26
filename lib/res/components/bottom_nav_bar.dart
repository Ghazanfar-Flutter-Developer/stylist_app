import 'package:flutter/material.dart';
import 'package:savey_econers/res/colors.dart';
import 'package:savey_econers/screen/AI%20ChatBot/chat_screen.dart';
import 'package:savey_econers/screen/cart_screen.dart';
import 'package:savey_econers/screen/favourite_screen.dart';
import 'package:savey_econers/screen/home_screen.dart';
import 'package:savey_econers/screen/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;
  List screens = const [
    ChatScreen(),
    FavouriteScreen(),
    HomeScreen(),
    CartScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: AppColor.kprimaryColor,
        child: const Icon(
          Icons.home,
          size: 35,
          color: AppColor.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 50,
        color: AppColor.kcontentColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.support_agent,
                size: 25,
                color: currentIndex == 0
                    ? AppColor.kprimaryColor
                    : AppColor.greyColor,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                size: 25,
                color: currentIndex == 1
                    ? AppColor.kprimaryColor
                    : AppColor.greyColor,
              ),
            ),
            const SizedBox(width: 15),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color: currentIndex == 3
                    ? AppColor.kprimaryColor
                    : AppColor.greyColor,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person_2_outlined,
                size: 25,
                color: currentIndex == 4
                    ? AppColor.kprimaryColor
                    : AppColor.greyColor,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
