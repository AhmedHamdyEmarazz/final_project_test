import 'package:flutter/material.dart';
import 'package:jobseque/auth/models/customTextField.dart';
import 'package:jobseque/auth/presentation/screens/login.dart';
import 'package:jobseque/auth/presentation/screens/successfulPasswordChanging_screen.dart';

class CreatenewpasswordScreen extends StatefulWidget {
  const CreatenewpasswordScreen({super.key});
  @override
  State<CreatenewpasswordScreen> createState() =>
      _CreatenewpasswordScreenState();
}

final emailController = TextEditingController();
final confirmPasswordController = TextEditingController();
final passwordController = TextEditingController();
bool val = false;
bool emailnotempty = false;
bool passnotempty = false;
// List<UserModel> users = [];
bool red = false;

class _CreatenewpasswordScreenState extends State<CreatenewpasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    passwordController.addListener(() {
      (passwordController.text.isNotEmpty && passwordController.text.length < 8)
          ? setState(() {
              red = true;
            })
          : setState(() {
              red = false;
            });
      (passwordController.text.isNotEmpty)
          ? setState(() {
              passnotempty = true;
            })
          : setState(() {
              passnotempty = false;
            });
    });
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
                      icon: const Icon(Icons.lock),
                      eye: true,
                      controller: passwordController,
                      hintText: 'password',
                      validator: (pass) {
                        if (pass.toString().characters.length >= 8) {
                          return null;
                        } else {
                          return 'more than or equal six characters';
                        }
                      }),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 30),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'password must be at least 8 characters',
                      style: TextStyle(
                          fontSize: 16,
                          color: (passwordController.text.isEmpty)
                              ? Colors.grey
                              : (passwordController.text.isNotEmpty &&
                                      passwordController.text.length < 8)
                                  ? Colors.red
                                  : Colors.greenAccent),
                    )),
                SizedBox(
                  height: size.height * 0.025,
                ),
                SizedBox(
                  width: size.width * 0.87,
                  child: CustomTextField(
                      icon: const Icon(Icons.lock),
                      eye: true,
                      controller: confirmPasswordController,
                      hintText: 'Confirm password',
                      validator: (pass) {
                        if (pass.toString().characters.length >= 8) {
                          return null;
                        } else {
                          return 'more than or equal six characters';
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
                return const Login();
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
                onPressed: () async {
                  _formkey.currentState!.validate();
                  if (passwordController.text ==
                          confirmPasswordController.text &&
                      _formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('User created'),
                      backgroundColor: Colors.green,
                    ));
                    Future.delayed(const Duration(seconds: 3));
                    setState(() {
                      emailController.clear();
                      nameController.clear();
                      passwordController.clear();
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const SuccessfulpasswordchangingScreen();
                    }));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(passwordController.text !=
                              confirmPasswordController.text
                          ? 'password not match'
                          : 'error'),
                      backgroundColor: Colors.red,
                    ));
                  }
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return const SuccessfulpasswordchangingScreen(); //todo: change password functions and checking password matching
                  // }));
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
