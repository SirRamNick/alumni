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
    icon: Icon(
      Icons.person_outline_rounded,
      color: const Color.fromRGBO(255, 210, 49, 1),
    ),
    activeIcon: Icon(
      Icons.person_rounded,
      color: const Color.fromRGBO(255, 210, 49, 1),
    ),
    label: 'Profile',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.settings_outlined,
      color: const Color.fromRGBO(255, 210, 49, 1),
    ),
    activeIcon: Icon(
      Icons.settings,
      color: const Color.fromRGBO(255, 210, 49, 1),
    ),
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
              backgroundColor: Color.fromRGBO(11, 10, 95, 1),
              unselectedItemColor: const Color.fromRGBO(255, 210, 49, 1),
              selectedItemColor: const Color.fromRGBO(255, 210, 49, 1),
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
              backgroundColor: Color.fromRGBO(11, 10, 95, 1),
              //leading start
              leading: Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset('images/olopsc_logo.png', scale: 2.1),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Our Lady of Perpetual Succor College',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 210, 49, 1)),
                      ),
                      const Text(
                        'Alumni Tracking System',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 210, 49, 1)),
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
                        style: TextStyle(
                            color: const Color.fromRGBO(255, 210, 49, 1)),
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
