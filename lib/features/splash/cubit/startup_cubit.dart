import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/common/services/database_services.dart';
import 'package:ecommerce_app/features/splash/model/startup_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartupCubit extends Cubit<CommonState> {
  StartupCubit() : super(CommonIntialState());

  init() async {
    emit(CommonLoadingState());
    await Future.delayed(Duration(seconds: 2));
    final isFirstTime = await DatabaseServices().isFirstTime;
    final param =
        StartupData(isLoggedIn: false, isAppOpenedFirstTime: isFirstTime);
    emit(CommonSuccessState(data: param));
  }
}
