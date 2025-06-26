import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nordisk/tabs/form_tab.dart';
import 'package:nordisk/tabs/home_tab.dart';
import 'package:nordisk/tabs/map_tab.dart';
import 'package:nordisk/tabs/profile_tab.dart';
import 'package:nordisk/widgets/health_data_notifier.dart';
import 'package:provider/provider.dart';

// 4. Tela Principal (HomeScreen)
class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int currentStep = 1;
    int currentTabIndex = 0;

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
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: currentTabIndex == 0
                            ? Colors.indigo
                            : Colors.grey.shade600,
                      ),
                      onPressed: () => setState(() => currentTabIndex = 0),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.health_and_safety,
                        color: currentTabIndex == 1
                            ? Colors.indigo
                            : Colors.grey.shade600,
                      ),
                      onPressed: () => setState(() => currentTabIndex = 1),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.map_outlined,
                        color: currentTabIndex == 2
                            ? Colors.indigo
                            : Colors.grey.shade600,
                      ),
                      onPressed: () => setState(() => currentTabIndex = 2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        color: currentTabIndex == 3
                            ? Colors.indigo
                            : Colors.grey.shade600,
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
