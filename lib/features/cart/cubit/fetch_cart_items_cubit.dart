import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/model/cart.dart';
import 'package:ecommerce_app/features/cart/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchCartItemsCubit extends Cubit<CommonState> {
  final CartRepository cartRepository;
  FetchCartItemsCubit({required this.cartRepository})
      : super(CommonIntialState());

  fetchProducts() async {
    emit(CommonLoadingState());
    final res = await cartRepository.fetchCartItems();
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) => emit(CommonSuccessState<List<Cart>>(data: data)),
    );
  }

  updatItems() async {
    emit(CommonLoadingState());
    emit(CommonSuccessState<List<Cart>>(data: cartRepository.cartItems));
  }
}
