import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import 'package:life/features/profile/data/models/profile_model.dart';
import 'package:life/features/profile/data/repositories/profile_repo.dart';
import 'package:life/features/profile/presentation/manager/profile_state.dart';
import 'package:life/injection.dart' as di;

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitState());
  final ProfileRepo profileRepo;
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalIqamaIdController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> getUserData() async {
    emit(ProfileLoadingState());
    var result = await profileRepo.getProfile();
    result.fold((l) => emit(ProfileFailureState(message: l.message)), (r) {
      setData(r);
      di.sl<HomeCubit>().setUserName(r.data!.name!);
    });
  }

  String username = "";
  void setData(ProfileModel? model) {
    if (model == null) {
      return;
    }
    username = model.data!.name ?? '';
    nameController.text = model.data!.name!;
    nationalIqamaIdController.text = model.data!.iqama!;
    numberController.text = model.data!.phone!;
    emit(ProfileSuccessState());
  }

  void updateProfile({required Map<String, dynamic> data}) async {
    if (username == nameController.text) {
      return;
    }
    emit(ProfileLoadingState());
    var result = await profileRepo.updateProfile(data: data);
    result.fold((l) => emit(ProfileFailureState(message: l.message)),
        (r) async {
      await getUserData();
      di.sl<HomeCubit>().getUserData();
      emit(UpdateUserSuccessState());
    });
  }

  @override
  void emit(ProfileState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() async {
    nameController.dispose();
    nationalIqamaIdController.dispose();
    numberController.dispose();
    super.close();
  }
}
