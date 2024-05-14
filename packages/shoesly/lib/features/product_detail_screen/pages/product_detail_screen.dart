import 'package:flutter/material.dart';
import 'package:shoesly/main.g.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int tappedIndex = 0;
  int tappedSized = 0;

  final TextEditingController quantityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    quantityController.text = '1';
  }

  List<String> size = ['39', '39.5', '40', '40.5', '41'];

  List<ReviewModel> reviewList = [
    ReviewModel(
        name: 'Nolan Carder',
        description: 'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Maria Saris',
        description: 'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Gretchen Septimus',
        description: 'Perfect for keeping your feet dry and warm in damp conditions.'),
  ];

  List<Color> color = [
    const Color(0xffE7E7E7),
    const Color(0xff101010),
    const Color(0xff648B8B),
    const Color(0xff2952CC)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.sp,
          vertical: 30.sp,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image
              _productImage(),
              30.verticalSpace,
              _productName(),
              30.verticalSpace,
              _productSize(),
              30.verticalSpace,
              _productDescription(),
              30.verticalSpace,
              _productReview()
            ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7),
                    ),
                  ),
                  // const Spacer(),
                  Text(
                    "\$235.00",
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
                  showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      isScrollControlled: true,
                      builder: (context) => addToCartBottomSheet(context));
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
                      "ADD TO CART",
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
    );
  }

  Widget addToCartBottomSheet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: IntrinsicHeight(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      width: 44.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: const Color(0xffE7E7E7)),
                    ),
                    SizedBox(
                      height: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add to Cart",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff101010)),
                          ),
                          IconButton(
                              onPressed: () {
                                Utilities.pop(context);
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                              )),
                        ],
                      ),
                    ),
                    30.verticalSpace,
                    TextFormField(
                      readOnly: false,
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff101010),
                        ),
                        suffixIcon: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.abc),
                            SizedBox(width: 5),
                            Icon(Icons.plus_one),
                          ],
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    SizedBox(
                      height: 58.h,
                      child: Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            width: 94.w,
                            height: 62.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Grand Total",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffB7B7B7),
                                  ),
                                ),
                                Text(
                                  "\$725.00",
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
                                Utilities.pop(context);
                                showModalBottomSheet(
                                    context: context,
                                    isDismissible: true,
                                    isScrollControlled: true,
                                    builder: (context) => addedToCartBottomSheet(context));
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
                                    "ADD TO CART",
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addedToCartBottomSheet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: IntrinsicHeight(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: <Widget>[
                30.verticalSpace,
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.sp,
                        color: Colors.black,
                      )),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 48,
                      color: Color.fromARGB(255, 164, 163, 163),
                    ),
                  ),
                ),
                20.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 64.h,
                  child: Column(
                    children: [
                      Text(
                        "Added to Cart",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "1 Item Total",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff6F6F6F),
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                SizedBox(
                  height: 58.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Utilities.pop(context);
                          },
                          child: Container(
                            height: 54.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.sp),
                                border: Border.all(
                                  color: const Color(0xffE7E7E7),
                                  width: 2.sp,
                                )),
                            child: Center(
                              child: Text(
                                "BACK EXPLORE",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      15.horizontalSpace,
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Utilities.pop(context);
                            Utilities.pushNamed(
                              context,
                              ShoeslyRoutes.cartScreen,
                            );
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
                                "TO CART",
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _productReview() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review (1045)',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(
                0xff101010,
              ),
            ),
          ),
          10.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 425.h,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 345.h,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final review = reviewList[index];
                        return ReviewWidget(name: review.name, description: review.description);
                      },
                      separatorBuilder: (context, index) {
                        return 30.verticalSpace;
                      },
                      itemCount: reviewList.length),
                ),
                30.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Utilities.pushNamed(
                      context,
                      ShoeslyRoutes.productReviewScreen,
                    );
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xffE7E7E7),
                        width: 1.sp,
                      ),
                      borderRadius: BorderRadius.circular(
                        100.sp,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "SEE ALL REVIEW",
                        style: TextStyle(
                          color: const Color(0xff101010),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: .3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productDescription() {
    return SizedBox(
      height: 132.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: .4,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 100.h,
            width: double.infinity,
            child: FittedBox(
              child: Text(
                "Engineered to crush any movement-based\nworkout, these On sneakers enhance the label's\noriginal Cloud sneaker with cutting edge\ntechnologies for a pair. ",
                style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xff6F6F6F)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _productSize() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 264.w,
        height: 76.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Size',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: .2,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 260.w,
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final sizes = size[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tappedSized = index;
                      });
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == tappedSized ? Colors.black : Colors.white,
                          border: Border.all(
                            width: 2.sp,
                            color: index == tappedSized ? Colors.black : const Color(0xffE7E7E7),
                          )),
                      child: Center(
                        child: Text(
                          sizes,
                          style: TextStyle(
                            color: index == tappedSized ? Colors.white : const Color(0xff6F6F6F),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: .1,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return 4.horizontalSpace;
                },
                itemCount: size.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _productName() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 254.w,
        height: 54.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jordan 1 Retro High Tie Dye",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: .3,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 220.w,
              height: 18.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: StarRating(
                      rating: 4,
                    ),
                  ),
                  12.horizontalSpace,
                  const Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '(1045 Reviews)',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Container(
      width: double.infinity,
      height: 315.h,
      decoration: BoxDecoration(
        color: const Color(0xffE7E7E7).withOpacity(.5),
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 60.sp,
              horizontal: 32.sp,
            ),
            child: Container(
              width: double.infinity,
              height: 180.h,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(.5),
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
          ),
          30.verticalSpace,
          Positioned(
            top: 275.h,
            left: 20.w,
            bottom: 30.h,
            child: Container(
              height: 20.h,
              width: 42.w,
              color: Colors.green,
            ),
          ),
          Positioned(
              top: 260.h,
              left: 185.w,
              child: Container(
                width: 140.w,
                height: 46.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.sp),
                  color: const Color(0xffFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final colorType = color[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            tappedIndex = index;
                          });
                        },
                        child: Container(
                          height: 23.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorType,
                          ),
                          child: index == tappedIndex
                              ? Icon(Icons.check, size: 16.sp, color: Colors.white)
                              : null,
                        ),
                      );
                    },
                    separatorBuilder: ((context, index) => 10.horizontalSpace),
                    itemCount: color.length,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.name,
    required this.description,
  });
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 95.h,
      child: Column(
        children: [
          SizedBox(
            height: 42.h,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80.w,
                      height: 14.h,
                      child: const StarRating(
                        rating: 5,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              10.horizontalSpace,
              SizedBox(
                width: 280.w,
                height: 44.h,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int rating;

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? Colors.yellow : Colors.grey,
          size: 16.sp,
        );
      }),
    );
  }
}

class ReviewModel {
  String name;
  String description;
  ReviewModel({
    required this.name,
    required this.description,
  });
}
