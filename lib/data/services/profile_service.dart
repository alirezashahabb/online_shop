import 'package:dio/dio.dart';
import 'package:online_shop/data/model/user_comment_model.dart';
import 'package:online_shop/utils/http_clinet.dart';

class ProfileService {
  Future<List<UserCommentModel>> getComment() async {
    Response response = await httpClient.get('users/me/comments');

    List<UserCommentModel> userComments = [];

    for (var comment in response.data) {
      userComments.add(UserCommentModel.fromJson(comment));
    }
    return userComments;
  }
}
