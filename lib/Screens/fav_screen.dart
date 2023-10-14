import 'package:first_project/Screens/home_screen.dart';
import 'package:first_project/widgets/fav_product_gridview.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../utils/colors.dart';
import '../widgets/main_product_gridview.dart';

class FavScreen extends StatelessWidget {
  FavScreen({super.key});
  
  final List<ProductModel> favProductList = ProductModel.ProductList.where((element) => element.isFav == true).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(8),
                leading: GestureDetector(
                  child: Icon(Icons.arrow_back_ios_new_rounded,size: 24),
                  onTap: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),);
                  }
                ),
                title: Text(
                  "Favourite Products",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.textColor,
                  ),
                ),
                trailing: Icon(Icons.search, size: 24),
              ),
              Divider(),
              Container(
                //height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.all(16),
                child: GridView.builder(
                    itemCount: favProductList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:0.62,
                      mainAxisSpacing:12,
                      crossAxisSpacing: 12,
                    ),
                    itemBuilder: (context,i){
                      return FavProductGridView(favProductItem: favProductList[i]);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
