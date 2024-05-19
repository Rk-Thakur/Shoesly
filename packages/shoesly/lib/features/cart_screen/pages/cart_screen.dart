import 'package:shoesly/main.g.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 22.sp, right: 22.sp, bottom: 22.sp),
            child: SizedBox(
              width: 94.w,
              height: 62.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    "\$235.00",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .4,
                    ),
                  ),
                ],
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 22.sp, right: 22.sp),
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
          ),
        ],
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
                  itemBuilder: (context, index) {
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
                                  "Jordan 1 Retro High Tie Dye",
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
                                        "\$235,00",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 30.w,
                                              height: 30.h,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black45,
                                              ),
                                              child: Icon(
                                                Icons.dashboard,
                                                color: Colors.black45,
                                                size: 14.sp,
                                              ),
                                            ),
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff101010),
                                              ),
                                            ),
                                            Container(
                                              width: 30.w,
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 2.sp,
                                                    color: Colors.black,
                                                  )),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 14.sp,
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
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
