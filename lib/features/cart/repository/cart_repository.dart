import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/features/auth/repository/user_repository.dart';
import 'package:ecommerce_app/features/cart/model/cart.dart';

class CartRepository {
  final UserRepository userRepository;
  CartRepository({required this.userRepository});
  final Dio _dio = Dio();

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
      return Right(_tempCart);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to fetch products!");
    } catch (e) {
      print(e);
      return Left("Unable to fetch the products!");
    }
  }
}
