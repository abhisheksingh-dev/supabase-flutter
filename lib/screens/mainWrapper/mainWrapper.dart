import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/primaryAppBar.dart';
import '../../provider/homeController.dart';
import '../cloudStore/cloudSave.dart';
import '../home/home.dart';
import '../localSave/localSave.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  List<Widget> screens = [
    const Home(),
    const LocalSave(),
    const CloudSave(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Consumer<HomeController>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(
                kToolbarHeight,
              ),
              child: PrimaryAppBar(),
            ),
            body: screens[value.index],
            bottomNavigationBar: NavigationBar(
              selectedIndex: value.index,
              onDestinationSelected: (i) {
                value.navigateToScreen(i: i);
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(
                    icon: Icon(Icons.save), label: "Local Save"),
                NavigationDestination(
                    icon: Icon(Icons.cloud), label: "Cloud Save"),
              ],
            ),
          );
        },
      ),
    );
  }
}
