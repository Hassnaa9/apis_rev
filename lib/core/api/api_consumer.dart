 abstract class ApiConsumer {
   Future <dynamic> get(String url,
        Object data,
        Map<String, dynamic> queryParameters); // get method to fetch data from the server
   Future <dynamic> post(
    String url,
        Object data,
        Map<String, dynamic> queryParameters
   );
   Future <dynamic> put(
    String url,
        Object data,
        Map<String, dynamic> queryParameters
   );
   Future <dynamic> delete(
    String url,
        Object data,
        Map<String, dynamic> queryParameters
   );
 }