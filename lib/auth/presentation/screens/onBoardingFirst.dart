import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:jobseque/auth/presentation/screens/create_account.dart';
import 'package:jobseque/auth/presentation/screens/onBoardingSecond.dart';
import 'package:jobseque/auth/presentation/screens/signUP.dart';

class OnBoardingFirst extends StatefulWidget {
  const OnBoardingFirst({super.key});

  @override
  State<OnBoardingFirst> createState() => _OnBoardingFirstState();
}

class _OnBoardingFirstState extends State<OnBoardingFirst> {
  @override
  void initState() {
    super.initState();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnBoardingSecond(),
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
              child: Image.asset(
                'assets/Group.png',
                fit: BoxFit.fill,
                width: size.width,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              width: size.width * 0.7,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Find a job ,and ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                    //   background: Paint()
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Start building',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 25,
                          // backgroundColor: Colors.grey.shade200,
                          // decoration: TextDecoration.underline
                          // background: Paint()..color,
                        )),
                    TextSpan(
                        text: ' your career from now on',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                  'Explore over 25,924 available job roles and upgrade your operator now. ',
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
                      fontWeight: FontWeight.bold, color: Colors.blue),
                  children: <TextSpan>[
                    TextSpan(
                        text: '●',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
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
