import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/banner_model.dart';
import '../repository/banner_repo.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BannerRepo().getBanners(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasData){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: snapshot.data!.bannersList.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      //scrollPhysics: const BouncingScrollPhysics(),
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(snapshot.data!.bannersList[itemIndex].image),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 24),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Super Flash Sale\n50% Off",
                                    style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(height: 29),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 42,
                                        width: 42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          "08",
                                          style: TextStyle(
                                            color: Color(0xff223263),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                        child: Text(
                                          ":",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 42,
                                        width: 42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          "34",
                                          style: TextStyle(
                                            color: Color(0xff223263),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                        child: Text(
                                          ":",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 42,
                                        width: 42,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          "52",
                                          style: TextStyle(
                                            color: Color(0xff223263),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ],
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
                      children: [0,1,2,3,4,5,6,7,8,9].map((e) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(e),
                          child: Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == e
                                  ? Color(0xff40BFFF)
                                  : Color(0xffEBF0FF),
                            ),
                          ),
                        );
                      }).toList()
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      }

    );
  }
}



