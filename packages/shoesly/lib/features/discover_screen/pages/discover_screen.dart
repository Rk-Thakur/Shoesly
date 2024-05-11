import 'package:shoesly/main.g.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int tappedIndex = 0;
  List<String> brandTypes = [
    "All",
    "Nike",
    "Jordan",
    "Adidas",
    "Reebok",
    "Adidas",
    "Reebok"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        onPressed: () {},
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        label: Text(
          "FILTER",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        icon: const Badge(
          child: Icon(
            Icons.settings,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.sp,
          vertical: 30.sp,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30.sp,
                    letterSpacing: .3.sp,
                  ),
                ),
                Badge(
                  child: Icon(
                    size: 24.sp,
                    Icons.shopping_cart,
                  ),
                ),
              ],
            ),
            24.verticalSpace,
            Expanded(
              child: Column(
                children: [
                  _brandList(),
                  30.verticalSpace,
                  Expanded(
                      child: GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 15,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 234.h,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 150.w,
                              height: 224.h,
                              child: Column(
                                children: [
                                  Container(
                                    width: 150.w,
                                    height: 160.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
                                    ),
                                    child: const Icon(
                                      Icons.abc,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 150.w,
                                    height: 64.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Jordan 1 Retro High Tie Dye',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        5.verticalSpace,
                                        SizedBox(
                                          width: 110.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 12.sp,
                                              ),
                                              Text(
                                                "4.5",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11.sp,
                                                  color:
                                                      const Color(0xff101010),
                                                ),
                                              ),
                                              Text(
                                                "(1045 Reviews)",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                  color:
                                                      const Color(0xffB7B7B7),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24.h,
                                          child: Text(
                                            "\$235,00",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _brandList() {
    return SizedBox(
      width: double.infinity,
      height: 34.h,
      // color: Colors.pinkAccent,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final brand = brandTypes[index];
          return Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  tappedIndex = index;
                });
              },
              child: Text(
                brand,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                  letterSpacing: .2,
                  color: index == tappedIndex
                      ? const Color(0xff101010)
                      : const Color(0xffB7B7B7),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => 15.horizontalSpace,
        itemCount: brandTypes.length,
      ),
    );
  }
}
