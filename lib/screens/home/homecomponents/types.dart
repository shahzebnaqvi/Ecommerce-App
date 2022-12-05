import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Typecate extends StatelessWidget {
  const Typecate({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/FlashIcon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/BillIcon.svg", "text": "Bill"},
      {"icon": "assets/icons/GameIcon.svg", "text": "Game"},
      {"icon": "assets/icons/GiftIcon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 55,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 157, 248, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      categories[index]["icon"],
                      width: 18.0,
                      height: 18.0,
                      color: Colors.purple,
                    ),
                  ),
                  // child: SvgPicture.asset(icon!),

                  SizedBox(height: 5),
                  Text(categories[index]["text"], textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
