import 'package:flutter/material.dart';

import 'package:flutter_facebooktask/config/palette.dart';
import 'package:flutter_facebooktask/models/user_model.dart';
import 'package:flutter_facebooktask/widgets/profile_avatar.dart';

import 'responsive.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  // ignore: use_key_in_widget_constructors
  const Rooms({

    required this.onlineUsers,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return OutlineButton(
      // ignore: avoid_print
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      // ignore: prefer_const_constructors
      borderSide: BorderSide(
        width: 3.0,
        color: const Color(0xFF82B1FF),
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
  
          // ignore: prefer_const_constructors
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          const SizedBox(width: 4.0),
          // ignore: prefer_const_constructors
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}