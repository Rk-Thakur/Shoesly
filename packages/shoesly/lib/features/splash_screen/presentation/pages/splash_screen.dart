import 'package:shoesly/main.g.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkOnBoard();
    });
    super.initState();
  }

  Future<void> checkOnBoard() async {
    final onBoard = await TokenService().getOnBoard();

    if (onBoard != true) {
      Future.delayed(
        const Duration(seconds: 3),
        () => Utilities.pushNamedAndRemoveUntil(
          context,
          ShoeslyRoutes.onBoardingScreen,
        ),
      );
    } else {
      if (!mounted) return;
      BlocProvider.of<SplashScreenBloc>(context).add(AuthStatusEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.alreadyLoggedIn) {
            Future.delayed(
              const Duration(seconds: 3),
              () => Utilities.pushNamedAndRemoveUntil(
                context,
                ShoeslyRoutes.discoverScreen,
              ),
            );
          } else if (state.authStatus == AuthStatus.failure) {
            Future.delayed(
              const Duration(seconds: 3),
              () => Utilities.pushNamedAndRemoveUntil(
                context,
                ShoeslyRoutes.loginScreen,
              ),
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Picture(
                    source: Asset.images.book,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ),
            ),
            const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.black45,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black54,
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Shoesly',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
