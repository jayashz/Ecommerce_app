import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/auth/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<CommonState> {
  LoginCubit({required this.repository}) : super(CommonIntialState());
  final UserRepository repository;
  login({required String email, required String password}) async {
    emit(CommonLoadingState());
    final res = await repository.login(email: email, password: password);
    res.fold((err) {
      emit(CommonErrorState(message: err));
    }, (data) {
      emit(CommonSuccessState(data: null));
    });

    // signup(
    //     {required String fName,
    //     required String phoneNum,
    //     required String address,
    //     required String email,
    //     required String password}) async {
    //   emit(CommonLoadingState());

    // }
  }
}
