import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/routes/routes.dart';
import 'package:life/features/complaints/presentation/manager/complaints_cubit.dart';
import 'package:life/features/complaints/presentation/screens/complaints_screen.dart';
import 'package:life/features/locations/presentation/screens/location_screen.dart';
import 'package:life/features/login/presentation/manager/login_cubit.dart';
import 'package:life/features/login/presentation/screens/login_screen.dart';
import 'package:life/features/mediation/presentation/screens/add_mediation_screen.dart';
import 'package:life/features/notification/presentation/manager/notification_cubit.dart';
import 'package:life/features/notification/presentation/screens/notification_screen.dart';
import 'package:life/features/nurse_data/data/models/contract_model.dart';
import 'package:life/features/nurse_data/data/models/nurse_data_model.dart';
import 'package:life/features/nurse_data/presentation/screens/cv_view.dart';
import 'package:life/features/profile/presentation/manager/profile_cubit.dart';
import 'package:life/features/profile/presentation/screens/profile_screen.dart';
import 'package:life/features/register/presentation/manager/register_cubit.dart';
import 'package:life/features/register/presentation/screens/register_screen.dart';
import 'package:life/features/search/presentation/manager/search_cubit.dart';
import 'package:life/injection.dart' as di;
import '../../constant.dart';
import '../../features/complaints/presentation/screens/add_complaints_screen.dart';
import '../../features/delegation/presentation/manager/delegation_cubit.dart';
import '../../features/delegation/presentation/screens/add_delegation_screen.dart';
import '../../features/delegation/presentation/screens/delegation_screen.dart';
import '../../features/forget_password/presentation/manager/forget_password_cubit.dart';
import '../../features/forget_password/presentation/screens/forget_password_screen.dart';
import '../../features/forget_password/presentation/screens/reset_password_screen.dart';
import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/home/presentation/screens/about_us_screen.dart';
import '../../features/faq/presentation/screens/faq.dart';
import '../../features/home/presentation/screens/main_screen.dart';
import '../../features/home/presentation/screens/nurse_filter_screen.dart';
import '../../features/home/presentation/screens/contract_details_screen.dart';
import '../../features/home/presentation/screens/technical_support_screen.dart';
import '../../features/language/change_language_screen.dart';
import '../../features/locations/data/models/location_model.dart';
import '../../features/locations/presentation/manager/location_cubit.dart';
import '../../features/locations/presentation/screens/add_locations_screen.dart';
import '../../features/mediation/presentation/manager/mediation_cubit.dart';
import '../../features/nurse_data/presentation/screens/nurse_view.dart';
import '../../features/on_boarding/presentation/screens/on_boarding_screen.dart';
import '../../features/order/presentation/manager/order_cubit.dart';
import '../../features/order/presentation/screens/order_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../widgets/no_internet.dart';
import '../widgets/otp_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.register),
          builder: (context) => BlocProvider(
            create: (context) => di.sl<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.forgetPassword),
          builder: (context) => BlocProvider(
            create: (context) => di.sl<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.resetPassword:
         final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.resetPassword),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<ForgetPasswordCubit>(),
              child:  ResetPasswordScreen(
                  code: arguments['code'] ,
                  phone: arguments['phone'],
                  )),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.mainScreen),
          builder: (context) => BlocProvider(
            create: (context) => di.sl<HomeCubit>()
              ..getNursesNationality()
              ..getContracts()
              ..getUserData(),
            child: const MainScreen(),
          ),
        );
      case Routes.nurseFilter:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.nurseFilter),
          builder: (context) => BlocProvider.value(
            value: di.sl<HomeCubit>(),
            child: const NurseFilterScreen(),
          ),
        );
      case Routes.language:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.language),
          builder: (context) => const ChangeLanguageScreen(),
        );
      case Routes.profile:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.profile),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<ProfileCubit>(),
              child: const ProfileScreen()),
        );
      case Routes.nurseView:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.nurseView),
          builder: (context) => NurseView(
            id: arguments['index'] as int,
            model: arguments['nurse'] as NurseDataModel,
          ),
        );
      case Routes.contractDetailsScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.contractDetailsScreen),
          builder: (context) => ContractDetailsScreen(
            model: arguments as ContractsData,
          ),
        );
      case Routes.complaints:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.complaints),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<ComplaintsCubit>()..getComplaint(),
              child: const ComplaintsScreen()),
        );
      case Routes.addComplaint:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.addComplaint),
          builder: (context) => BlocProvider(
            create: (context) => di.sl<ComplaintsCubit>(),
            child: AddComplaintsScreen(
              cubit: arguments as ComplaintsCubit,
            ),
          ),
        );
      case Routes.aboutUs:
        return  MaterialPageRoute(
                settings: const RouteSettings(name: Routes.aboutUs),
                builder: (context) => const AboutUsScreen(),
              );

      case Routes.orderScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.orderScreen),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<OrderCubit>(),
              child: OrderScreen(
                nurseDataModel: arguments as NurseDataModel,
              )),
        );
      case Routes.cvScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.cvScreen),
          builder: (context) => CvView(
            resumeUrl: arguments as String,
          ),
        );
      case Routes.noInternet:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.noInternet),
          builder: (context) => const NoInternet(),
        );
      case Routes.delegation:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.delegation),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<DelegationCubit>()..getDelegations(),
              child: const DelegationScreen()),
        );
      case Routes.addDelegation:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.addDelegation),
          builder: (context) => AddDelegationScreen(
            action: arguments['action'] as DelegationAction,
            cubit: arguments['cubit'] as DelegationCubit,
          ),
        );
      case Routes.location:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.location),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<LocationCubit>()..getSavedLocations(),
              child: const LocationScreen()),
        );
      case Routes.addLocations:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.addLocations),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<LocationCubit>(),
              child: AddLocationsScreen(
                action: arguments['action'] as AddLocationAction,
                model: arguments['model'] as LocationsData?,
              )),
        );
      case Routes.addMediation:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<MediationCubit>(),
            child: const AddMediationScreen(),
          ),
        );
      case Routes.notifications:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.notifications),
          builder: (context) => BlocProvider(
            create: (context) => di.sl<NotificationCubit>(),
            child: const NotificationScreen(),
          ),
        );
      case Routes.otpScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.otpScreen),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<LoginCubit>(),
              child: OtpScreen(
                phoneNumber: arguments['phoneNumber'],
                otpAction: arguments['otpAction'],
              )),
        );
      case Routes.technicalSupport:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.technicalSupport),
          builder: (context) => const TechnicalSupportScreen(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.onboarding),
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.search:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.search),
          builder: (context) => BlocProvider(
              create: (context) => di.sl<SearchBloc>(),
              child: const SearchScreen()),
        );
      case Routes.faqScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.faqScreen),
          builder: (context) => const FaqScreen(),
        );

      default:
        return null;
    }
  }
}
