import 'package:flutter/material.dart';

class RepositoriesSearchScreen extends StatelessWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // TODO Appbar
      appBar: AppBar(
        title: const Text('RepositoriesSearchScreen'),
      ),
      body: const Column(
        children: [
          //TODO Search bar
          SearchBar(),
          //TODO Repositories list
          Center(
            child: Text('RepositoriesSearchScreen'),
          ),
        ],
      ),
    );
  }
}
