import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/constants.dart';

class UserRepository {
  final Dio _dio = Dio();
  Future<Either<String, void>> login(
      {required String email, required String password}) async {
    try {
      final Map<String, dynamic> payload = {
        "email": email,
        "password": password
      };
      final response = await _dio.post(
        "${Constants.baseUrl}/auth/login",
        data: payload,
      );
      print(response);
      return Right(null);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "unable to login");
    } catch (e) {
      return Left("unable to login");
    }
  }

  // Future<Either<String, void>> signup(
  //     {required String fName,
  //     required String phoneNum,
  //     required String address,
  //     required String email,
  //     required String password}) async {
  //       try{

  //       }
  //     }
}
