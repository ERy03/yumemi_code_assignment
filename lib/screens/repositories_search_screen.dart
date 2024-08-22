import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_code_assignment/components/repositories_search_screen/custom_appbar.dart';
import 'package:yumemi_code_assignment/components/repositories_search_screen/custom_search_bar.dart';

class RepositoriesSearchScreen extends ConsumerWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(gitHubRepositorySearchTextStateProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        themeModeProvider: false,
        context: context,
        toggle: (val) {
          // TODO use themeModeProvider
        },
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
