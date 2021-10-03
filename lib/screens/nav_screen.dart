// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_facebooktask/data/data.dart';
import 'package:flutter_facebooktask/widgets/custom_app_bar.dart';
import 'package:flutter_facebooktask/widgets/custom_tab_bar.dart';
import 'package:flutter_facebooktask/widgets/responsive.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'home_screen.dart';

// ignore: use_key_in_widget_constructors
class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // ignore: duplicate_ignore
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                   onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: Colors.white,
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}