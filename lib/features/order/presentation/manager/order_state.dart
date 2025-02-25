abstract class OrderState{}

class OrderInitial extends OrderState{}

class GetCitiesSuccessState extends OrderState{}

class GetCitiesFailureState extends OrderState{
  final String message;
  GetCitiesFailureState({required this.message});
}
class GetCitiesLoadingState extends OrderState{}


class GetBranchesLoadingState extends OrderState{}

class GetBranchesFailureState extends OrderState{
  final String message;
  GetBranchesFailureState({required this.message});
}

class GetBranchesSuccessState extends OrderState{}


class GetLocationsLoadingState extends OrderState{}

class GetLocationsFailureState extends OrderState{
  final String message;
  GetLocationsFailureState({required this.message});
}

class GetLocationsSuccessState extends OrderState{}

class ChangeStepState extends OrderState{}

class GetAllDataLoadingState extends OrderState{}

class GetAllDataFailureState extends OrderState{
  final String message;
  GetAllDataFailureState({required this.message});
}

class GetPackagesLoadingState extends OrderState{}

class GetPackagesFailureState extends OrderState{
  final String message;
  GetPackagesFailureState({required this.message});
}

class GetPackagesSuccessState extends OrderState{}

class GetAllDataSuccessState extends OrderState{}

class MakeOrderLoadingState extends OrderState{}

class MakeOrderFailureState extends OrderState{
  final String message;
  MakeOrderFailureState({required this.message});
}

class MakeOrderSuccessState extends OrderState{}