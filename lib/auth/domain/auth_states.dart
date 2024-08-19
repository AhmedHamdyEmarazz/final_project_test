abstract class AuthStates {}

class InitialState extends AuthStates {}

class CreateUserLoading extends AuthStates {}

class CreateUserSuccess extends AuthStates {}

class CreateUserError extends AuthStates {}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {}

class LoginError extends AuthStates {}
