import 'package:shoesly/main.g.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int tappedIndex = 0;
  List<String> brandTypes = [
    'All',
    'Nike',
    'Reebok',
    'Addidas',
    'Jordan',
    'Vans'
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAllProductList(context);
    });
    super.initState();
  }

  fetchAllProductList(BuildContext context) {
    BlocProvider.of<DiscoverScreenBloc>(context).add(GetAllDiscoverEvent());
  }

  Widget getBrandIcon(String brandName) {
    switch (brandName) {
      case 'Nike':
        return Picture(
          source: Asset.images.nikeshade,
          width: 12.w,
          fit: BoxFit.cover,
          height: 12.h,
        );
      case 'Jordan':
        return Picture(
          source: Asset.images.jordonshafe,
          width: 12.w,
          height: 12.h,
          fit: BoxFit.cover,
        );
      case 'Adidas':
        return Picture(
          source: Asset.images.addidasshade,
          width: 12.w,
          height: 12.h,
          fit: BoxFit.cover,
        );
      case 'Reebok':
        return Picture(
          source: Asset.images.xlingshade,
          width: 12.w,
          height: 12.h,
          fit: BoxFit.cover,
        );
      case 'Vans':
        return Picture(
          source: Asset.images.vanshade,
          width: 12.w,
          height: 12.h,
          fit: BoxFit.cover,
        );

      default:
        return Picture(
          source: Asset.images.nikeshade,
          width: 12.w,
          height: 12.h,
          fit: BoxFit.cover,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        onPressed: () {
          Utilities.pushNamed(context, ShoeslyRoutes.productFilterScreen);
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        label: Text('FILTER',
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            )),
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
                Expanded(
                  child: Text('Discover',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.sp,
                          letterSpacing: .3.sp,
                        ),
                      )),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Badge(
                        child: IconButton(
                          onPressed: () {
                            Utilities.pushNamed(
                                context, ShoeslyRoutes.cartScreen);
                          },
                          icon: Icon(
                            size: 24.sp,
                            Icons.shopping_cart,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Utilities.pushNamed(
                                context, ShoeslyRoutes.formScreen);
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                )
              ],
            ),
            24.verticalSpace,
            Expanded(
              child: Column(
                children: [
                  _brandList(),
                  30.verticalSpace,
                  Expanded(child:
                      BlocBuilder<DiscoverScreenBloc, DiscoverScreenState>(
                    builder: (context, state) {
                      if (state.productListStatus ==
                          ProductListStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (state.productListStatus ==
                          ProductListStatus.fetched) {
                        return state.productList.isEmpty
                            ? Center(
                                child: Text('No Brand Listed!!',
                                    style: GoogleFonts.urbanist()),
                              )
                            : RefreshIndicator(
                                onRefresh: () async {
                                  await fetchAllProductList(context);
                                },
                                child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: state.productList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 240.h,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      final product = state.productList[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Utilities.pushNamed(
                                            context,
                                            ShoeslyRoutes.productDetailScreen,
                                            arguments: ProductDetailParams(
                                              imageList: product.productImage,
                                              size: product.productSize,
                                              productDescription:
                                                  product.productDescription,
                                              productName: product.productName,
                                              productId: product.productId,
                                              price: product.productPrice,
                                            ),
                                          );
                                        },
                                        child: SizedBox(
                                          width: 150.w,
                                          height: 228.h,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 150.w,
                                                height: 170.h,
                                                decoration: BoxDecoration(
                                                  color: Colors.black45
                                                      .withOpacity(.10),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.sp),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: getBrandIcon(
                                                            product.brandName),
                                                      ),
                                                      4.verticalSpace,
                                                      CachedNetworkImage(
                                                        imageUrl: product
                                                            .productImage[0],
                                                        height: 124.h,
                                                        width: double.infinity,
                                                        fit: BoxFit.fill,
                                                        placeholder:
                                                            (context, url) {
                                                          return const Center(
                                                            child:
                                                                CircularProgressIndicator
                                                                    .adaptive(),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
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
                                                    Text(product.productName,
                                                        style: GoogleFonts
                                                            .urbanist(
                                                          textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12.sp,
                                                          ),
                                                        )),
                                                    5.verticalSpace,
                                                    SizedBox(
                                                      width: 122.w,
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                            size: 12.sp,
                                                          ),
                                                          5.horizontalSpace,
                                                          Text('4.5',
                                                              style: GoogleFonts
                                                                  .urbanist(
                                                                textStyle:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      11.sp,
                                                                  color: const Color(
                                                                      0xff101010),
                                                                ),
                                                              )),
                                                          5.horizontalSpace,
                                                          Text('(1024 Reviews)',
                                                              style: GoogleFonts
                                                                  .urbanist(
                                                                textStyle:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      11.sp,
                                                                  color: const Color(
                                                                      0xffB7B7B7),
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 24.h,
                                                        child: Text(
                                                          '\$ ${product.productPrice.toStringAsFixed(2)}',
                                                          style: GoogleFonts
                                                              .urbanist(
                                                            textStyle:
                                                                TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 16.sp,
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              );
                      } else if (state.productListStatus ==
                          ProductListStatus.failure) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ))
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
                if (index == 0) {
                  BlocProvider.of<DiscoverScreenBloc>(context)
                      .add(GetAllDiscoverEvent());
                } else {
// for the brand  names
                  BlocProvider.of<DiscoverScreenBloc>(context)
                      .add(GetBrandDiscoverEvent(brandName: brand));
                }
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
