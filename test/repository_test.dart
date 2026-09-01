import 'package:flutter_test/flutter_test.dart';
import 'package:sy_projects/data/mock_data.dart';
import 'package:sy_projects/repositories/project_repository.dart';

void main() {
  test('project repository falls back to mock data when Firebase is unavailable', () async {
    final repository = ProjectRepository();

    final projects = await repository.fetchProjects();

    expect(projects.isNotEmpty, isTrue);
    expect(projects.first.title, AppMockData.featuredProjects.first.title);
  });
}
