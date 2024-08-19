import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseque/auth/presentation/screens/succesfulLog_screen.dart';

class WorkCountry extends StatefulWidget {
  const WorkCountry({super.key});

  @override
  State<WorkCountry> createState() => _WorkCountryState();
}

bool usa = false;
bool ksa = false;
bool egy = false;
bool can = false;
bool val = false;

class _WorkCountryState extends State<WorkCountry> {
  @override
  void initState() {
    super.initState();
    usa = false;
    can = false;
    egy = false;
    ksa = false;
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SuccesfullogScreen(),
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:
// SingleChildScrollView(
//         child:
          Container(
              alignment: Alignment.topCenter,
              height: size.height,
              child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: size.width * 0.88,
                      child: Text(
                        'Where are you prefered Location? ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.radley(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Colors.black),
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                      width: size.width * 0.88,
                      child: Text(
                        'Let us know, where is the work location you want at this time, so we can adjust it.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.radley(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Colors.grey.shade600),
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: size.width * 0.95,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                val = false;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: size.width * 0.6,
                              decoration: BoxDecoration(
                                  color:
                                      !val ? Colors.blue : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(left: 30),
                                child: Text(
                                  'work from office',
                                  style: TextStyle(
                                      color: val ? Colors.black : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: size.width,
                          //    color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                val = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.only(right: 5),
                              alignment: Alignment.centerRight,
                              width: val ? size.width * 0.6 : size.width * 0.3,
                              decoration: BoxDecoration(
                                  color:
                                      val ? Colors.blue : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                margin: const EdgeInsets.only(right: 30),
                                child: Text(
                                  'remote work',
                                  style: TextStyle(
                                      color:
                                          !val ? Colors.black : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                      width: size.width * 0.88,
                      child: Text(
                        'Select the country you want for your job',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.radley(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Colors.grey.shade600),
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    //  alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 30, left: 30, top: 30),
                    height: size.height * 0.4,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: ' 🇺🇸  united states',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              usa = !usa;
                            });
                          },
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: usa ? Colors.blue : Colors.black,
                            fontSize: 20,
                            backgroundColor: usa
                                ? Colors.blue.shade100
                                : Colors.grey.shade200),
                        children: <TextSpan>[
                          const TextSpan(
                              text: '    ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25,
                                  backgroundColor: Colors.white)),
                          TextSpan(
                              text: ' 🇪🇬  egypt',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    egy = !egy;
                                  });
                                },
                              style: TextStyle(
                                //  fontWeight: FontWeight.bold,
                                color: egy ? Colors.blue : Colors.black,
                                fontSize: 20,
                                backgroundColor: egy
                                    ? Colors.blue.shade100
                                    : Colors.grey.shade200,
                                // decoration: TextDecoration.underline
                                // background: Paint()..color,
                              )),
                          const TextSpan(
                              text: '   ',
                              style: TextStyle(
                                  //  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25,
                                  backgroundColor: Colors.white)),
                          TextSpan(
                              text: ' 🇸🇦  ksa',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    ksa = !ksa;
                                  });
                                },
                              style: TextStyle(
                                  //   fontWeight: FontWeight.bold,
                                  color: ksa ? Colors.blue : Colors.black,
                                  fontSize: 20,
                                  backgroundColor: ksa
                                      ? Colors.blue.shade100
                                      : Colors.grey.shade200)),
                          const TextSpan(
                              text: '     ',
                              style: TextStyle(
                                  //  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25,
                                  backgroundColor: Colors.white)),
                          TextSpan(
                              text: ' 🇨🇦  canada',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    can = !can;
                                  });
                                },
                              style: TextStyle(
                                  //   fontWeight: FontWeight.bold,
                                  color: can ? Colors.blue : Colors.black,
                                  fontSize: 20,
                                  backgroundColor: can
                                      ? Colors.blue.shade100
                                      : Colors.grey.shade200)),
                        ],
                      ),
                    ),
                  )
                ],
              )),
      persistentFooterButtons: [
        Center(
          child: Container(
            height: size.height * 0.05,
            width: size.width * 0.7,
            margin: const EdgeInsets.all(6),
            child: ElevatedButton(
              style: const ButtonStyle(
                  textStyle: WidgetStatePropertyAll<TextStyle>(
                    TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  alignment: Alignment.center,
                  elevation: WidgetStatePropertyAll<double>(0),
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
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
    );
  }
}
