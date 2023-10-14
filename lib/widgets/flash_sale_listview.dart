import 'package:flutter/material.dart';

import '../models/product_model.dart';

class FlashSaleListView extends StatelessWidget {
  final ProductItemB flashSaleItem;

   FlashSaleListView({super.key, required this.flashSaleItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xffEBF0FF)),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 141,
      height: 238,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            flashSaleItem.image,
            width: 109,
            height: 109,
          ),
          SizedBox(height: 8),
          Text(
          flashSaleItem.name,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xff223263),
            ),
          ),
          SizedBox(height: 8),
          Text(
            flashSaleItem.price.toString(),
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
                "\$${flashSaleItem.oldPrice}",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9098B1),
                    decoration: TextDecoration.lineThrough
                ),
              ),
              SizedBox(width: 8),
              Text(
                "${flashSaleItem.discount}% Off",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFB7181),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


