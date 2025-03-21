import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/common/custom_theme.dart';
import 'package:ecommerce_app/features/cart/cubit/update_cart_item_quantity_cubit.dart';
import 'package:ecommerce_app/features/cart/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatefulWidget {
  final Cart item;
  const CartCard({super.key, required this.item});
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int _quantity = 1;
  @override
  void initState() {
    _quantity = widget.item.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCartItemQuantityCubit, CommonState>(
      listener: (context, state) {
        if (state is CommonSuccessState<Cart> &&
            widget.item.id == state.data.id) {
          setState(() {
            _quantity = state.data.quantity;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 16,
          left: CustomTheme.horizontalPadding,
          right: CustomTheme.horizontalPadding,
        ),
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.item.product.image,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.item.product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Rs. ${widget.item.product.price}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        IconButton(
                          splashRadius: 10.0,
                          onPressed: () {
                            if (_quantity > 1) {
                              context
                                  .read<UpdateCartItemQuantityCubit>()
                                  .updateCartItemquantity(
                                      CartId: widget.item.id,
                                      quantity: _quantity - 1);
                            }
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 16,
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                        Text(
                          '${_quantity}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          splashRadius: 10.0,
                          onPressed: () {
                            context
                                .read<UpdateCartItemQuantityCubit>()
                                .updateCartItemquantity(
                                    CartId: widget.item.id,
                                    quantity: _quantity + 1);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 16,
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
