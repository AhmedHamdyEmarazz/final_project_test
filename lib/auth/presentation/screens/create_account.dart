import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobseque/auth/domain/auth_cubit.dart';
import 'package:jobseque/auth/domain/auth_states.dart';

class CreateAccount extends StatelessWidget {
   CreateAccount({super.key});
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit,AuthStates>(
        builder: (context, state) {
          if(state is CreateUserLoading)
          return Center(child: CircularProgressIndicator(),);
          else {
            return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextField(
                controller: nameC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'user name'),
              ),
              const SizedBox(
                height: 20,
              ),
               TextField(
                controller: emailC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'email'),
              ),
              const SizedBox(
                height: 20,
              ),
               TextField(
                controller: passC,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'password'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthCubit>().createUser(name: nameC.text, email: emailC.text, password: passC.text);
                  }, child: const Text('Create Account'))
            ],
          ),
        );
          }
        },
        listener: (context, state) {
          if(state is CreateUserSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User created'),backgroundColor: Colors.green,));
          }else if (state is CreateUserError){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('error'),backgroundColor: Colors.red,));
          }
        },
        
      ),
    );
  }
}
