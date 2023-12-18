import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:getx_sample/common/code_info.dart';
import 'package:getx_sample/common/const.dart';
import 'package:getx_sample/data/api/api_info.dart';
import 'package:getx_sample/data/dto/photo_bean.dart';

class PhotoDao extends GetConnect {

  static PhotoDao get to => Get.put(PhotoDao());

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = ApiInfo.rootPhotoUrl;
    httpClient.defaultContentType = gDefaultContentType;
    httpClient.addRequestModifier((Request request) {
      request.headers[gAccept] = gHeaderAccept;
      return request;
    });
  }

  Future<Map<String, dynamic>> getPhotos() async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    List<PhotoBean> list = [];

    try {
      final Response response = await get('/v2/list?page=2&limit=100');

      if (response.statusCode == HttpStatus.ok) {
        list = response.body.map<PhotoBean>((json) => PhotoBean.fromJson(json)).toList();
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
}