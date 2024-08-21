import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_code_assignment/components/repositories_search_screen/custom_search_bar.dart';

class RepositoriesSearchScreen extends ConsumerWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(gitHubRepositorySearchTextStateProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // TODO Appbar
      appBar: AppBar(
        title: const Text('RepositoriesSearchScreen'),
      ),
      body: const Column(
        children: [
          CustomSearchBar(),
          //TODO Repositories list
          Center(
            child: Text('RepositoriesSearchScreen'),
          ),
        ],
      ),
    );
  }
}
