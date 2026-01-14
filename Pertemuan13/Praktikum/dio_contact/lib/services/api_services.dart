import 'package:dio/dio.dart';
import 'package:dio_contact/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:dio_contact/model/login_model.dart';

class ApiServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://contactsapi-production.up.railway.app/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<ContactsModel>?> getAllContact() async {
    try {
      final response = await dio.get('/contacts');
      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((e) => ContactsModel.fromJson(e))
            .toList();
      }
      return null;
    } on DioException catch (e) {
      debugPrint('Dio error: ${e.message}');
      return null;
    }
  }

  Future<LoginResponse?> login(LoginInput login) async {
    try {
      final response = await dio.post('/login', data: login.toJson());

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      if (e.response != null) {
        return LoginResponse.fromJson(e.response!.data);
      }
      rethrow;
    }
  }

  Future<ContactResponse?> deleteContact(String id) async {}

  Future<ContactResponse?> putContact(
    String idContact,
    ContactInput postModel,
  ) async {}

  Future<ContactResponse?> postContact(ContactInput postModel) async {}

  Future getSingleContact(String id) async {}
}
