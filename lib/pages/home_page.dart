import 'package:bloc_network_user_api/bloc/user_bloc.dart';
import 'package:bloc_network_user_api/bloc/user_event.dart';
import 'package:bloc_network_user_api/cubit/internet_cubit.dart';
import 'package:bloc_network_user_api/services/user_repository.dart';
import 'package:bloc_network_user_api/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/action_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserBloc(userRepository: context.read<UserRepository>())
                  ..add(UserLoadEvent()),
          ),
          BlocProvider(create: (context) => ConnectionCubit()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<ConnectionCubit, MyConnectionState>(
              builder: (context, state) => state.connected
                  ? const Text('User List (в сети)')
                  : const Text(
                      'Нет соединения с интернет!',
                      style: TextStyle(color: Colors.red),
                    ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}
