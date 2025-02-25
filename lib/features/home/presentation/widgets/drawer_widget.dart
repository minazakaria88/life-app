import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import '../../../../core/functions/my_dialog.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection.dart';
import '../manager/home_state.dart';
import 'package:life/injection.dart' as di;

import 'drawer_item_widget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                SvgPicture.asset(Assets.drawerUser),
                10.height,
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = context.read<HomeCubit>();
                    return Text(
                      '${cubit.profileModel == null ? '' : cubit.profileModel!.data!.name!} ',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          DrawerItemWidget(
            onTap: () {
              context.pushNamed(Routes.profile);
            },
            image: Assets.drawerPerson,
            title: S.of(context).profile,
          ),
          DrawerItemWidget(
            onTap: () {
              context.pushNamed(Routes.delegation);
            },
            image: Assets.drawerDelegation,
            title: S.of(context).delegation,
          ),
          DrawerItemWidget(
            onTap: () {
              context.pushNamed(Routes.location);
            },
            image: Assets.drawerLocation,
            title: S.of(context).location,
          ),
          DrawerItemWidget(
            onTap: () {
              context.pushNamed(Routes.language);
            },
            image: Assets.drawerLanguage,
            title: S.of(context).language,
          ),
          DrawerItemWidget(
            onTap: () {
              context.pushNamed(Routes.complaints);
            },
            image: Assets.drawerComplain,
            title: S.of(context).tickets,
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.chat_bubble_2,
              color: Colors.white,
            ),
            title: Text(
              S.of(context).technical_support,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              context.pushNamed(
                Routes.technicalSupport,
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(
          //     CupertinoIcons.question_diamond_fill,
          //     color: Colors.white,
          //   ),
          //   title: Text(
          //     S.of(context).faq,
          //     style: const TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   onTap: () {
          //     context.pushNamed(Routes.faqScreen,);
          //   },
          // ),
          ListTile(
            leading: Image.asset(
              Assets.drawerWhatsapp,
              color: Colors.white,
              height: 20,
              width: 20,
            ),
            title: Text(
              S.of(context).whats_app,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              di.sl<HomeCubit>().whatsapp();
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.phone_arrow_up_right,
              color: Colors.white,
            ),
            title: Text(
              S.of(context).contact_us,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              di.sl<HomeCubit>().makePhoneCall();
            },
          ),
          ListTile(
            onTap: () {
              context.pushNamed(Routes.aboutUs);
            },
            leading: SvgPicture.asset(
              Assets.barContractsBlack,
              height: 20.0,
              width: 20.0,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              S.of(context).about_life,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.pushNamed(Routes.search);
            },
            leading: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: Text(
              S.of(context).search,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showMyDialog(
                  context: context,
                  message: S.of(context).are_you_sure_you_want_to_logout,
                  confirm: S.of(context).confirm,
                  confirmAction: () async {
                    await CacheHelper.clearData();
                    sl.resetLazySingleton<HomeCubit>();
                    if (context.mounted) {
                      context.pushNamedAndRemoveUntil(
                          Routes.login, (route) => false);
                    }
                  });
            },
            leading: SvgPicture.asset(
              Assets.drawerLogout,
            ),
            title: Text(
              S.of(context).logout,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          20.height,
        ],
      ),
    );
  }
}
