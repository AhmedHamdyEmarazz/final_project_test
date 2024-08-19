import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:jobseque/auth/presentation/screens/create_account.dart';
import 'package:jobseque/auth/presentation/screens/onBoardingThird.dart';
import 'package:jobseque/auth/presentation/screens/signUP.dart';

class OnBoardingSecond extends StatefulWidget {
  const OnBoardingSecond({super.key});

  @override
  State<OnBoardingSecond> createState() => _OnBoardingSecondState();
}

class _OnBoardingSecondState extends State<OnBoardingSecond> {
  @override
  void initState() {
    super.initState();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnBoardingThird(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: IconButton(
            icon: SizedBox(
                child: Image.asset(
              'assets/Logo.png',
              fit: BoxFit.contain,
            )),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SignUp();
              }));
            }),
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(6),
                height: size.height * 0.4,
                child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/image 8.png',
                        fit: BoxFit.fill,
                        width: size.width,
                      ),
                      Positioned(
                        top: 10,
                        left: 25,
                        child: Image.asset(
                          'assets/Discord Logo.png',
                          fit: BoxFit.contain,
                          //  width: size.width,
                        ),
                      ),
                      Positioned(
                        bottom: 100,
                        left: 13,
                        child: Image.asset(
                          'assets/Twitter Logo.png',
                          fit: BoxFit.contain,
                          //  width: size.width,
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 25,
                        child: Image.asset(
                          'assets/Vector 64.png',
                          fit: BoxFit.contain,
                          //  width: size.width,
                        ),
                      ),
                      Positioned(
                        bottom: 100,
                        left: 80,
                        child: Image.asset(
                          'assets/Vector 63.png',
                          fit: BoxFit.contain,
                          //  width: size.width,
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 150,
                        child: Image.asset(
                          'assets/Spectrum Logo.png',
                          fit: BoxFit.contain,
                          //  width: size.width,
                        ),
                      ),
                    ])),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              width: size.width * 0.7,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Hundreds of jobs are waiting for you to  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'join together',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 25,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SizedBox(
                width: size.width * 0.88,
                child: Text(
                  'Immediately join us and start applying for the job you are interested in. ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.radley(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey.shade600),
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        )),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Center(
              child: RichText(
                text: const TextSpan(
                  text: '●',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  children: <TextSpan>[
                    TextSpan(
                        text: '●',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                    TextSpan(
                        text: '●',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: size.width * 0.7,
                margin: const EdgeInsets.all(6),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      textStyle: WidgetStatePropertyAll<TextStyle>(
                        TextStyle(fontSize: 19, color: Colors.black),
                      ),
                      alignment: Alignment.center,
                      elevation: WidgetStatePropertyAll<double>(0),
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
