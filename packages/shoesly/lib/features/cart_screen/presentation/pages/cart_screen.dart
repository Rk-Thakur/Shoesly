import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoesly/main.g.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<CartScreenBloc>(context).add(ListCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartList = context.watch<CartScreenBloc>().state.cartList;
    int totalPrice = cartList.fold(
        0, (sum, product) => sum + product.productPrice * product.quantity);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: GoogleFonts.urbanist(
              textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          )),
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
                  Text('Grand',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffB7B7B7),
                        ),
                      )),
                  // const Spacer(),
                  Text('\$ ${totalPrice.toStringAsFixed(2)}',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .4,
                        ),
                      )),
                ],
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  cartList.isEmpty
                      ? null
                      : Utilities.pushNamed(
                          context,
                          ShoeslyRoutes.orderSummary,
                          arguments: OrderSummaryParams(
                            cartList: cartList,
                            grandTotal: totalPrice,
                          ),
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
                    child: Text('CHECK OUT ',
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
              child: BlocBuilder<CartScreenBloc, CartScreenState>(
                builder: (context, state) {
                  if (state.cartStatus == CartStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state.cartStatus == CartStatus.fetched) {
                    return ListView.separated(
                      itemCount: state.cartList.length,
                      itemBuilder: (context, index) {
                        final product = state.cartList[index];
                        return Slidable(
                          key: ValueKey(index),
                          endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  spacing: 12.sp,
                                  borderRadius: BorderRadius.circular(10.sp),
                                  onPressed: (context) {
                                    BlocProvider.of<CartScreenBloc>(context)
                                        .add(DeleteCartEvent(index: index));
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: FontAwesomeIcons.trash,
                                  label: 'Delete',
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 92.h,
                              child: Row(
                                children: [
                                  Container(
                                    height: 88.h,
                                    width: 88.w,
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius:
                                          BorderRadius.circular(30.sp),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        imageUrl: product.productImage,
                                        fit: BoxFit.contain,
                                        placeholder: (context, url) {
                                          return const Center(
                                            child: CircularProgressIndicator
                                                .adaptive(),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  15.horizontalSpace,
                                  Expanded(
                                      child: SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.productName,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff101010),
                                          ),
                                        ),
                                        5.verticalSpace,
                                        Text(
                                          'Nike . Red Gray . 40',
                                          style: GoogleFonts.urbanist(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff666666),
                                            ),
                                          ),
                                        ),
                                        10.verticalSpace,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  '\$${product.productPrice.toStringAsFixed(2)}',
                                                  style: GoogleFonts.urbanist(
                                                    textStyle: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xff101010),
                                                    ),
                                                  )),
                                            ),
                                            SizedBox(
                                                width: 84.w,
                                                height: 30.h,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (product.quantity >
                                                              1) {
                                                            product.quantity--;
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 30.w,
                                                        height: 30.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  width: 2.sp,
                                                                  color: Colors
                                                                      .black,
                                                                )),
                                                        child: Center(
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .minus,
                                                            color:
                                                                Colors.black45,
                                                            size: 14.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      product.quantity
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.urbanist(
                                                        textStyle: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xff101010),
                                                        ),
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
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  width: 2.sp,
                                                                  color: Colors
                                                                      .black,
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
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 30.verticalSpace;
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
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
