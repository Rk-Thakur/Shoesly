import 'package:shoesly/main.g.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({
    super.key,
    required this.orderSummaryParams,
  });

  final OrderSummaryParams orderSummaryParams;
  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  int shippingCost = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Summary',
            style: GoogleFonts.urbanist(
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            )),
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
                  Text('Grand Total',
                      style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffB7B7B7),
                        ),
                      )),
                  // const Spacer(),
                  Text(
                      '\$ ${widget.orderSummaryParams.grandTotal + shippingCost}',
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
                onTap: () {},
                child: Container(
                  height: 54.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100.sp),
                  ),
                  child: Center(
                    child: Text('PAYMENT',
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
        ),
        child: SingleChildScrollView(
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
          Text('Payment Detail',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff101010),
                ),
              )),
          20.verticalSpace,
          PaymentListTile(
            totalTitle: 'Sub Total',
            price: '\$ ${widget.orderSummaryParams.grandTotal}',
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
          Text('Order Details',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff101010),
                ),
              )),
          10.verticalSpace,
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final order = widget.orderSummaryParams.cartList[index];
                return OrderProductDetail(
                  title: order.productName,
                  subTitle: 'Nike . Red Grey . 40 . Qty 1',
                  price: '\$ ${order.productPrice}',
                );
              },
              separatorBuilder: (context, index) {
                return 10.verticalSpace;
              },
              itemCount: widget.orderSummaryParams.cartList.length,
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
          Text('Information',
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff101010),
                ),
              )),
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
          Text(totalTitle,
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff666666),
                ),
              )),
          Text(price,
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff101010),
                ),
              )),
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
            child: Text(title,
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff101010),
                  ),
                )),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subTitle,
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff666666),
                    ),
                  )),
              Text(price,
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff101010),
                    ),
                  )),
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
                Text(title,
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff160700),
                      ),
                    )),
                const Spacer(),
                Text(subTitle,
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff160700),
                      ),
                    )),
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
