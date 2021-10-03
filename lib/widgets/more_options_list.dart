import 'package:flutter/material.dart';
import 'package:flutter_facebooktask/config/palette.dart';
import 'package:flutter_facebooktask/models/user_model.dart';
import 'package:flutter_facebooktask/widgets/user_card.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];

  final User currentUser;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
 MoreOptionsList({

    required this.currentUser,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(user: currentUser),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(
              icon: option[0],
              color: option[1],
              label: option[2],
            ),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option({

    required this.icon,
    required this.color,
    required this.label,
  }) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: avoid_print
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}