import 'package:shoesly/main.g.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pagaeIndex = 0;
  int? isView;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    changeStatus();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> changeStatus() async {
    await TokenService().saveOnboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 15.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Utilities.pushNamedAndRemoveUntil(
                        context,
                        ShoeslyRoutes.loginScreen,
                      );
                    },
                    child: const Icon(
                      Icons.skip_next,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                itemCount: demoData.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pagaeIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 120.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              demoData[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    letterSpacing: .3,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              demoData[index].description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    letterSpacing: .3,
                                    fontWeight: FontWeight.w200,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Picture(
                          source: demoData[index].image,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ...List.generate(
                          demoData.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pagaeIndex,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pagaeIndex != demoData.length - 1
                          ? _pageController.nextPage(
                              duration: const Duration(microseconds: 300),
                              curve: Curves.bounceInOut)
                          : Utilities.pushNamedAndRemoveUntil(
                              context,
                              ShoeslyRoutes.loginScreen,
                            );
                      changeStatus();
                    },
                    child: Text(
                      _pagaeIndex != demoData.length - 1
                          ? 'Next'
                          : 'Getting Started',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 300),
      height: 6.h,
      width: isActive ? 25.w : 15.w,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.black
            : Theme.of(context).colorScheme.secondary.withOpacity(.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    );
  }
}

class OnBoardModal {
  String title;
  String description;
  String image;
  OnBoardModal({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoardModal> demoData = [
  OnBoardModal(
    description: ShoeslyStrings.firstOnBoardTitle,
    title: ShoeslyStrings.firstOnboardDescription,
    image: Asset.images.onboard1,
  ),
  OnBoardModal(
    title: ShoeslyStrings.secondOnboardTitle,
    description: ShoeslyStrings.secondOnboardDescription,
    image: Asset.images.onboard2,
  ),
  OnBoardModal(
    title: ShoeslyStrings.thirdOnboardTitle,
    description: ShoeslyStrings.thirdOnboardDescription,
    image: Asset.images.onboard3,
  ),
];
