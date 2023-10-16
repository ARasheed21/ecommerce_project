import 'package:first_project/Screens/category_product_screen.dart';
import 'package:first_project/models/catogery_model.dart';
import 'package:first_project/repository/category_repo.dart';
import 'package:flutter/material.dart';

class CatogeryListView extends StatelessWidget {
  CatogeryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryRepo().getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          height: 105,
          //width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.data.categoryList.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CategoryProductScreen(id:snapshot.data!.data.categoryList[i].id);
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0x88EBF0FF),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 38,
                          child: Image.network(
                            snapshot.data!.data.categoryList[i].image,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      snapshot.data!.data.categoryList[i].name,
                      style: TextStyle(
                        color: Color(0xff9098B1),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
