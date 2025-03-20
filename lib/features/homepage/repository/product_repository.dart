import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/features/auth/repository/user_repository.dart';
import 'package:ecommerce_app/features/homepage/model/product.dart';

class ProducRepository {
  final UserRepository userRepository;
  ProducRepository({required this.userRepository});
  final Dio _dio = Dio();

  Future<Either<String, List<Product>>> fetchProducts() async {
    try {
      final response = await _dio.get(
        "${Constants.baseUrl}/products",
        options: Options(headers: {
          "Authorization": "Bearer ${userRepository.token}",
        }),
      );
      final _tempProducts = List.from(response.data["results"])
          .map((e) => Product.fromJson(e))
          .toList();
      return Right(_tempProducts);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to fetch products!");
    } catch (e) {
      print(e);
      return Left("Unable to fetch the products!");
    }
  }

  Future<Either<String, Product>> fetchProductDetails(String productId) async {
    try {
      final response = await _dio.get(
        "${Constants.baseUrl}/products/${productId}",
        options: Options(headers: {
          "Authorization": "Bearer ${userRepository.token}",
        }),
      );
      final prodDetails = Product.fromJson(response.data["results"]);
      return Right(prodDetails);
    } on DioException catch (e) {
      return Left(
          e.response?.data["message"] ?? "Unable to fetch product details!");
    } catch (e) {
      print(e);
      return Left("Unable to fetch the products details");
    }
  }

  Future<Either<String, void>> addToCart(String productId) async {
    try {
      final _ = await _dio.post(
        "${Constants.baseUrl}/cart",
        data: {"product": productId},
        options: Options(headers: {
          "Authorization": "Bearer ${userRepository.token}",
        }),
      );
      return Right(null);
    } on DioException catch (e) {
      return Left(
          e.response?.data["message"] ?? "Unable to add product in the cart");
    } catch (e) {
      print(e);
      return Left("Unable to add the products in the cart");
    }
  }
}
