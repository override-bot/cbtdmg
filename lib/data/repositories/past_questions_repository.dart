import 'package:cbtdmg/utils/access_token.dart';
import 'package:dio/dio.dart';

import '../models/subject_list_model.dart';

class PastQuestionRepository {
  final Dio _dio = Dio();
  Future<List<String>> getListOfSubjects() async {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers["AccessToken"] = token;
        return handler.next(options);
      },
    ));
    try {
      Response response;

      response = await _dio.get(
        'https://questions.aloc.com.ng/api/v2/q-subjects',
        options: Options(
          validateStatus: (status) {
            return true;
          },
        ),
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        SubjectListModel subjectModel =
            SubjectListModel.fromJson(response.data['subjects']);
        List<String> subjectList = subjectModel.getSubjectList();
        return subjectList;
      } else {
        throw "something went wrong";
      }
    } catch (e) {
      rethrow;
    }
  }
}
