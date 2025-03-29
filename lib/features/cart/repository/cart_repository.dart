import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/features/auth/repository/user_repository.dart';
import 'package:ecommerce_app/features/cart/model/cart.dart';
import 'package:ecommerce_app/features/cart/model/order_params.dart';

class CartRepository {
  final UserRepository userRepository;
  CartRepository({required this.userRepository});
  final Dio _dio = Dio();

  List<Cart> _cartItems = [];

  List<Cart> get cartItems => _cartItems;

  Future<Either<String, List<Cart>>> fetchCartItems() async {
    try {
      final response = await _dio.get(
        "${Constants.baseUrl}/cart",
        options: Options(headers: {
          "Authorization": "Bearer ${userRepository.token}",
        }),
      );
      final _tempCart = List.from(response.data["results"])
          .map((e) => Cart.fromMap(e))
          .toList();
      _cartItems.clear;
      _cartItems.addAll(_tempCart);
      return Right(_tempCart);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to fetch products!");
    } catch (e) {
      print(e);
      return Left("Unable to fetch the products!");
    }
  }

  Future<Either<String, Cart>> updateCartItemQuantity(
      {required String CartItemId, required int quantity}) async {
    try {
      final res = await _dio.put(
        "${Constants.baseUrl}/cart/$CartItemId",
        data: {"quantity": quantity},
        options: Options(headers: {
          "Authorization": "Bearer ${userRepository.token}",
        }),
      );
      final cartItem = Cart.fromMap(res.data["results"]);
      final index = _cartItems.indexWhere((e) => e.id == cartItem.id);
      if (index != -1) {
        _cartItems[index] = cartItem;
      }
      return Right(cartItem);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ??
          "Unable to add cart quantity in the cart");
    } catch (e) {
      print(e);
      return Left("Unable to add the cart quantity in the cart");
    }
  }

  Future<Either<String, Cart>> initiateOrder(
      {required OrderParams params}) async {
    try {
      final res = await _dio.post(
        "${Constants.baseUrl}/orders",
        data: params.toMap(),
        options: Options(headers: {
          "Authorization": "Bearer ${userRepository.token}",
        }),
      );
      final orderId = res.data["results"]["_id"];

      return Right(orderId);
    } on DioException catch (e) {
      return Left(
          e.response?.data["message"] ?? "Unable to initiate the order");
    } catch (e) {
      print(e);
      return Left("Unable to initiate the order");
    }
  }
}
