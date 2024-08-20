import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:jobseque/auth/data/auth_ednpoints.dart';
import 'package:jobseque/auth/domain/auth_cubit.dart';
import 'package:jobseque/auth/domain/auth_states.dart';
import 'package:jobseque/auth/models/customTextField.dart';
import 'package:jobseque/auth/presentation/screens/jobTitle_screen.dart';
import 'package:jobseque/auth/presentation/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

final emailController = TextEditingController();
final nameController = TextEditingController();
final passwordController = TextEditingController();

//bool show = true;
bool red = false;
bool emailnotempty = false;
bool namenotempty = false;
bool passnotempty = false;
// List<UserModel> users = [];

class _SignUpState extends State<SignUp> {
  // void reset() {
  //   setState(() {
  //     show = true;
  //   });
  // }

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
    nameController.addListener(() {
      (nameController.text.isNotEmpty)
          ? setState(() {
              namenotempty = true;
            })
          : setState(() {
              namenotempty = false;
            });
    });
    emailController.addListener(() {
      (emailController.text.isNotEmpty)
          ? setState(() {
              emailnotempty = true;
            })
          : setState(() {
              emailnotempty = false;
            });
    });
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                        'Create Account',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Please create an account to find your dream job',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: size.width * 0.87,
                    child: CustomTextField(
                        icon: const Icon(Icons.person),
                        controller: nameController,
                        hintText: 'name',
                        validator: (controller2) {
                          if (controller2.toString().characters.length >= 3) {
                            return null;
                          } else {
                            return 'more than or equal three characters';
                          }
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
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
                    height: size.height * 0.025,
                  ),

                  SizedBox(
                    width: size.width * 0.87,
                    child: CustomTextField(
                        icon: const Icon(Icons.lock),
                        eye: true,
                        controller: passwordController,
                        hintText: 'password',
                        validator: (pass) {
                          if (pass.toString().characters.length >= 6) {
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
                    height: size.height * 0.1,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        emailController.clear();
                        nameController.clear();
                        passwordController.clear();
                      });

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const Login();
                      }));
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Already have an account ? ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.005,
                  // ),
                  BlocConsumer<AuthCubit, AuthStates>(
                    builder: (context, state) {
                      if (state is CreateUserLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SizedBox(
                          width: size.width * 0.7,
                          height: 47,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                textStyle: WidgetStatePropertyAll<TextStyle>(
                                  TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700),
                                ),
                                alignment: Alignment.center,
                                elevation:
                                    const WidgetStatePropertyAll<double>(0),
                                backgroundColor: WidgetStatePropertyAll<Color>(
                                    (emailnotempty &&
                                            namenotempty &&
                                            passnotempty)
                                        ? Colors.blue
                                        : Colors.grey.shade300)),
                            onPressed: () async {
                              if (!emailnotempty ||
                                  red ||
                                  !namenotempty ||
                                  !passnotempty) {
                                null;
                              } else {
                                _formkey.currentState!.validate();
                                if (_formkey.currentState!.validate()) {
                                  context.read<AuthCubit>().createUser(
                                        email: emailController.text,
                                        name: nameController.text,
                                        password: passwordController.text,
                                      );
                                }
                              }
                            },
                            child: Text(
                              'Create account',
                              style: TextStyle(
                                  color: (emailnotempty &&
                                          namenotempty &&
                                          passnotempty)
                                      ? Colors.white
                                      : Colors.grey.shade700),
                            ),
                          ),
                        );
                      }
                    },
                    listener: (context, state) async {
                      if (state is CreateUserSuccess) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
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
                          return const JobtitleScreen(); //todo: return the correct widget
                        }));
                      } else if (state is CreateUserError) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('error'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        const Divider(
                          indent: 30,
                          endIndent: 30,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: size.width * 0.5,
                          color: Colors.white,
                          child: const Text(
                            'Or Sign Up With Account',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ]),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          'assets/Button-2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final token = prefs.getString('token') ?? 'nullxx';
                          print((token));
                          var response = await get(
                            Uri.parse(AuthEdnpoints.profile),
                            headers: {
                              HttpHeaders.authorizationHeader: 'Bearer $token',
                            },
                          );
                          print((response.body));

                          //  print(response.body);
                          //     var data = jsonDecode(response.body);
                          // List articlesASMaps = data['data'];
                          // print('list before loop ${users.length}');
                          // for (var element in articlesASMaps) {
                          //   var model = UserModel.fromJson(element);
                          //   setState(() {
                          //     users.add(model);
                          //   });
                          //  }
                          print(jsonDecode(response.body));
                        },
                        child: Image.asset(
                          'assets/Button-3.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ));
  }
}
