import 'dart:convert';

import 'package:http/http.dart';

class TodoServices {
  Future<Response> getAllTodosRequest() async {
    return await get(
        Uri.parse('https://murmuring-mesa-57397.herokuapp.com/todos'));
  }
 


 // create Todo
Future<Response> createTodoRequest(
    {required String title,
    required String description,
    required String dateTime}) async {
  Map<String, String> header = {'Content-Type': 'application/json'};
  Map<String, String> body = {
    'title': title,
    'description': description,
    'date_time': dateTime
  };
  return await post(
      Uri.parse('https://murmuring-mesa-57397.herokuapp.com/todos'),
      body: jsonEncode(body),
      headers: header);
}

// update a Todo
Future<Response> updateTodoRequest(
    {required bool status, required String id}) async {
  Map<String, bool> body = {'status': status};
  Map<String, String> header = {'Content-Type': 'application'};
  return await patch(
      Uri.parse('https://murmuring-mesa-57397.herokuapp.com/todos'),
      body: jsonEncode(body),
      headers: header);
}

// delete Todo
Future<Response> deleteTodoRequest(String id) async {
  return await delete(
      Uri.parse('https://murmuring-mesa-57397.herokuapp.com/todos/$id'));
}
}