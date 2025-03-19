import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/homepage/model/product.dart';
import 'package:ecommerce_app/features/homepage/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchProductCubit extends Cubit<CommonState> {
  final ProducRepository productRepository;
  FetchProductCubit({required this.productRepository})
      : super(CommonIntialState());

  fetchProducts() async {
    emit(CommonLoadingState());
    final res = await productRepository.fetchProducts();
    res.fold(
      (err) => emit(CommonErrorState(message: err)),
      (data) => emit(CommonSuccessState<List<Product>>(data: data)),
    );
  }
}
