import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:life/features/delegation/data/models/delegation_model.dart';
import 'package:life/features/delegation/data/repositories/delegation_repo.dart';
import 'package:life/features/delegation/presentation/manager/delegation_state.dart';

import '../../../home/data/models/contract_nationality_model.dart';

class DelegationCubit extends Cubit<DelegationState>
{
  DelegationCubit({required this.delegationRepo}):super(DelegationInitial());

  DelegationRepo delegationRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController nationalIqamaId = TextEditingController();
  TextEditingController numberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int delegationId=0;

  Delegations ? delegations;

  void getDelegations()async
  {
    emit(DelegationLoadingState());
    var result = await delegationRepo.getDelegations();
    result.fold((l) => emit(DelegationFailureState(message: l.message)), (r) {
      delegations=r;
      emit(DelegationSuccessState());
    });
  }


  void fillData(DelegationsData model)
  {

    nameController.text=model.name!;
    nationalIqamaId.text=model.iqama!;
    numberController.text=model.phone!;
    selectedNationalityId=model.nationality!.id!;
    emit(DelegationSuccessState());

  }

  void clearData()
  {
    nameController.clear();
    nationalIqamaId.clear();
    numberController.clear();
    selectedNationalityId=0;
    emit(DelegationSuccessState());

  }


  void deleteDelegation({required int id})async
  {
    emit(DeleteDelegationLoadingState());
    var result = await delegationRepo.deleteDelegation(id: id);
    result.fold((l) => emit(DeleteDelegationFailureState(message: l.message)), (r) {
      delegations?.data.removeWhere((element) => element.id==id);
      emit(DeleteDelegationSuccessState());
    });
  }

  void updateDelegation({required int id,required Map<String,dynamic> data})async
  {
    emit(UpdateDelegationLoadingState());
    var result = await delegationRepo.updateDelegation(id: id, map: data);
    result.fold((l) => emit(UpdateDelegationFailureState(message: l.message)), (r) {
      getDelegations();
      emit(UpdateDelegationSuccessState());
    });
  }


  void postDelegation({required Map<String,dynamic> data})async
  {
    emit(PostDelegationLoadingState());
    var result = await delegationRepo.postDelegation(map: data);
    result.fold((l) => emit(PostDelegationFailureState(message: l.message)), (r) {
      getDelegations();
      emit(PostDelegationSuccessState());
    });
  }

   int selectedNationalityId=0;

  List<ContractNationalityModel> nationalities=[];

  void getNationality()async
  {
    emit(GetNationalityLoadingState());
    var result = await delegationRepo.getContractNationality();
    result.fold((l) => emit(GetNationalityFailureState(message: l.message)), (r) {
      nationalities=r;
      emit(GetNationalitySuccessState());
    });
  }







  @override
  void emit(DelegationState state) {
    if(!isClosed){
      super.emit(state);
    }
  }


  @override
  Future<void> close()async {
    nameController.dispose();
    nationalIqamaId.dispose();
    numberController.dispose();
    super.close();
  }

}