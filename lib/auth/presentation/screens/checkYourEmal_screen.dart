import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobseque/auth/presentation/screens/CreatenewPassword_screen.dart';

class CheckyouremalScreen extends StatefulWidget {
  const CheckyouremalScreen({super.key});

  @override
  State<CheckyouremalScreen> createState() => _CheckyouremalScreenState();
}

class _CheckyouremalScreenState extends State<CheckyouremalScreen> {
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
                        'assets/Email Ilustration.png',
                        fit: BoxFit.fill,
                        width: size.width,
                      )),
                  SizedBox(
                      width: size.width * 0.88,
                      child: Text(
                        'Check your Email! ',
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
                        'We have sent a reset password to your email address',
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const CreatenewpasswordScreen(); //todo: return the correct widget
                }));
              },
              child: const Text(
                'Open email app',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
