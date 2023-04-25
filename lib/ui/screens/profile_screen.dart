import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/generated/l10n.dart';

import '../../bloc/user/user_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _usernameController;
  bool _inEditMode = false;

  @override
  void initState() {
    super.initState();
    var userState = BlocProvider.of<UserBloc>(context).state;
    _initTextFieldControllers(userState);
  }

  void _initTextFieldControllers(UserState state) {
    if (state is UserLoadSuccess) {
      _firstNameController = TextEditingController(text: state.user.firstName);
      _lastNameController = TextEditingController(text: state.user.lastName);
      _usernameController = TextEditingController(text: state.user.userName);
    } else {
      _firstNameController = TextEditingController(text: "");
      _lastNameController = TextEditingController(text: "");
      _usernameController = TextEditingController(text: "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        _initTextFieldControllers(state);
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadFailure) {
              return const Text("Could not load user info");
            } else if (state is UserLoadSuccess) {
              return Card(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).profileTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            CircleAvatar(
                              radius: 40,
                              foregroundImage: Image.asset("assets/dog.png").image,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("First Name"),
                            SizedBox(
                                width: 200,
                                child: TextField(
                                  enabled: _inEditMode,
                                  controller: _firstNameController,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Last Name"),
                            SizedBox(
                                width: 200,
                                child: TextField(
                                  enabled: _inEditMode,
                                  controller: _lastNameController,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Username"),
                            SizedBox(
                                width: 200,
                                child: TextField(
                                  enabled: _inEditMode,
                                  controller: _usernameController,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: _inEditMode
                                ? IconButton(
                                    onPressed: () => setState(() {
                                          _inEditMode = false;
                                        }),
                                    icon: Icon(Icons.save))
                                : IconButton(
                                    onPressed: () => setState(() {
                                          _inEditMode = true;
                                        }),
                                    icon: Icon(Icons.edit))),
                      ],
                    )),
              );
            } else {
              return Text("oops");
            }
          },
        ),
      ),
    );
  }
}
