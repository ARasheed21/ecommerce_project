import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project/Screens/fav_screen.dart';
import 'package:first_project/Screens/offer_screen.dart';
import 'package:flutter/material.dart';
import '../models/catogery_model.dart';
import '../models/product_model.dart';
import '../repository/product_repo.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/catogery_listview.dart';
import '../widgets/flash_sale_listview.dart';
import '../widgets/main_product_gridview.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/shirt.png'},
    {"id": 2, "image_path": 'assets/images/dress.png'},
    {"id": 3, "image_path": 'assets/images/man_bag.png'},
    {"id": 4, "image_path": 'assets/images/woman_bag.png'},
    {"id": 5, "image_path": 'assets/images/dress.png'},
    {"id": 6, "image_path": 'assets/images/shirt.png'}
  ];
  List <String> imageList2 = [
    'assets/images/shirt.png',
    'assets/images/dress.png',
    'assets/images/man_bag.png',
    'assets/images/woman_bag.png',
    'assets/images/dress.png',
    'assets/images/shirt.png'
  ];

  static const image = "assets/images/flash_sale1.png";
  static const image2 = "assets/images/flash_sale2.png";


  final List<ProductModel> flashSaleProductList = ProductModel.ProductList.where((e) => e.hasSale == true).toList();


  final List<ProductModel> mainProductList = [
    ProductModel(
        image: 'assets/images/5.png',
        name: 'MS - Nike Air Max 270 React',
        price: 299.43),
    ProductModel(
        image: 'assets/images/5.png',
        name: 'MS - Nike Air Max 270 React',
        price: 299.43),
    ProductModel(
        image: 'assets/images/5.png',
        name: 'MS - Nike Air Max 270 React',
        price: 299.43),
    ProductModel(
        image: 'assets/images/5.png',
        name: 'MS - Nike Air Max 270 React',
        price: 299.43),
    ProductModel(
        image: 'assets/images/5.png',
        name: 'MS - Nike Air Max 270 React',
        price: 299.43),
    ProductModel(
        image: 'assets/images/5.png',
        name: 'MS - Nike Air Max 270 React',
        price: 299.43),
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;
  int selectedNavItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Color(0xff40BFFF)),
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: Color(0xff9098B1)),
          showUnselectedLabels: true,
          iconSize: 20,
          currentIndex: selectedNavItem,
          onTap: (index) {
            setState(() {
              selectedNavItem = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: "Cart", icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(
                label: "Offer", icon: Icon(Icons.local_offer_outlined)),
            BottomNavigationBarItem(
                label: "Account", icon: Icon(Icons.person_2_outlined)),
          ]),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 16),

              //search bar - fav - notification
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 45,
                    margin: EdgeInsets.all(12),
                    //height: 35,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                  GestureDetector(
                      child: Icon(Icons.favorite_border_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FavScreen()),
                        );
                      }),
                  Icon(Icons.notification_add_outlined),
                ],
              ),

              Divider(),

              //Carouser
              MyCarouselSlider(),

              //Catogery Texts
              Container(
                margin: EdgeInsets.fromLTRB(16, 24, 16, 12),
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Catogery",
                      style: TextStyle(
                        color: Color(0xff223263),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "More Catogery",
                      style: TextStyle(
                        color: Color(0xff40BFFF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              //Catogery ListView
              CatogeryListView(),

              //Flash Sale Text
              Container(
                margin: EdgeInsets.fromLTRB(16, 24, 16, 12),
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Flash Sale",
                      style: TextStyle(
                        color: Color(0xff223263),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                        color: Color(0xff40BFFF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              //Flash Sale ListView
              FutureBuilder(
                future: ProductRepo().getProducts(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.data.productListB.length,
                      itemBuilder: (context, i) {
                        return FlashSaleListView(
                            flashSaleItem: snapshot.data!.data.productListB.where((e) => e.discount!= 0).toList()[i]);
                      },
                    ),
                  );
                },
              ),

              SizedBox(
                height: 14,
              ),

              //Recommended Products
              Container(
                //color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: 206,
                margin: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/reco_product.png"),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 48,
                      left: 24,
                      child: Column(
                        children: [
                          Text(
                            "Recommended\nProduct",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "We recommend the best for you",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //GridView Product
              /*Container(
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: mainProductList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, i) {
                    return MainProductGridView(
                      productItem: mainProductList[i],
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
