// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shoesly/features/product_detail_screen/presentation/pages/product_detail_screen.dart';
import 'package:shoesly/main.g.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({
    super.key,
    required this.reviewParams,
  });
  final ReviewParams reviewParams;

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  int tappedStars = 0;
  final List<String> _starList = [
    'All',
    '2 Stars',
    '3 Stars',
    '4 Stars',
    '5 Stars'
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAllReviewList(context);
    });
    super.initState();
  }

  fetchAllReviewList(BuildContext context) {
    BlocProvider.of<ProductDetailScreenBloc>(context).add(
      GetLatest3ReviewByProudctIdEvent(
        productId: widget.reviewParams.productId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review ${widget.reviewParams.reviewTotal}'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 45.w,
              height: 24.h,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 252, 227, 7),
                  ),
                  Text('4.5',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff101010),
                        ),
                      )),
                ],
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStars(),
              30.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 600.h,
                child: BlocBuilder<ProductDetailScreenBloc,
                    ProductDetailScreenState>(
                  builder: (context, state) {
                    if (state.commentListStatus == CommentListStatus.fetched) {
                      return state.commentList.isEmpty
                          ? const Center(
                              child: Text('No Reviews!!'),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                final review = state.commentList[index];
                                return ReviewWidget(
                                  commentEntity: review,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return 30.verticalSpace;
                              },
                              itemCount: state.commentList.length);
                    } else if (state.commentListStatus ==
                        CommentListStatus.failure) {
                      return Center(
                        child: Text(state.message.toString()),
                      );
                    } else if (state.commentListStatus ==
                        CommentListStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildStars() {
    return SizedBox(
      width: double.infinity,
      height: 36.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final star = _starList[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  tappedStars = index;
                  if (index == 0) {
                    BlocProvider.of<ProductDetailScreenBloc>(context).add(
                      GetLatest3ReviewByProudctIdEvent(
                        productId: widget.reviewParams.productId,
                      ),
                    );
                  } else {
                    BlocProvider.of<ProductDetailScreenBloc>(context).add(
                      GetCommentUnderStarsEvent(
                        productId: widget.reviewParams.productId,
                        starts: index + 1,
                      ),
                    );
                  }
                });
              },
              child: Center(
                child: Text(
                  star,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: index == tappedStars
                        ? const Color(0xff101010)
                        : const Color(0xffB7B7B7),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return 20.horizontalSpace;
          },
          itemCount: _starList.length),
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
