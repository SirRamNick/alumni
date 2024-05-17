import 'package:alumni_app/pages/profile.dart';
import 'package:alumni_app/pages/settings.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  final String docID;
  const NavigationPage({super.key, required this.docID});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_outlined),
    activeIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
];


class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  late final String documentID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentID = widget.docID;
  }

  //Scrolling through pages


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;
    final bool isLargeScreen = width > 800;

    final pages = [
      Profile(docID: documentID),
      Settings(),
    ];


    return Scaffold(
      bottomNavigationBar: isSmallScreen
          ? BottomNavigationBar(
              items: _navBarItems,
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            )
          : null,
      body: Row(
        children: <Widget>[
          if (!isSmallScreen)
            NavigationRail(
              //leading start
              leading: Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.abc,
                        size: 60,
                      ),
                      Column(
                        children: [
                          const Row(
                            children: [
                              const Text(
                                'Our Lady of Perpetual Succor College',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              const Text(
                                'Alumni Tracking System',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //leading end
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              extended: isLargeScreen,
              destinations: _navBarItems
                  .map((item) => NavigationRailDestination(
                      icon: item.icon,
                      selectedIcon: item.activeIcon,
                      label: Text(
                        item.label!,
                      )))
                  .toList(),
            ),
          const VerticalDivider(thickness: 1, width: 1),

          // Main Content of the Navigation Bar/Rail (📌📌📌📌📌)
          Expanded(child: pages[_selectedIndex])
        ],
      ),
    );
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

