import 'package:bloc_network_user_api/widgets/user_list.dart';
import 'package:flutter/material.dart';

import '../widgets/action_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Listе'),
        centerTitle: true,
      ),
      backgroundColor: Colors.yellow,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActionButtons(),
          Expanded(
            child: UserList(),
          ),
        ],
      ),
    );
  }
}
