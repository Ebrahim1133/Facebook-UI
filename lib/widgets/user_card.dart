import 'package:flutter/material.dart';
import 'package:flutter_facebooktask/models/user_model.dart';

import 'package:flutter_facebooktask/widgets/profile_avatar.dart';

class UserCard extends StatelessWidget {
  final User user;

  // ignore: use_key_in_widget_constructors
  const UserCard({

    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              user.name,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}