import 'package:eccomerceapp/screens/home/homecomponents/banner.dart';
import 'package:eccomerceapp/screens/home/homecomponents/header.dart';
import 'package:eccomerceapp/screens/home/homecomponents/products.dart';
import 'package:eccomerceapp/screens/home/homecomponents/special_deals.dart';
import 'package:eccomerceapp/screens/home/homecomponents/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [Header(),
              SizedBox(height: 20),
              BannerComp(),
              Typecate(),
              SpecialDeals(),
              SizedBox(height: 30),
              Products(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottombarcustomdesign(selectedMenu: 'home'),
    );
  }
}

class Bottombarcustomdesign extends StatelessWidget {
  const Bottombarcustomdesign({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/ShopIcon.svg",
                    color:
                        'home' == selectedMenu ? Colors.red : inActiveIconColor,
                  ),
                  onPressed: () {}),
              IconButton(
                icon: SvgPicture.asset("assets/icons/HeartIcon.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/ChatbubbleIcon.svg"),
                onPressed: () {},
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/FlashIcon.svg",
                    color: 'profile' == selectedMenu
                        ? Colors.red
                        : inActiveIconColor,
                  ),
                  onPressed: () {}),
            ],
          )),
    );
  }
}
