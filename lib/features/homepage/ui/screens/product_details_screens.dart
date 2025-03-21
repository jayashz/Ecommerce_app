import 'package:ecommerce_app/features/homepage/cubit/add_product_to_cart_cubit.dart';
import 'package:ecommerce_app/features/homepage/cubit/fetch_product_details_cubit.dart';
import 'package:ecommerce_app/features/homepage/repository/product_repository.dart';
import 'package:ecommerce_app/features/homepage/ui/widgets/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreens extends StatelessWidget {
  final String productId;
  const ProductDetailsScreens({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchProductDetailsCubit(
              productRepository: context.read<ProducRepository>())
            ..FetechProductDetails(productId),
        ),
        BlocProvider(
          create: (context) => AddProductToCartCubit(
            productRepository: context.read<ProducRepository>(),
          ),
        ),
      ],
      child: ProductDetailsWidgets(productId: productId),
    );
  }
}
