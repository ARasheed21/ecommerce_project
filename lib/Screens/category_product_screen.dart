import 'package:first_project/models/product_model.dart';
import 'package:first_project/repository/category_product_repo.dart';
import 'package:flutter/material.dart';

import '../widgets/main_product_gridview.dart';
import 'home_screen.dart';

class CategoryProductScreen extends StatelessWidget {
  final int id;
  final String name;
  const CategoryProductScreen({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: CategoryProductRepo().getCategoryProducts(id),
          builder: (context,snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }

            return  Column(
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
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                Container(
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
                ),
              ]
            );

          },
        ),
      ),
    );
  }
}
