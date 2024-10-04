import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/setting/setting_initial_params.dart';
import 'package:flutter_template/features/setting/setting_page.dart';
import 'package:flutter_template/injection_container.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import '/core/status_switcher.dart';
import '/domain/entities/home/mock_home_model.dart';

class HomePage extends StatefulWidget {
  final HomeCubit cubit;

  const HomePage({
    super.key,
    required this.cubit,
  });

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  int _currentIndex = 0; // Track the current tab index

  // List of pages associated with the tabs
  final List<Widget> _pages = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("Search Screen")),
    // const Center(child: Text("Search Screen")),
    SettingPage(cubit: getIt(param1: const SettingInitialParams()))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the hexagon button
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        // Set color to match your UI
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Display the selected tab's page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Current tab index
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the tab index when clicked
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
