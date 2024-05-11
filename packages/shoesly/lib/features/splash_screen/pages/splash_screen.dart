import 'package:shoesly/main.g.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkOnBoard();
    super.initState();
  }

  Future<void> checkOnBoard() async {
    Future.delayed(
      const Duration(seconds: 3),
      () => Utilities.pushNamedAndRemoveUntil(
        context,
        ShoeslyRoutes.discoverScreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              height: 100,

              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              // child: Picture(
              //   source: Asset.images.book,
              //   height: 20.h,
              //   width: 20.w,
              // ),
              child: Picture(
                source: Asset.images.book,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Shoesly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
