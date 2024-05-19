import 'package:shoesly/main.g.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDetailParams productDetailParams;
  const ProductDetailScreen({
    super.key,
    required this.productDetailParams,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int tappedIndex = 0;
  int tappedSized = 0;
  int _pagaeIndex = 0;

  int _selectedStar = 0;
  int _grandtotal = 0;

  late PageController _pageController;

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchReviewList(context);
    });
    quantityController.text = '1';
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  fetchReviewList(BuildContext context) {
    BlocProvider.of<ProductDetailScreenBloc>(context).add(
      GetLatest3ReviewByProudctIdEvent(
        productId: widget.productDetailParams.productId,
      ),
    );
  }

  void _increment() {
    setState(() {
      int currentValue = int.parse(quantityController.text);
      quantityController.text = (currentValue + 1).toString();
      _grandtotal = currentValue * widget.productDetailParams.price;
    });
  }

  void _decrement() {
    setState(() {
      int currentValue = int.parse(quantityController.text);
      if (currentValue > 1) {
        quantityController.text = (currentValue - 1).toString();
        _grandtotal = currentValue * widget.productDetailParams.price;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  List<Color> color = [
    const Color(0xffE7E7E7),
    const Color(0xff101010),
    const Color(0xff648B8B),
    const Color(0xff2952CC)
  ];

  @override
  Widget build(BuildContext context) {
    final reviewList =
        context.watch<ProductDetailScreenBloc>().state.commentList;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: IconButton(
              onPressed: () async {
                bottomSheet(context);
              },
              icon: const Icon(
                Icons.comment,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.sp,
          vertical: 30.sp,
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            await fetchReviewList(context);
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                //image
                _productImage(imageList: widget.productDetailParams.imageList),
                30.verticalSpace,
                _productName(
                  name: widget.productDetailParams.productName,
                  reviews: reviewList.length,
                ),
                30.verticalSpace,
                _productSize(size: widget.productDetailParams.size),
                30.verticalSpace,
                _productDescription(
                  description: widget.productDetailParams.productDescription,
                ),
                30.verticalSpace,
                _productReview()
              ],
            ),
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
                    'Price',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7),
                    ),
                  ),
                  // const Spacer(),
                  Text(
                    '\$${widget.productDetailParams.price}',
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
                      'ADD TO CART',
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

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return BlocListener<ProductDetailScreenBloc,
              ProductDetailScreenState>(
            listener: (context, state) {
              if (state.commentStatus == CommentStatus.commented) {
                eventController.clear();
                _selectedStar = 0;
                Navigator.of(context).pop();
              }
            },
            child: StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: IntrinsicHeight(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            15.verticalSpace,
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "It's comment time.",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            TextFormField(
                              controller: eventController,
                              maxLength: 100,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                label: const Text('Comment'),
                                hintText: 'Comment',
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(5, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedStar = index + 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.star,
                                    size: 40.0,
                                    color: index < _selectedStar
                                        ? Colors.yellow
                                        : Colors.grey,
                                  ),
                                );
                              }),
                            ),
                            10.verticalSpace,
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  if (eventController.text.isNotEmpty) {
                                    final CommentParams commentParams =
                                        CommentParams(
                                      review: eventController.text.trim(),
                                      star: _selectedStar,
                                      productId:
                                          widget.productDetailParams.productId,
                                    );

                                    context.read<ProductDetailScreenBloc>().add(
                                          CommentProductEvent(
                                            commentParams: commentParams,
                                          ),
                                        );
                                  }
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
                                      'ADD TO CART',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
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
                            'Add to Cart',
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
                      readOnly: true,
                      controller: quantityController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff101010),
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap:
                                  (int.tryParse(quantityController.text) ?? 0) <
                                          1
                                      ? null
                                      : _decrement,
                              child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2.sp,
                                      color: Colors.black,
                                    )),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    size: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: _increment,
                              child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2.sp,
                                      color: Colors.black,
                                    )),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 12.sp,
                                  ),
                                ),
                              ),
                            ),
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
                                  'Grand Total',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffB7B7B7),
                                  ),
                                ),
                                StatefulBuilder(builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Text(
                                    '\$${widget.productDetailParams.price * int.parse(
                                          quantityController.text,
                                        )}',
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .4,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          )),
                          BlocListener<CartScreenBloc, CartScreenState>(
                            listener: (context, state) {
                              if (state.cartStatus == CartStatus.added) {
                                Utilities.pop(context);
                                showModalBottomSheet(
                                    context: context,
                                    isDismissible: true,
                                    isScrollControlled: true,
                                    builder: (context) =>
                                        addedToCartBottomSheet(context));
                              }
                            },
                            child: Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  final CartEntity cartEntity = CartEntity(
                                      productImage: widget
                                          .productDetailParams.imageList[0],
                                      productName: widget
                                          .productDetailParams.productName,
                                      productPrice:
                                          widget.productDetailParams.price,
                                      quantity:
                                          int.parse(quantityController.text));
                                  BlocProvider.of<CartScreenBloc>(context).add(
                                      AddCartEvent(cartEntity: cartEntity));
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
                                      'ADD TO CART',
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
                  height: 70.h,
                  child: Column(
                    children: [
                      Text(
                        'Added to Cart',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '1 Item Total',
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
                                'BACK EXPLORE',
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
                                'TO CART',
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
      child: BlocBuilder<ProductDetailScreenBloc, ProductDetailScreenState>(
        builder: (context, state) {
          if (state.commentListStatus == CommentListStatus.fetched) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Review (${state.commentList.length})',
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
                              final review = state.commentList[index];
                              return ReviewWidget(
                                commentEntity: review,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return 30.verticalSpace;
                            },
                            itemCount: state.commentList.length),
                      ),
                      30.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          Utilities.pushNamed(
                            context,
                            ShoeslyRoutes.productReviewScreen,
                            arguments: ReviewParams(
                              reviewTotal: state.commentList.length,
                              productId: widget.productDetailParams.productId,
                            ),
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
                              'SEE ALL REVIEW',
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
            );
          } else if (state.commentListStatus == CommentListStatus.failure) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.commentListStatus == CommentListStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _productDescription({required String description}) {
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
                description,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff6F6F6F)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _productSize({required List<double> size}) {
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
                itemCount: size.length,
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
                          color: index == tappedSized
                              ? Colors.black
                              : Colors.white,
                          border: Border.all(
                            width: 2.sp,
                            color: index == tappedSized
                                ? Colors.black
                                : const Color(0xffE7E7E7),
                          )),
                      child: Center(
                        child: Text(
                          sizes.toString(),
                          style: TextStyle(
                            color: index == tappedSized
                                ? Colors.white
                                : const Color(0xff6F6F6F),
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
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateReviewAverage(List<int> numbers) {
    int sum = 0;
    for (int number in numbers) {
      sum += number;
    }
    return sum / numbers.length;
  }

  Widget _productName({required String name, required int reviews}) {
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
              name,
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
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '4.5',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '($reviews Reviews)',
                        style: const TextStyle(
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

  Widget _productImage({required List<String> imageList}) {
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
                // color: Colors.red.withOpacity(.5),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pagaeIndex = index;
                    });
                  },
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: imageList[index],
                      fit: BoxFit.fill,
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                    );
                  }),
            ),
          ),
          30.verticalSpace,
          Positioned(
            top: 275.h,
            left: 20.w,
            bottom: 30.h,
            child: SizedBox(
                height: 20.h,
                width: 42.w,
                child: Row(
                  children: [
                    ...List.generate(
                      imageList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: ListDot(
                          isActive: index == _pagaeIndex,
                        ),
                      ),
                    ),
                  ],
                )),
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
                              ? Icon(Icons.check,
                                  size: 16.sp, color: Colors.white)
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
    required this.commentEntity,
  });

  final CommentEntity commentEntity;

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
                  child: CachedNetworkImage(
                    imageUrl: commentEntity.userProfile,
                    fit: BoxFit.contain,
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
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
                        Text(commentEntity.userName,
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Text(commentEntity.reviewedTime.timeAgo,
                            style: GoogleFonts.urbanist(
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 80.w,
                      height: 14.h,
                      child: StarRating(
                        rating: commentEntity.stars,
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
                child: Text(commentEntity.productReview,
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
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

class ListDot extends StatelessWidget {
  const ListDot({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 300),
      height: 7.h,
      width: 7.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : const Color(0xffB7B7B7),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    );
  }
}
