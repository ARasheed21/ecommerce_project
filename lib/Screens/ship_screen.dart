import 'package:first_project/Screens/cart_screen.dart';
import 'package:first_project/Screens/add_address_screen.dart';
import 'package:first_project/utils/colors.dart';
import 'package:flutter/material.dart';

class ShipScreen extends StatelessWidget {
  const ShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10,),
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CartScreen();
                        },
                      ),
                    );
                  },
                  child: Icon(Icons.arrow_back),
                ),
                title: Text(
                  "Ship To",
                  style: TextStyle(
                    color: Color(0xff223263),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 2, color: Color(0xffEBF0FF)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Priscekila",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9098B1),
                      ),
                    ),
                    Text(
                      "+99 1234567890",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9098B1),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 77,
                          height: 57,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffEBF0FF),
                            ),
                          ),
                          child: Text(
                            "Edit",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return EditAddressScreen();
                  },),);
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: 366,
                  height: 64,
                  child: Text(
                    "Add Address",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
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
    );
  }
}
