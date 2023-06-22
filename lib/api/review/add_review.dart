import 'package:http/http.dart' as http;

import '../base_url.dart';

addReview(
  String client,
  advocate,
  rating,
  review,
) async {
  // Initialising a POST Request
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(
      '$baseURL/v1/profiles/reviews/',
    ),
  );

  // Adding all the Text Data
  request.fields.addAll(
    {
      'client': client,
      'advocate': advocate,
      'rating': rating,
      'review': review,
    },
  );

  // HTTP streamed response is sent
  http.StreamedResponse response = await request.send();

  // Api Actions
  if (response.statusCode == 200) {
    return await response.stream.bytesToString();
  } else {
    return response.reasonPhrase.toString();
  }
}
