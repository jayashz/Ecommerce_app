import 'package:ecommerce_app/features/cart/cubit/fetch_cart_items_cubit.dart';
import 'package:ecommerce_app/features/cart/repository/cart_repository.dart';
import 'package:ecommerce_app/features/cart/ui/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchCartItemsCubit(cartRepository: context.read<CartRepository>())
            ..fetchProducts(),
      child: CartWidget(),
    );
  }
}
