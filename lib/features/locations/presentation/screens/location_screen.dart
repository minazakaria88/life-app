import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life/constant.dart';
import 'package:life/core/functions/show_snack_bar.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/no_result_widget.dart';
import 'package:life/core/widgets/shimmer_listview.dart';
import 'package:life/features/locations/presentation/manager/location_cubit.dart';
import '../../../../core/routes/routes.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../manager/location_state.dart';
import '../widgets/locations_listview.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  context.pushNamed(Routes.addLocations, arguments: {
                    'action': AddLocationAction.locationScreen,
                    'model': null
                  });
                },
                icon: SvgPicture.asset(
                  Assets.imagesPlus,
                  height: 20,
                  width: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
          ),
        ],
        title: Text(S.of(context).location),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state is DeleteLocationSuccessState) {
              showSnackBar(
                message: S.of(context).delete_location,
                context: context,
                title: S.of(context).delete_location,
                contentType: ContentType.success,
              );
            }
            if (state is DeleteLocationFailureState) {
              showSnackBar(
                message: S.of(context).delete_location_fail,
                context: context,
                title: S.of(context).delete_location_fail,
                contentType: ContentType.failure,
              );
            }
          },
          builder: (context, state) {
            var cubit = context.read<LocationCubit>();
            return state is GetLocationsLoadingState ||
                    state is DeleteLocationLoadingState
                ? const ShimmerListview()
                : cubit.locations.isEmpty
                    ? const NoResultWidget()
                    : LocationsListview(cubit: cubit);
          },
        ),
      ),
    );
  }
}


