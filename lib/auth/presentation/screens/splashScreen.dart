import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hightx = size.height - kToolbarHeight;
    return Scaffold(
      body:
//  Stack(clipBehavior: Clip.none, children: [
          Center(
              child: SizedBox(
                  height: hightx,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/Spashcreen.png',
                    fit: BoxFit.fill,
                  ))),
    );
  }
}
