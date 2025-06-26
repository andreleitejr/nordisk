import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nordisk/tabs/form_tab.dart';
import 'package:nordisk/tabs/home_tab.dart';
import 'package:nordisk/tabs/map_tab.dart';
import 'package:nordisk/tabs/profile_tab.dart';
import 'package:nordisk/theme/theme_colors.dart';
import 'package:nordisk/theme/theme_icons.dart';
import 'package:nordisk/widgets/health_data_notifier.dart';
import 'package:nordisk/widgets/icon_widget.dart';
import 'package:provider/provider.dart';

// 4. Tela Principal (HomeScreen)
class MainScreen extends StatefulWidget {
  final User user;
  final int initialTabIndex;

  const MainScreen({super.key, required this.user, this.initialTabIndex = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentStep = 1;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    currentTabIndex = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<HealthDataNotifier>(
      builder: (context, notifier, child) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              body: IndexedStack(
                index: currentTabIndex,
                children: [
                  HomeTab(user: widget.user),
                  FormTab(user: widget.user),
                  MapTab(),
                  ProfileTab(),
                ],
              ),
              bottomNavigationBar: BottomAppBar(
                color: Colors.white,
                shape: const CircularNotchedRectangle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => setState(() => currentTabIndex = 0),
                      child: IconWidget(
                        icon: ThemeIcons.home,
                        color: currentTabIndex == 0
                            ? ThemeColors.primary
                            : Colors.grey.shade600,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      icon: IconWidget(
                        icon: ThemeIcons.bookOpen,
                        color: currentTabIndex == 1
                            ? ThemeColors.primary
                            : Colors.grey.shade600,
                        size: 24,
                      ),
                      onPressed: () => setState(() => currentTabIndex = 1),
                    ),
                    IconButton(
                      icon: IconWidget(
                        icon: ThemeIcons.mapPin,
                        color: currentTabIndex == 2
                            ? ThemeColors.primary
                            : Colors.grey.shade600,
                        size: 24,
                      ),
                      onPressed: () => setState(() => currentTabIndex = 2),
                    ),
                    IconButton(
                      icon: IconWidget(
                        icon: ThemeIcons.shoppingCart,
                        color: currentTabIndex == 3
                            ? ThemeColors.primary
                            : Colors.grey.shade600,
                        size: 24,
                      ),
                      onPressed: () => setState(() => currentTabIndex = 3),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
