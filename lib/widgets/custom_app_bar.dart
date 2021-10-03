// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_facebooktask/config/palette.dart';
import 'package:flutter_facebooktask/models/user_model.dart';
import 'package:flutter_facebooktask/widgets/circle_button.dart';
import 'package:flutter_facebooktask/widgets/user_card.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'custom_tab_bar.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  // ignore: use_key_in_widget_constructors
  const CustomAppBar({

    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  // ignore: avoid_print
                  onPressed: () => print('Search'),
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30.0,
                  // ignore: avoid_print
                  onPressed: () => print('Messenger'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}