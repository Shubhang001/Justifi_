import 'package:http/http.dart' as http;
import 'package:jusitfi_admin/api/base_url.dart';

getReviews() async {
  // Initialising a HTTP request
  var request = http.Request(
    'GET',
    Uri.parse(
      '$baseURL/v1/profiles/reviews',
    ),
  );

  // Response Stored
  http.StreamedResponse response = await request.send();

  // Api Actions
  if (response.statusCode == 200) {
    return await response.stream.bytesToString();
  } else {
    return response.reasonPhrase.toString();
  }
}
