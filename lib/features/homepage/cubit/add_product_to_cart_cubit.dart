import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/homepage/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductToCartCubit extends Cubit<CommonState> {
  final ProducRepository productRepository;
  AddProductToCartCubit({required this.productRepository})
      : super(CommonIntialState());

  add(String productId) async {
    emit(CommonLoadingState());
    final res = await productRepository.addToCart(productId);
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) => emit(CommonSuccessState(data: null)),
    );
  }
}
