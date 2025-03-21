import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/model/cart.dart';
import 'package:ecommerce_app/features/cart/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCartItemQuantityCubit extends Cubit<CommonState> {
  final CartRepository cartRepository;
  UpdateCartItemQuantityCubit({required this.cartRepository})
      : super(CommonIntialState());

  updateCartItemquantity(
      {required String CartId, required int quantity}) async {
    emit(CommonLoadingState());
    final res = await cartRepository.updateCartItemQuantity(
        CartItemId: CartId, quantity: quantity);
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) => emit(CommonSuccessState<Cart>(data: data)),
    );
  }
}
