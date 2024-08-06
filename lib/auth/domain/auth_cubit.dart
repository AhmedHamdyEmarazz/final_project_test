import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobseque/auth/data/repository/auth_reposiory.dart';
import 'package:jobseque/auth/domain/auth_states.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit():super(InitialState());


  createUser({required String name,required String email ,required String password})async{
    emit(CreateUserLoading());
    await Future.delayed(Duration(seconds: 3));
    try{
    await AuthReposiory.createAccount(name, email, password);
    emit(CreateUserSuccess());
    }catch(e){
      emit(CreateUserError());
    }
    
  }
}