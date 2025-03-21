import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/common/buttons/custom_rounded_button.dart';
import 'package:ecommerce_app/features/cart/cubit/fetch_cart_items_cubit.dart';
import 'package:ecommerce_app/features/cart/model/cart.dart';
import 'package:ecommerce_app/features/cart/ui/widgets/cart_card.dart';
import 'package:ecommerce_app/features/checkout/ui/screens/check_out_page.dart';
import 'package:ecommerce_app/features/homepage/ui/widgets/product_details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<FetchCartItemsCubit, CommonState>(
              builder: (context, state) {
            if (state is CommonSuccessState<List<Cart>>) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 16),
                itemBuilder: (context, index) {
                  return CartCard(item: state.data[index]);
                },
                itemCount: state.data.length,
              );
            } else if (state is CommonErrorState) {
              return Center(child: Text(state.message));
            } else {
              return ProductDetailsShimmer();
            }
          }),
        ),
        BlocSelector<FetchCartItemsCubit, CommonState, bool>(
          selector: (state) {
            if (state is CommonSuccessState<List<Cart>>) {
              return state.data.isNotEmpty;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, -3),
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        "Total Cost: Rs. 2000000",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    CustomRoundedButtom(
                      title: "Checkout",
                      onPressed: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: CheckoutPage(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
