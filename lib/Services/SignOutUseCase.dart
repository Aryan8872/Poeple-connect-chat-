import 'package:chat/Repository/Repository interface/FirebaseAuthContract.dart';

class SignOutUseCase{

  FirebaseAuthRepository repository ;
  SignOutUseCase(this.repository);

  Future<String> invoke()async {
    var response = await repository.signOut();
    return response;
  }

}