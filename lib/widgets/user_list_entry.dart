import 'package:flutter/material.dart';

class UserListEntry extends StatelessWidget {
  const UserListEntry({Key key, this.username}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.perm_identity_outlined
        ),
      ),
      title: Text(
        username,
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}
