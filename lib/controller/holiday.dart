import 'package:dio/dio.dart';

class HolidayAPI {
  final Dio dio = Dio();
  final String baseUrl = 'https://brasilapi.com.br/api/feriados/v1';

  Future<List<dynamic>> getHolidays (int ano) async {
    try {
      final response = await dio.get('$baseUrl/$ano');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Falha ao carregar dados');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }

}