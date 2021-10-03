// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_facebooktask/models/user_model.dart';
import 'package:flutter_facebooktask/widgets/profile_avatar.dart';
import 'package:flutter_facebooktask/widgets/responsive.dart';


class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  // ignore: use_key_in_widget_constructors
  const CreatePostContainer({

    required this.currentUser,
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
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                )
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            // ignore: sized_box_for_whitespace
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () => print('Live'),
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text('Live'),
                  ),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                    onPressed: () => print('Photo'),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text('Photo'),
                  ),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                    onPressed: () => print('Room'),
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: Text('Room'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}