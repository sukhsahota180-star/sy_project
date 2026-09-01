import 'package:sy_projects/data/mock_data.dart';
import 'package:sy_projects/models/models.dart';

class ProjectRepository {
  Future<List<Project>> fetchProjects() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return AppMockData.featuredProjects;
  }

  Future<Project?> fetchProjectBySlug(String slug) async {
    await Future.delayed(const Duration(milliseconds: 250));
    try {
      return AppMockData.featuredProjects.firstWhere((project) => project.slug == slug);
    } catch (_) {
      return null;
    }
  }
}
