import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:life/features/complaints/data/models/complaint_model.dart';
import 'package:life/features/complaints/data/repositories/complaint_repo.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import 'package:life/injection.dart';
import '../../data/models/complaint_post_model.dart';
import 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit({required this.complaintRepo}) : super(ComplaintsInitial());
  final ComplaintRepo complaintRepo;

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  int priority = 0;
  var formKey = GlobalKey<FormState>();

  Complaints? complaints;

  void getComplaint() async {

    emit(ComplaintsLoading());
    var result = await complaintRepo.getComplaints();
    result.fold(
      (l) => emit(ComplaintsError(message: l.message)),
      (r) {
        complaints = r;
        emit(ComplaintsSuccess());
      },
    );

  }

  XFile? image;
  void pickImage({required ImageSource source}) async {
    try {
      image = await ImagePicker().pickImage(source: source);
      emit(PickFileSuccess());
    } catch (e) {
      emit(PickFileError(message: e.toString()));
    }
  }


  void clearImage()
  {
    image=null;
    emit(PickFileSuccess());
  }

  ComplaintPostModel get model => ComplaintPostModel(
        title: titleController.text,
        description: noteController.text,
        type: 1,
        contractId:sl<HomeCubit>().activeContracts.first.id!,
        file: image,
        priority: priority,
      );

  void addComplaint() async {
    emit(AddComplaintsLoading());
    var result = await complaintRepo.addComplaints(model: model);
    result.fold((l) => emit(AddComplaintsError(message: l.message)), (r) {
      getComplaint();
      clearData();
      emit(AddComplaintsSuccess());
    });
  }

  void clearData() {
    image = null;
    titleController.clear();
    noteController.clear();
    priority = 0;
    emit(ComplaintsClearSuccess());
  }

  @override
  void emit(ComplaintsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }


  @override
  Future<void> close() async {
    titleController.clear();
    noteController.clear();
    super.close();
  }
}
