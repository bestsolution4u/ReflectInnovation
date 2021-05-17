import 'package:flutter/material.dart';
import 'package:reflect_innovation/screen/main/dashboard/dashboard_screen.dart';
import 'package:reflect_innovation/screen/main/knowledge/knowledge_screen.dart';
import 'package:reflect_innovation/screen/main/memory/memory_screen.dart';
import 'package:reflect_innovation/screen/main/tracking/tracking_screen.dart';
import 'package:reflect_innovation/widget/tabbar/main_tabbar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {

  final int tabLength = 4;
  TabController tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: tabLength,
      vsync: this,
    )..addListener(handleTabController);
  }

  void handleTabController() {
    currentTabIndex = tabController.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DefaultTabController(
              length: tabLength,
              child: Scaffold(
                body: AppMainTabBarView(
                  controller: tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    DashboardScreen(),
                    TrackingScreen(),
                    KnowledgeScreen(),
                    MemoryScreen()
                  ],
                ),
                bottomNavigationBar: Container(
                  height: 60,
                  child: AppMainTabBar(
                      indicatorColor: Colors.white,
                      controller: tabController,
                      indicatorWeight: 0,
                      tabs: [
                        ]),
                ),
              )
          )
        ],
      ),
    );
  }
}
