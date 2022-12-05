import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              // HomeHeader(),
              SizedBox(height: 10),
              // DiscountBanner(),
              // Categories(),
              // SpecialOffers(),
              SizedBox(height: 30),
              // PopularProducts(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
