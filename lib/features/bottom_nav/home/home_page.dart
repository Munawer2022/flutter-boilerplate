import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_bar.dart';
import 'package:flutter_template/data/datasources/user/user_data_sources.dart';
import 'package:flutter_template/features/no_internet_page.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting/setting_initial_params.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting/setting_page.dart';
import 'package:flutter_template/features/auth/splash/splash_initial_params.dart';
import 'package:flutter_template/injection_container.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import '../../../config/status_switcher.dart';

class HomePage extends StatefulWidget {
  final HomeCubit cubit;
  final UserDataSources dataSources;

  const HomePage({
    super.key,
    required this.cubit,
    required this.dataSources,
  });

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  HomeCubit get cubit => widget.cubit;
  UserDataSources get dataSources => widget.dataSources;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  int _currentIndex = 0; // Track the current tab index

  // List of pages associated with the tabs

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      CarouselExample(dataSources: dataSources),
      const NoInternetScreen(),
      const SizedBox(),
      const Center(child: Text("Search Chat")),
      SettingPage(
          cubit: getIt(param1: const SettingInitialParams()),
          dataSources: getIt(),
          splashCubit: getIt(param1: const SplashInitialParams()),
          loginDataSources: getIt())
    ];
    return Scaffold(
      body: pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the hexagon button
        },
        // backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          // color: Colors.white,
        ),
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
        // selectedIconTheme: const IconThemeData(color: Colors.black),
        // unselectedIconTheme: const IconThemeData(color: Colors.black),
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}

class CarouselExample extends StatefulWidget {
  final UserDataSources dataSources;
  const CarouselExample({super.key, required this.dataSources});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  // Define a list of image URLs
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/28098286/pexels-photo-28098286/free-photo-of-playa-puerto-angelito.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/16097867/pexels-photo-16097867/free-photo-of-scenic-view-of-the-seacoast-at-dusk.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/20058472/pexels-photo-20058472/free-photo-of-sea-coast-on-island.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/28098286/pexels-photo-28098286/free-photo-of-playa-puerto-angelito.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/16097867/pexels-photo-16097867/free-photo-of-scenic-view-of-the-seacoast-at-dusk.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/20058472/pexels-photo-20058472/free-photo-of-sea-coast-on-island.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/28098286/pexels-photo-28098286/free-photo-of-playa-puerto-angelito.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/16097867/pexels-photo-16097867/free-photo-of-scenic-view-of-the-seacoast-at-dusk.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/20058472/pexels-photo-20058472/free-photo-of-sea-coast-on-island.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',

    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    final info = widget.dataSources.state;

    return SafeArea(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    // do something
                  },
                  icon: const Badge(
                    isLabelVisible: true,
                    label: Text("5"),
                    // backgroundColor: Colors.red,
                    child: Icon(
                      Icons.notifications,
                      size: 25,
                    ),
                  )),
            ],
            title: ListTile(
              leading: const CircleAvatar(),
              title: Text(
                'Hi , ${info.data.name}!',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Discover Our Services !'),
            ),
          ),
          10.verticalSpace,
          Container(
            height: 158.h,
            margin: EdgeInsets.symmetric(horizontal: 28.w),
            width: double.infinity.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: Colors.grey.shade300,
            ),
          ),
          10.verticalSpace,
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: CarouselView(
              itemExtent: 330,
              shrinkExtent: 200,
              children: List<Widget>.generate(imageUrls.length, (int index) {
                return UncontainedLayoutCard(
                    index: index, imageUrl: imageUrls[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.imageUrl,
  });

  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // Add rounded corners
      child: ColoredBox(
        color:
            Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity, // Make image cover the entire card
        ),
      ),
    );
  }
}
