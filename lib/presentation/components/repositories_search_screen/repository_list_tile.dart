import 'package:flutter/material.dart';
import 'package:yumemi_code_assignment/domain/github_repository_model.dart';
import 'package:yumemi_code_assignment/presentation/components/shared/repository_overview.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({required this.gitHubRepositoryModel, super.key});

  final GitHubRepositoryModel gitHubRepositoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO(me): Navigation to detail screen
      },
      child: RepositoryOverview(
        gitHubRepositoryModel: gitHubRepositoryModel,
      ),
    );
  }
}
