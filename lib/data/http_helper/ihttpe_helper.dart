import 'package:nabed_test/model/image_card/image_list.dart';

abstract class IHttpHelper {
  Future<ImageList?> getImages(int pageNumber);
}
