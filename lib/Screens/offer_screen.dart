// import 'package:first_project/Screens/home_screen.dart';
// import 'package:first_project/utils/colors.dart';
// import 'package:flutter/material.dart';
//
// import '../models/product_model.dart';
// import '../widgets/main_product_gridview.dart';
//
// class OfferScreen extends StatelessWidget {
//   OfferScreen({super.key});
//
//   final List<ProductModel> mainProductList = [
//     ProductModel(
//         image: 'assets/images/5.png',
//         name: 'MS - Nike Air Max 270 React',
//         price: 299.43),
//     ProductModel(
//         image: 'assets/images/5.png',
//         name: 'MS - Nike Air Max 270 React',
//         price: 299.43),
//     ProductModel(
//         image: 'assets/images/5.png',
//         name: 'MS - Nike Air Max 270 React',
//         price: 299.43),
//     ProductModel(
//         image: 'assets/images/5.png',
//         name: 'MS - Nike Air Max 270 React',
//         price: 299.43),
//     ProductModel(
//         image: 'assets/images/5.png',
//         name: 'MS - Nike Air Max 270 React',
//         price: 299.43),
//     ProductModel(
//         image: 'assets/images/5.png',
//         name: 'MS - Nike Air Max 270 React',
//         price: 299.43),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ListTile(
//                 contentPadding: EdgeInsets.all(16),
//                 leading: GestureDetector(
//                   child: Icon(Icons.arrow_back_ios_new_rounded, size: 24),
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return HomeScreen();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 title: Text(
//                   "Super Flash Sale",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 16,
//                     color: AppColors.textColor,
//                   ),
//                 ),
//                 trailing: Icon(Icons.search, size: 24),
//               ),
//               Divider(),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 206,
//                 margin: EdgeInsets.all(8),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/sale_img.png"),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Super Flash Sale\n50% Off",
//                       style: TextStyle(
//                         color: Color(0xffFFFFFF),
//                         fontWeight: FontWeight.w700,
//                         fontSize: 24,
//                       ),
//                     ),
//                     SizedBox(height: 29),
//                     Row(
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           width: 42,
//                           height: 42,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                           ),
//                           child: Text(
//                             "08",
//                             style: TextStyle(
//                               color: Color(0xff223263),
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16,
//                               letterSpacing: 0.5,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 12,
//                           child: Text(
//                             ":",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color(0xffFFFFFF),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           alignment: Alignment.center,
//                           width: 42,
//                           height: 42,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                           ),
//                           child: Text(
//                             "34",
//                             style: TextStyle(
//                               color: Color(0xff223263),
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16,
//                               letterSpacing: 0.5,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 12,
//                           child: Text(
//                             ":",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Color(0xffFFFFFF),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           alignment: Alignment.center,
//                           width: 42,
//                           height: 42,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                           ),
//                           child: Text(
//                             "52",
//                             style: TextStyle(
//                               color: Color(0xff223263),
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16,
//                               letterSpacing: 0.5,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(8),
//                 child: GridView.builder(
//                     itemCount: mainProductList.length,
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 0.65,
//                     ),
//                     itemBuilder: (context, i) {
//                       return MainProductGridView(
//                         productItem: mainProductList[i],
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
