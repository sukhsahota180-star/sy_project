import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sy_projects/providers/providers.dart';

class ProjectDetailScreen extends ConsumerWidget {
  final String slug;

  const ProjectDetailScreen({
    required this.slug,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(projectBySlugProvider(slug));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
      ),
      body: projectAsync.when(
        data: (project) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (project.image != null)
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(project.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        project.description,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[700],
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Technologies Used',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: project.technologies
                            .map((tech) {
                          return Chip(
                            label: Text(tech),
                            backgroundColor: Color(0xFF2E7D32).withOpacity(0.2),
                            labelStyle: TextStyle(
                              color: Color(0xFF2E7D32),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 24),
                      if (project.link != null || project.github != null)
                        Row(
                          children: [
                            if (project.link != null)
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () =>
                                      _launchUrl(project.link ?? ''),
                                  icon: const Icon(Icons.open_in_new),
                                  label: const Text('Visit Live'),
                                ),
                              ),
                            if (project.link != null && project.github != null)
                              SizedBox(width: 16),
                            if (project.github != null)
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () =>
                                      _launchUrl(project.github ?? ''),
                                  icon: const Icon(Icons.code),
                                  label: const Text('View Code'),
                                ),
                              ),
                          ],
                        ),
                      SizedBox(height: 16),
                      Text(
                        'Created: ${project.createdAt}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
