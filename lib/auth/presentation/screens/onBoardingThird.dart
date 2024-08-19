import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseque/auth/presentation/screens/signUP.dart';
// import 'package:jobseque/auth/presentation/screens/create_account.dart';

class OnBoardingThird extends StatefulWidget {
  const OnBoardingThird({super.key});

  @override
  State<OnBoardingThird> createState() => _OnBoardingThirdState();
}

class _OnBoardingThirdState extends State<OnBoardingThird> {
  @override
  void initState() {
    super.initState();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SignUp(),
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
    // const appbarheight = kToolbarHeight;
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
                        'assets/image 9.png',
                        fit: BoxFit.fill,
                        width: size.width,
                      ),
                      Positioned(
                        bottom: 90,
                        left: 95,
                        child: Image.asset(
                          'assets/Ellipse 797.png',
                          fit: BoxFit.contain,
                          //  width: size.width,
                        ),
                      ),
                      Positioned(
                        bottom: 55,
                        left: 200,
                        child: Image.asset(
                          'assets/Twitter Logo.png',
                          fit: BoxFit.contain,
                          //  width: size.width,
                        ),
                      ),
                      Positioned(
                        bottom: 110,
                        left: 70,
                        child: Image.asset(
                          'assets/Discord Logo.png',
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
                  text: 'Get the best ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'choice for the job ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 25,
                        )),
                    TextSpan(
                        text: 'youve always dreamed of ',
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
//
            SizedBox(
                width: size.width * 0.88,
                child: Text(
                  'The better the skills you have, the greater the good job opportunities for you. ',
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
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                    TextSpan(
                        text: '●',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  ],
                ),
              ),
            ),
            Center(
              // child: Expanded(
              child: Container(
                width: size.width * 0.7,
                margin: const EdgeInsets.all(6),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      textStyle: MaterialStatePropertyAll<TextStyle>(
                        TextStyle(fontSize: 19, color: Colors.black),
                      ),
                      alignment: Alignment.center,
                      elevation: MaterialStatePropertyAll<double>(0),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: const Text(
                    'Get Started',
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
