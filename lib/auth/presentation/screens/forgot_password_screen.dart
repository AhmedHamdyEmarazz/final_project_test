import 'package:flutter/material.dart';
import 'package:jobseque/auth/models/customTextField.dart';
import 'package:jobseque/auth/presentation/screens/checkYourEmal_screen.dart';
import 'package:jobseque/auth/presentation/screens/login.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

final emailController = TextEditingController();

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        //   automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            //    height: size.height * 0.4,
            child: Image.asset(
              'assets/Logo-2.png',
              fit: BoxFit.contain,
              //  width: size.width,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
              child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Reset Password',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 7,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: size.width * 0.87,
                  child: CustomTextField(
                      icon: const Icon(Icons.email),
                      controller: emailController,
                      hintText: 'Email',
                      validator: (value) {
                        if (value.toString().contains('@') ||
                            value.toString().contains('.')) {
                          return null;
                        } else {
                          return 'wrong email';
                        }
                      }),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          )),
        ),
      ),
      persistentFooterButtons: [
        Column(children: [
          TextButton(
            onPressed: () {
              setState(() {
                emailController.clear();
              });

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const Login(); //todo: return the correct widget
              }));
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'remember password ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      )),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const CheckyouremalScreen(); //todo: return the correct widget
                  }));
                },
                child: const Text(
                  'Request password reset',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ])
      ],
    );
  }
}
