import 'package:flutter/material.dart';
import 'package:flutter_facebooktask/models/user_model.dart';
import 'package:flutter_facebooktask/widgets/user_card.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  // ignore: use_key_in_widget_constructors
  const ContactsList({
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 8.0),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
