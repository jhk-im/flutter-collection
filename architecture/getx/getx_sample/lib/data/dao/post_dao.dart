import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:getx_sample/common/code_info.dart';
import 'package:getx_sample/common/const.dart';
import 'package:getx_sample/data/api/api_info.dart';
import 'package:getx_sample/data/dto/post_bean.dart';

class PostDao extends GetConnect {

  static PostDao get to => Get.put(PostDao());

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = ApiInfo.rootPostUrl;
    httpClient.defaultContentType = gDefaultContentType;
    httpClient.addRequestModifier((Request request) {
      request.headers[gAccept] = gHeaderAccept;
      return request;
    });
  }

  Future<Map<String, dynamic>> getPosts() async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    List<PostBean> list = [];

    try {
      final Response response = await get('/posts');

      if (response.statusCode == HttpStatus.ok) {
        list = response.body.map<PostBean>((json) => PostBean.fromJson(json)).toList();
      } else {
        code = CodeInfo.error;
      }
    } catch(e) {
      code = CodeInfo.error;
      e.printError();
    }

    resultMap[gResultCode] = code;
    resultMap[gResultList] = list;

    return resultMap;
  }

  Future<Map<String, dynamic>> getPost(int id) async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    PostBean bean = PostBean();

    try {
      final Response response = await get('/posts/$id');

      if (response.statusCode == HttpStatus.ok) {
        bean = PostBean.fromJson(response.body);
      } else {
        code = CodeInfo.error;
      }
    } catch(e) {
      code = CodeInfo.error;
      e.printError();
    }

    resultMap[gResultCode] = code;
    resultMap[gResultBean] = bean;

    return resultMap;
  }
}