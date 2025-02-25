
import '../helpers/cache_helper.dart';

String getLanguage() => CacheHelper.getData(key: CacheHelperKeys.lang);