import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikachat/cubit/search_state.dart';
import 'package:http/http.dart' as http;

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  Future<void> getSearchResponse({required String query}) async {
    emit(SearchLoadingState());

    // API
    String apiKey = 'AIzaSyDXmTxtJThIql0RL1H746lezGfaFHMJOwI';

    // URL
    String url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey';

    // API Parse
    var uri = Uri.parse(url);

    // Body
    Map<String, dynamic> bodyParams = {
      "contents": [
        {
          "parts": [
            {"text": query},
          ],
        },
      ],
    };

    // Final Response
    var response = await http.post(uri, body: jsonEncode(bodyParams));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var res = data['candidates'][0]['content']['parts'][0]['text'];

      emit(SearchLoadedState(res: res));
    } else {
      var error = "Error : ${response.statusCode}";
      emit(SearchErrorState(errorMsg: error));
    }
  }
}
