import 'package:eccomerceapp/screens/home/homecomponents/home_headings.dart';
import 'package:eccomerceapp/services/constant.dart';
import 'package:eccomerceapp/services/product/view_product_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: HomeHeading(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: 200,
                child: FutureBuilder(
                    future: getproducts(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        // print("object  :null data  ${snapshot.data}");
                        return Container();
                      } else {
                        // print(snapshot.data.featurespod);
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // itemCount: 2,
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                  productimage:
                                      "${baseurlimages}${snapshot.data.data[index].thumbnailImage}",
                                  price:
                                      "${snapshot.data.data[index].mainPrice}",
                                  producttitle:
                                      "${snapshot.data.data[index].name}");
                            });
                      }
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      this.width = 140,
      this.aspectRetio = 1.02,
      required this.productimage,
      required this.price,
      required this.producttitle})
      : super(key: key);

  final double width, aspectRetio;
  final String productimage;
  final String price;
  final String producttitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        width: width,
        child: GestureDetector(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(productimage, errorBuilder:
                      (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                    return const Text('😢');
                  }),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${producttitle}",
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${price}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                            color: Color(0xFFFF4848)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
