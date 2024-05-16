// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shoesly/main.g.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> productList = [
    Product(name: 'Jordan 1 Retro High Tie Dye', price: 10.00),
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice =
        productList.fold(0, (sum, product) => sum + product.price * product.quantity);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 22.sp,
          right: 22.sp,
          top: 8.sp,
        ),
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
              width: 94.w,
              height: 58.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Grand",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7),
                    ),
                  ),
                  // const Spacer(),
                  Text(
                    "\$ ${totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .4,
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Utilities.pushNamed(context, ShoeslyRoutes.orderSummary);
                },
                child: Container(
                  height: 54.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100.sp),
                  ),
                  child: Center(
                    child: Text(
                      "CHECK OUT ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.sp,
          // vertical: 30.sp,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return SizedBox(
                    width: double.infinity,
                    height: 92.h,
                    child: Row(
                      children: [
                        Container(
                          height: 88.h,
                          width: 88.w,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(30.sp),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Picture(
                              source: Asset.images.addidasbold,
                            ),
                          ),
                        ),
                        15.horizontalSpace,
                        Expanded(
                            child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff101010),
                                ),
                              ),
                              5.verticalSpace,
                              Text(
                                "Nike . Red Gray . 40",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff666666),
                                ),
                              ),
                              10.verticalSpace,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff101010),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 84.w,
                                      height: 30.h,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (product.quantity > 1) {
                                                  product.quantity--;
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: 30.w,
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 2.sp,
                                                    color: Colors.black,
                                                  )),
                                              child: Center(
                                                child: FaIcon(
                                                  FontAwesomeIcons.minus,
                                                  color: Colors.black45,
                                                  size: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            product.quantity.toString(),
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff101010),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                product.quantity++;
                                              });
                                            },
                                            child: Container(
                                              width: 30.w,
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 2.sp,
                                                    color: Colors.black,
                                                  )),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                  size: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return 30.verticalSpace;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int quantity;
  Product({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
