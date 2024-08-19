import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccesfullogScreen extends StatefulWidget {
  const SuccesfullogScreen({super.key});

  @override
  State<SuccesfullogScreen> createState() => _SuccesfullogScreenState();
}

class _SuccesfullogScreenState extends State<SuccesfullogScreen> {
  @override
  void initState() {
    super.initState();
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
                mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.all(6),
                      height: size.height * 0.3,
                      width: size.width * 0.67,
                      child: Image.asset(
                        'assets/Success Account Ilustration.png',
                        fit: BoxFit.fill,
                        width: size.width,
                      )),
                  SizedBox(
                      width: size.width * 0.88,
                      child: Text(
                        'Your account has been set up! ',
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
                      width: size.width * 0.8,
                      child: Text(
                        'We have customized feeds according to your preferences',
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
                // Navigator.of(context).push(_createRoute());
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
