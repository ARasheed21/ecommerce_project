import 'package:first_project/models/product_model.dart';
import 'package:first_project/repository/category_product_repo.dart';
import 'package:flutter/material.dart';

import '../widgets/main_product_gridview.dart';

class CategoryProductScreen extends StatelessWidget {
  final int id;
  const CategoryProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: FutureBuilder(
        future: CategoryProductRepo().getCategoryProducts(id),
        builder: (context,snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }

          return  Container(
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.data.productListB.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, i) {
                return MainProductGridView(
                  productItem: snapshot.data!.data.productListB[i],
                );
              },
            ),
          );

        },
      ),
    );
  }
}
