import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/model/cart.dart';
import 'package:ecommerce_app/features/cart/model/order_params.dart';
import 'package:ecommerce_app/features/cart/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitiateOrderCubit extends Cubit<CommonState> {
  final CartRepository cartRepository;
  InitiateOrderCubit({required this.cartRepository})
      : super(CommonIntialState());

  initiateOrderPayment({required OrderParams params}) async {
    emit(CommonLoadingState());
    final res = await cartRepository.initiateOrder(params: params);
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) =>
          emit(CommonSuccessState<List<Cart>>(data: cartRepository.cartItems)),
    );
  }
}
