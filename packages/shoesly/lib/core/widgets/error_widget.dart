import 'package:shoesly/main.g.dart';

class ErrorWidgetClass extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const ErrorWidgetClass(this.errorDetails, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 25,
            ),
            const Text('Error Occured!!'),
            Text(errorDetails.exceptionAsString())
          ],
        ),
      ),
    );
  }
}
