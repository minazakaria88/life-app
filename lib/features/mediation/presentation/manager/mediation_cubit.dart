import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:life/features/mediation/data/models/mediation_model.dart';
import 'package:life/features/mediation/data/repositories/mediation_repo.dart';
import 'mediation_state.dart';

class MediationCubit extends Cubit<MediationState> {
  MediationCubit({required this.mediationRepo}) : super(MediationInitial());
  final MediationRepo mediationRepo;

  MediationModel? mediationModel;

  void getMediation({required int page}) async {
    emit(GetMediationLoadingState());
    var result = await mediationRepo.getMediation(page: page);
    result.fold(
      (l) => emit(GetMediationFailureState(message: l.message)),
      (r) async {
        if (mediationModel == null) {
          mediationModel = r;
        } else {
          mediationModel!.data!.data!.addAll(r.data!.data!);
        }
        emit(GetMediationSuccessState());
      },
    );
  }

  void postMediation({required Map<String, dynamic> data}) async {
    if (selectedExperience == 0 ||
        selectedNationality == 0 ||
        selectedJob == 0 ||
        visaNumberController.text.isEmpty ||
        visaNumberController.text.length < 8) {
      emit(PostMediationFailureState(message: "Please fill all fields"));
      return;
    }
    emit(PostMediationLoadingState());
    var result = await mediationRepo.postMediation(map: data);
    result.fold((f) => emit(PostMediationFailureState(message: f.message)),
        (r) {
      emit(PostMediationSuccessState());
    });
  }


  void getMoreMediation(ScrollController controller) {
    int currentPage = 2;
    controller.addListener(
      () {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          getMediation(page: currentPage);
          currentPage++;
        }
      },
    );
  }

  int selectedExperience = 0;
  int selectedNationality = 0;
  int selectedJob = 0;

  var formKey = GlobalKey<FormState>();

  TextEditingController visaNumberController = TextEditingController();

  @override
  void emit(MediationState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> close() {
    visaNumberController.dispose();
    return super.close();
  }
}
