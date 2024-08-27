import 'package:flutter/material.dart';
import 'package:yumemi_code_assignment/domain/github_repository_model.dart';
import 'package:yumemi_code_assignment/presentation/components/shared/repository_overview.dart';
import 'package:yumemi_code_assignment/presentation/screens/repository_detail_screen.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({required this.gitHubRepositoryModel, super.key});

  final GitHubRepositoryModel gitHubRepositoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => RepositoryDetailScreen(
              gitHubRepositoryModel: gitHubRepositoryModel,
            ),
          ),
        );
      },
      child: RepositoryOverview(
        gitHubRepositoryModel: gitHubRepositoryModel,
      ),
    );
  }
}
