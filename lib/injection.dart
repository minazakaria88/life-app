import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:life/core/api_helper/api_helper.dart';
import 'package:life/features/complaints/presentation/manager/complaints_cubit.dart';
import 'package:life/features/delegation/presentation/manager/delegation_cubit.dart';
import 'package:life/features/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:life/features/home/data/repositories/home_repo.dart';
import 'package:life/features/home/data/repositories/home_repo_impl.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import 'package:life/features/language/language_cubit.dart';
import 'package:life/features/locations/presentation/manager/location_cubit.dart';
import 'package:life/features/login/data/repositories/login_repo.dart';
import 'package:life/features/login/data/repositories/login_repo_impl.dart';
import 'package:life/features/mediation/presentation/manager/mediation_cubit.dart';
import 'package:life/features/order/data/repositories/order_repo.dart';
import 'package:life/features/order/presentation/manager/order_cubit.dart';
import 'package:life/features/profile/data/repositories/profile_repo.dart';
import 'package:life/features/profile/presentation/manager/profile_cubit.dart';
import 'package:life/features/register/presentation/manager/register_cubit.dart';
import 'package:life/features/search/presentation/manager/search_cubit.dart';
import 'features/complaints/data/repositories/complaint_repo.dart';
import 'features/complaints/data/repositories/complaint_repo_impl.dart';
import 'features/delegation/data/repositories/delegation_repo.dart';
import 'features/delegation/data/repositories/delegation_repo_impl.dart';
import 'features/forget_password/data/repositories/forget_password_repo.dart';
import 'features/forget_password/data/repositories/forget_repo_impl.dart';
import 'features/locations/data/repositories/location_repo.dart';
import 'features/locations/data/repositories/location_repo_impl.dart';
import 'features/login/presentation/manager/login_cubit.dart';
import 'features/mediation/data/repositories/mediation_repo.dart';
import 'features/mediation/data/repositories/mediation_repo_impl.dart';
import 'features/notification/data/repositories/notification_repo.dart';
import 'features/notification/data/repositories/notification_repo_impl.dart';
import 'features/notification/presentation/manager/notification_cubit.dart';
import 'features/order/data/repositories/order_repo_impl.dart';
import 'features/profile/data/repositories/profile_repo_impl.dart';
import 'features/register/data/repositories/register_repo.dart';
import 'features/register/data/repositories/register_repo_impl.dart';
import 'features/search/data/repositories/search_repo.dart';
import 'features/search/data/repositories/search_repo_impl.dart';

final sl = GetIt.instance;

void setupServicesLocator() {
  ApiHelper.getDio();

  sl.registerLazySingleton(
    () => LanguageCubit(),
  );

  sl.registerFactory(
    () => ProfileCubit(profileRepo: sl()),
  );
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(apiHelper: sl()),
  );

  sl.registerLazySingleton(
    () => HomeCubit(profileRepo: sl(), homeRepo: sl()),
  );
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(apiHelper: sl()),
  );

  sl.registerFactory(
    () => ComplaintsCubit(complaintRepo: sl()),
  );
  sl.registerLazySingleton<ComplaintRepo>(
    () => ComplaintRepoImpl(apiHelper: sl()),
  );

  sl.registerFactory(() => MediationCubit(mediationRepo: sl()));
  sl.registerLazySingleton<MediationRepo>(
      () => MediationRepoImpl(apiHelper: sl()));

  sl.registerFactory(() => OrderCubit(orderRepo: sl()));
  sl.registerLazySingleton<OrderRepo>(() => OrderRepoImpl(apiHelper: sl()));

  sl.registerFactory(() => DelegationCubit(delegationRepo: sl()));
  sl.registerLazySingleton<DelegationRepo>(
      () => DelegationRepoImpl(apiHelper: sl()));

  sl.registerFactory(() => LocationCubit(locationRepo: sl()));
  sl.registerLazySingleton<LocationRepo>(
      () => LocationRepoImpl(apiHelper: sl()));

  sl.registerFactory(() => NotificationCubit(notificationRepo: sl()));
  sl.registerLazySingleton<NotificationRepo>(
      () => NotificationRepoImpl(apiHelper: sl()));

  sl.registerFactory(
    () => RegisterCubit(
      registerRepo: sl(),
    ),
  );
  sl.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImpl(apiHelper: sl()),
  );

  sl.registerFactory(
    () => ForgetPasswordCubit(forgetPasswordRepo: sl()),
  );
  sl.registerLazySingleton<ForgetPasswordRepo>(
    () => ForgetPasswordRepoImpl(apiHelper: sl()),
  );

  sl.registerFactory(
    () => SearchBloc(searchRepo: sl()),
  );
  sl.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(apiHelper: sl()),
  );

  sl.registerFactory(
    () => LoginCubit(loginRepo: sl()),
  );
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiHelper: sl()),
  );

  sl.registerLazySingleton(
    () => ApiHelper(),
  );

  sl.registerLazySingleton(
    () => Dio(),
  );
}
