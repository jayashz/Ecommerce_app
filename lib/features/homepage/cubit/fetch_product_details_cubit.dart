import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/homepage/model/product.dart';
import 'package:ecommerce_app/features/homepage/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchProductDetailsCubit extends Cubit<CommonState> {
  final ProducRepository productRepository;
  FetchProductDetailsCubit({required this.productRepository})
      : super(CommonIntialState());

  FetechProductDetails(String productId) async {
    emit(CommonLoadingState());
    final res = await productRepository.fetchProductDetails(productId);
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) => emit(CommonSuccessState<Product>(data: data)),
    );
  }
}
