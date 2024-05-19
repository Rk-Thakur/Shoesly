import 'package:shoesly/features/product_detail_screen/pages/product_detail_screen.dart';
import 'package:shoesly/main.g.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  int tappedStars = 0;
  final List<String> _starList = [
    'All',
    '5 Stars',
    '4 Stars',
    '3 Stars',
    '2 Stars'
  ];

  List<ReviewModel> reviewList = [
    ReviewModel(
        name: 'Nolan Carder',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Maria Saris',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Gretchen Septimus',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Roger Stanton',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Hanna Levin',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Nolan Carder',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Maria Saris',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Gretchen Septimus',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Roger Stanton',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
    ReviewModel(
        name: 'Hanna Levin',
        description:
            'Perfect for keeping your feet dry and warm in damp conditions.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review(1045)"),
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
                  Text(
                    "4.5",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff101010),
                    ),
                  ),
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
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final review = reviewList[index];
                      return ReviewWidget(
                          name: review.name, description: review.description);
                    },
                    separatorBuilder: (context, index) {
                      return 30.verticalSpace;
                    },
                    itemCount: reviewList.length),
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
