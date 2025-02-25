import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../manager/order_state.dart';

void checkState(context, OrderState state) {
  if (state is GetLocationsFailureState) {
    showSnackBar(
      message: state.message,
      context: context,
      title: state.message,
      contentType: ContentType.failure,
    );
  }
  if (state is GetCitiesFailureState) {
    showSnackBar(
      message: state.message,
      context: context,
      title: state.message,
      contentType: ContentType.failure,
    );
  }
  if (state is GetBranchesFailureState) {
    showSnackBar(
      message: state.message,
      context: context,
      title: state.message,
      contentType: ContentType.failure,
    );
  }
  if (state is GetPackagesFailureState) {
    showSnackBar(
      message: state.message,
      context: context,
      title: state.message,
      contentType: ContentType.failure,
    );
  }
}