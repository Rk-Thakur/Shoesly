import 'package:shoesly/main.g.dart';

class ProductFilterScreen extends StatefulWidget {
  const ProductFilterScreen({super.key});

  @override
  State<ProductFilterScreen> createState() => _ProductFilterScreenState();
}

class _ProductFilterScreenState extends State<ProductFilterScreen> {
  int tapIndex = 0;
  int tapGender = 0;
  int tapColor = 0;
  int tapBrand = 0;

  final List<BrandList> _brandList = [
    BrandList(name: 'NIKE', totalItems: 1001, image: Asset.images.nikebold),
    BrandList(name: 'Puma', totalItems: 601, image: Asset.images.pumabold),
    BrandList(name: 'Adidas', totalItems: 709, image: Asset.images.addidasbold),
    BrandList(name: 'Reebok', totalItems: 555, image: Asset.images.xlingbold),
  ];

  final List<String> _sortByList = [
    'Most Recent',
    'Lowest Price',
    'Highest Price',
  ];

  final List<String> genderList = [
    'Man',
    'Woman',
    'Unisex',
  ];

  final List<ColorModel> colorList = [
    ColorModel(colorName: 'Black', color: Colors.black),
    ColorModel(colorName: 'White', color: Colors.white),
    ColorModel(colorName: 'Red', color: Colors.red),
  ];
  RangeValues _currentRangeValues = const RangeValues(200, 750);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.sp,
          vertical: 30.sp,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _brand(),
              30.verticalSpace,
              _priceRange(),
              30.verticalSpace,
              _sortBy(),
              30.verticalSpace,
              _gender(),
              30.verticalSpace,
              _colorList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 22.sp,
          right: 22.sp,
        ),
        child: Row(
          children: [
            Expanded(
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
                  child: Text('RESET(4)',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
            ),
            15.horizontalSpace,
            Expanded(
              child: Container(
                height: 54.h,
                width: 160.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100.sp),
                ),
                child: Center(
                  child: Text('APPLY',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorList() {
    return SizedBox(
      width: 280.w,
      height: 86.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Color',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff101010),
                ),
              )),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 46.h,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return 10.horizontalSpace;
                },
                scrollDirection: Axis.horizontal,
                itemCount: colorList.length,
                itemBuilder: (context, index) {
                  final color = colorList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tapColor = index;
                      });
                    },
                    child: Container(
                      width: 84.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.sp),
                        border: Border.all(
                          color: index == tapColor
                              ? Colors.black
                              : const Color(0xffE7E7E7),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: color.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            4.horizontalSpace,
                            Text(color.colorName,
                                style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _gender() {
    return SizedBox(
      width: 280.w,
      height: 86.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gender',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff101010),
                ),
              )),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 46.h,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return 10.horizontalSpace;
                },
                scrollDirection: Axis.horizontal,
                itemCount: genderList.length,
                itemBuilder: (context, index) {
                  final sort = genderList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tapGender = index;
                      });
                    },
                    child: Container(
                      width: 74.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: index == tapGender ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(100.sp),
                        border: Border.all(
                          color: index == tapGender
                              ? Colors.black
                              : const Color(0xffE7E7E7),
                        ),
                      ),
                      child: Center(
                          child: Text(sort,
                              style: GoogleFonts.urbanist(
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: index == tapGender
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ))),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _sortBy() {
    return SizedBox(
      width: double.infinity,
      height: 86.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sort By',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff101010),
                ),
              )),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 46.h,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return 10.horizontalSpace;
                },
                scrollDirection: Axis.horizontal,
                itemCount: _sortByList.length,
                itemBuilder: (context, index) {
                  final sort = _sortByList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tapIndex = index;
                      });
                    },
                    child: Container(
                      width: 127.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: index == tapIndex ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(100.sp),
                        border: Border.all(
                          color: index == tapIndex
                              ? Colors.black
                              : const Color(0xffE7E7E7),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        sort,
                        style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color:
                              index == tapIndex ? Colors.white : Colors.black,
                        )),
                      )),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _priceRange() {
    return SizedBox(
      width: double.infinity,
      height: 114.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Range',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff101010),
                ),
              )),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              height: 66.h,
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 1750,
                // divisions: 5,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              )),
        ],
      ),
    );
  }

  Widget _brand() {
    return SizedBox(
      width: double.infinity,
      height: 144.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brands',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff101010),
                ),
              )),
          const Spacer(),
          SizedBox(
            height: 100.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _brandList.length,
              itemBuilder: (context, index) {
                final brand = _brandList[index];
                return SizedBox(
                  width: 72.w,
                  height: 100.h,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tapBrand = index;
                          });
                        },
                        child: Container(
                            width: 58.w,
                            height: 58.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF3F3F3),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                    child: Picture(
                                  source: brand.image,
                                  width: 12.w,
                                  height: 12.h,
                                  fit: BoxFit.cover,
                                )),
                                index == tapBrand
                                    ? Positioned(
                                        top: 34.h,
                                        left: 30.w,
                                        child: Container(
                                          width: 24.w,
                                          height: 24.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 14.sp,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            )),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(brand.name,
                              style: GoogleFonts.urbanist(
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff101010),
                                ),
                              )),
                          Text('${brand.totalItems} Items',
                              style: GoogleFonts.urbanist(
                                textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffB7B7B7),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 10.horizontalSpace;
              },
            ),
          )
        ],
      ),
    );
  }
}

class BrandList {
  String name;
  int totalItems;
  String image;
  BrandList({
    required this.name,
    required this.totalItems,
    required this.image,
  });
}

class ColorModel {
  String colorName;
  Color color;
  ColorModel({
    required this.colorName,
    required this.color,
  });
}
