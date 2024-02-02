import 'package:cbtdmg/data/models/past_question_request.dart';
import 'package:cbtdmg/data/models/question_model.dart';
import 'package:cbtdmg/data/models/subject_model.dart';
import 'package:dio/dio.dart';

import '../../utils/access_token.dart';
import '../models/subject_list_model.dart';

class PastQuestionRepository {
  final Dio _dio = Dio();
  Future<List<String>> getListOfSubjects() async {
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

  Future<List<Question>> getPastQuestions(PastQuestionRequest data) async {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers["AccessToken"] = token;
        return handler.next(options);
      },
    ));
    // print(withComp);
    try {
      Response response;
      response = await _dio.get(
        'https://questions.aloc.com.ng/api/v2/q/45?year=${data.year}&subject=${data.subject}&type=utme',
        options: Options(
          validateStatus: (status) {
            return true;
          },
        ),
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List result = response.data['data'];
        return result.map((e) {
          return Question.fromJson(e);
        }).toList();
      } else {
        throw "something went wrong";
      }
    } catch (e) {
      rethrow;
    }
  }
}
