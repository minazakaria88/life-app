import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/features/home/data/models/contract_nationality_model.dart';
import 'package:life/features/home/data/repositories/home_repo.dart';
import 'package:life/features/nurse_data/data/models/contract_model.dart';
import 'package:life/features/nurse_data/data/models/nurse_data_model.dart';
import 'package:life/features/profile/data/models/profile_model.dart';
import 'package:life/features/profile/data/repositories/profile_repo.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../injection.dart';
import '../../../mediation/presentation/manager/mediation_cubit.dart';
import '../../../mediation/presentation/screens/medition_screen.dart';
import '../screens/bottom_bar_taps/home_screen.dart';
import '../screens/bottom_bar_taps/moquim_screen.dart';
import '../screens/bottom_bar_taps/new_order_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.profileRepo, required this.homeRepo})
      : super(HomeInitial());

  final ProfileRepo profileRepo;
  final HomeRepo homeRepo;


  TextEditingController technicalSupportController = TextEditingController();

  List<String> technicalSupportList = [];

  void sendMessage({required String message})  {
    technicalSupportList.add(message);
    technicalSupportController.clear();
    emit(SendMessageState());
  }

  ProfileModel? profileModel;
  void getUserData() async {
    emit(GetUserDataLoadingState());
    var result = await profileRepo.getProfile();
    result.fold((l) => emit(GetUserDataFailureState()), (r) {
      profileModel = r;
      emit(GetUserDataSuccessState());
    });
  }

  void setUserName(String name) {
    profileModel!.data!.name = name;
    emit(GetUserDataSuccessState());
  }

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const NewOrderScreen(),
    const MoquimScreen(),
    BlocProvider(
        create: (context) =>sl<MediationCubit>(),
        child: const MediationScreen()),
  ];

  List<ContractNationalityModel> contractNationalityList = [];

  Future<void> getNursesNationality() async {
    emit(GetNursesNationalityLoadingState());
    var result = await homeRepo.getContractNationality();
    result.fold(
        (l) => emit(GetNursesNationalityFailureState(message: l.message)),
        (r) {
      contractNationalityList = r;
      emit(GetNursesNationalitySuccessState());
    });
  }

  // filter dialog
  int contractNationality = 0;
  int contractAge = 0;
  int contractMaritalStatus = 0;

  void clearFilter() {
    contractNationality = 0;
    contractAge = 0;
    contractMaritalStatus = 0;
    emit(ClearFilterState());
  }

  Map<String, dynamic> contractQueryParams(int page) {
    Map<String, dynamic> query = {};
    query['page'] = page;
    if (contractNationality != 0) {
      query['nationality_id'] = contractNationality;
    }
    if (contractAge != 0) {
      query['age'] = contractAge;
    }
    if (contractMaritalStatus != 0) {
      query['marital_status'] = contractMaritalStatus;
    }
    return query;
  }

  NurseModel? filterNurses;


  void getFilterNurses({required int page}) async {
    emit(GetFilterNursesLoadingState());
    var result =
        await homeRepo.getFilterNurseData(query: contractQueryParams(page));
    result.fold((l) => emit(GetFilterNursesFailureState(message: l.message)),
        (r) {
      if (filterNurses == null) {
        filterNurses = r;
      } else {
         if(page!=1) {
           filterNurses!.data!.addAll(r.data!);
         }
      }
      emit(GetFilterNursesSuccessState());
    });
  }


  ScrollController nurseFilterController = ScrollController();
  VoidCallback? _scrollListener;



  //same as the below function
  void getMoreFilterNurses() async {
    int count = 2;
    if (_scrollListener != null) {
      nurseFilterController.removeListener(_scrollListener!);
    }
    _scrollListener = () async {
      if (nurseFilterController.position.pixels ==
          nurseFilterController.position.maxScrollExtent) {
         getFilterNurses(page: count++);
      }
    };
    nurseFilterController.addListener(_scrollListener!);
  }

  void getMoreNurses(ScrollController nurseFilterController) async
  {
    int count=2;
    nurseFilterController.addListener(() {
      if (nurseFilterController.position.pixels ==
          nurseFilterController.position.maxScrollExtent) {
        getFilterNurses(page: count++);
      }
    });
  }

  Future<void> whatsapp() async {
    var contact = '+201064687742';
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
    String webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=hi';
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }

  Future<void> makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '+201064687742',
    );
    await launchUrl(launchUri);
  }

  List<ContractsData> allContracts = [];
  List<ContractsData> activeContracts = [];
  List<ContractsData> expiredContracts = [];
  List<ContractsData> pendingContracts = [];

  bool isLoading = false;

  void getContracts() async {
    Map<String, List<ContractsData>> contractsMap = {
      'active': activeContracts,
      'expired': expiredContracts,
      'pending': pendingContracts
    };
    isLoading = true;
    emit(GetContractsLoadingState());
    var result = await homeRepo.getContracts();
    result.fold((l) {
      isLoading = false;
      emit(GetContractsFailureState(message: l.message));
    }, (r) {
      allContracts = r.data!;
      for (var element in allContracts) {
        contractsMap[element.status]?.add(element);
      }
      isLoading = false;
      emit(GetContractsSuccessState());
    });
  }

  int progressValue = 0;

  void setProgressValue(int value) {
    progressValue = value;
    emit(SetProgressValueState());
  }

  // WebViewController createController() {
  //   WebViewController controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setNavigationDelegate(
  //       NavigationDelegate(
  //         onProgress: (int progress) {
  //           setProgressValue(progress);
  //         },
  //         onPageStarted: (String url) {},
  //         onPageFinished: (String url) {},
  //         onHttpError: (HttpResponseError error) {},
  //         onWebResourceError: (WebResourceError error) {},
  //         onNavigationRequest: (NavigationRequest request) {
  //           if (request.url.startsWith('https://www.youtube.com/')) {
  //             return NavigationDecision.prevent;
  //           }
  //           return NavigationDecision.navigate;
  //         },
  //       ),
  //     )
  //     ..loadRequest(Uri.parse('https://flutter.dev'));
  //   return controller;
  // }

  @override
  void emit(HomeState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() async {
    technicalSupportController.dispose();
    super.close();
  }


}
