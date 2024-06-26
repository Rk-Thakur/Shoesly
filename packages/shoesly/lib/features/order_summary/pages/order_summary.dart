// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shoesly/main.g.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order Summary",
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
                    "Grand Total",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7),
                    ),
                  ),
                  // const Spacer(),
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
                      "PAYMENT",
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
        ),
        child: Column(
          children: [
            //Personal Information
            _paymentInformation(),
            20.verticalSpace,
            //Order Details
            _orderDetails(),

            20.verticalSpace,
            //Payment Detail
            _paymentDetail(),
          ],
        ),
      ),
    );
  }

  Widget _paymentDetail() {
    return SizedBox(
      width: double.infinity,
      height: 192.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Detail",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff101010),
            ),
          ),
          20.verticalSpace,
          const PaymentListTile(
            totalTitle: 'Sub Total',
            price: '\$705.00',
          ),
          20.verticalSpace,
          const PaymentListTile(
            totalTitle: 'Shipping',
            price: '\$20.00',
          ),
          40.verticalSpace,
          const PaymentListTile(
            totalTitle: 'Total Order',
            price: '\$725.00',
          ),
        ],
      ),
    );
  }

  Widget _orderDetails() {
    return SizedBox(
      width: double.infinity,
      height: 268.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Details",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff101010),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  20.verticalSpace,
                  const OrderProductDetail(
                    title: 'Jordan 1 Retro High Tie Dye',
                    subTitle: 'Nike . Red Grey . 40 . Qty 1',
                    price: '\$235.00',
                  ),
                  20.verticalSpace,
                  const OrderProductDetail(
                    title: 'Jordan 1 Retro High Tie Dye',
                    subTitle: 'Nike . Red Grey . 40 . Qty 1',
                    price: '\$235.00',
                  ),
                  20.verticalSpace,
                  const OrderProductDetail(
                    title: 'Jordan 1 Retro High Tie Dye',
                    subTitle: 'Nike . Red Grey . 40 . Qty 1',
                    price: '\$235.00',
                  ),
                  20.verticalSpace,
                  const OrderProductDetail(
                    title: 'Jordan 1 Retro High Tie Dye',
                    subTitle: 'Nike . Red Grey . 40 . Qty 1',
                    price: '\$235.00',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentInformation() {
    return SizedBox(
      width: double.infinity,
      height: 192.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Information",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff101010),
            ),
          ),
          20.verticalSpace,
          const PaymentInformation(
            title: 'Payment Method',
            subTitle: 'Credit Card',
          ),
          // 40.verticalSpace,
          30.verticalSpace,
          const PaymentInformation(
            title: 'Location',
            subTitle: 'Semarang,Indonesia',
          ),
        ],
      ),
    );
  }
}

class PaymentListTile extends StatelessWidget {
  const PaymentListTile({
    super.key,
    required this.totalTitle,
    required this.price,
  });
  final String totalTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 26.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            totalTitle,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff666666),
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff101010),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderProductDetail extends StatelessWidget {
  const OrderProductDetail({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
  });

  final String title;
  final String subTitle;
  final String price;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff101010),
              ),
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff666666),
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff101010),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class PaymentInformation extends StatelessWidget {
  const PaymentInformation({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 54.h,
            width: 132.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff160700),
                  ),
                ),
                const Spacer(),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff160700),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16.w,
            height: 16.h,
            child: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
