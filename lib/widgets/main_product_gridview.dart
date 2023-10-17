import 'package:first_project/Screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class MainProductGridView extends StatelessWidget {
  final ProductItemB productItem;
  const MainProductGridView({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(productItemB: productItem);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Color(0xffEBF0FF)),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            productItem.image,
            width: MediaQuery.of(context).size.width,
            height: 133,
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Color(0xffFFC833),
                size: 12,
              ),
              Icon(
                Icons.star,
                color: Color(0xffFFC833),
                size: 12,
              ),
              Icon(
                Icons.star,
                color: Color(0xffFFC833),
                size: 12,
              ),
              Icon(
                Icons.star,
                color: Color(0xffFFC833),
                size: 12,
              ),
              Icon(
                Icons.star,
                color: Color(0xffEBF0FF),
                size: 12,
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            productItem.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xff223263),
            ),
          ),
          SizedBox(height: 8),
          Text(
            productItem.price.toString(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xff40BFFF),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                productItem.oldPrice.toString(),
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9098B1),
                    decoration: TextDecoration.lineThrough),
              ),
              SizedBox(width: 8),
              Text(
                "${productItem.discount}% Off",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFB7181),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
