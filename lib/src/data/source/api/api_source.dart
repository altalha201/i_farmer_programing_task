abstract class ApiSource {
  Future<Map<String, dynamic>> getResponseFromOMDb(Map<String, dynamic> params);
}