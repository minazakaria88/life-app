import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import 'package:life/generated/l10n.dart';
import '../../../../core/routes/routes.dart';
import '../manager/home_state.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/drawer_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  bool isPushed = false;

  StreamSubscription<List<ConnectivityResult>>? subscription;

  @override
  void initState() {
    super.initState();
    checkInternetStream();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    subscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      subscription
          ?.cancel();
    }
    if (state == AppLifecycleState.resumed) {
      checkInternetStream();
    }
  }

  void checkInternetStream() {
    subscription?.cancel();
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      if (context.mounted) {
        handleConnectivityChange(event);
      }
    });
  }

  void handleConnectivityChange(List<ConnectivityResult> event) {
    if (event.contains(ConnectivityResult.none)) {
      if (!isPushed) {
        isPushed = true;
        if (context.mounted) {
          context.pushNamed(Routes.noInternet);
        }
      }
    } else {
      if (isPushed) {
        isPushed = false;
        if (context.mounted) {
          context.pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.notifications);
            },
            icon: const Icon(Icons.notifications,color: Colors.white,),
          ),
        ],
        title: Text(S.of(context).appTitle),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: const MyBottomBar(),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return cubit.screens[cubit.currentIndex];
      }),
    );
  }
}
