import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobseque/auth/domain/auth_cubit.dart';
import 'package:jobseque/auth/presentation/screens/create_account.dart';
import 'package:jobseque/observer.dart';

void main() {
    Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        home: CreateAccount(),
      ),
    );
  }
}
