import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class CustomCacheManager {
  static const key = "pdfCache";

  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 200,
      repo: JsonCacheInfoRepository(databaseName: key),
      // fileSystem: IOFileSystem(key),
      fileService: HttpFileService(),
    ),
  );

  Future<void> cacheImage({String? url}) async {
    instance.getSingleFile(url!);
  }

  Future<String?> restoreImage() async {
    await instance.getFileFromCache(key);
    print(instance.getFileFromCache(key));
  }
}
