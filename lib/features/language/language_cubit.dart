import 'package:bloc/bloc.dart';
import 'package:life/core/helpers/cache_helper.dart';
import 'package:life/features/language/language_state.dart';

import '../../core/api_helper/api_helper.dart';
import '../../injection.dart';


class LanguageCubit extends Cubit<LanguageState>
{
  LanguageCubit() : super(LanguageInitial());



  String langCode='ar';
  Future<void> initLanguage()async
  {
    if(CacheHelper.getData(key: CacheHelperKeys.lang)==null) {
      await CacheHelper.saveData(key: CacheHelperKeys.lang, value: langCode);
      emit(LanguageChanged());
    }
  }

  void changeLanguage(String lang)async
  {
    langCode=lang;
    sl<ApiHelper>().setLangIntoHeader(lang);
    await CacheHelper.saveData(key: CacheHelperKeys.lang, value: lang);
    emit(LanguageChanged());
  }




}