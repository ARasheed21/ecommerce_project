import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project/Screens/home_screen.dart';
import 'package:first_project/models/product_model.dart';
import 'package:first_project/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductItemB productItemB;
  ProductDetailScreen({super.key, required this.productItemB});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ),
                      );
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  title: Text(
                    widget.productItemB.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                // Carousel slider
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Stack(
                    children: [
                      CarouselSlider.builder(
                        carouselController: carouselController,
                        itemCount: widget.productItemB.images.length,
                        options: CarouselOptions(
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            }),
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(widget.productItemB.images[itemIndex]),
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.productItemB.images.map((e) {
                              return GestureDetector(
                                onTap: () =>
                                    carouselController.animateToPage(widget.productItemB.images.indexOf(e)),
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentIndex == widget.productItemB.images.indexOf(e)
                                        ? Color(0xff40BFFF)
                                        : Color(0xffEBF0FF),
                                  ),
                                ),
                              );
                            }).toList()),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 16,
                ),
                //product name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.productItemB.name,
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textColor),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 24,
                      color: Color(0xff9098B1),
                    ),
                  ],
                ),

                SizedBox(
                  height: 8,
                ),

                //stars
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xffFFC833),
                      size: 25,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffFFC833),
                      size: 25,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffFFC833),
                      size: 25,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffFFC833),
                      size: 25,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffEBF0FF),
                      size: 25,
                    ),
                  ],
                ),

                SizedBox(
                  height: 16,
                ),

                //product price
                Text(
                  "\$${widget.productItemB.price}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor),
                ),

                SizedBox(
                  height: 24,
                ),

                //Describtion Text
                Text(
                  "Describtion",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor),
                ),

                SizedBox(
                  height: 16,
                ),

                //product describtion
                Text(
                  widget.productItemB.description,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9098B1),
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                // add to cart button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    width: 343,
                    height: 57,
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 8,
                          color: Color(0x1532470D), // #3232470D with 5% opacity
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
