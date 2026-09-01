import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sy_projects/data/mock_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const NetworkImage(
                      'https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1600&q=80',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.45),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 36),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SY Projects',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () => context.push('/projects'),
                                child: const Text('Projects', style: TextStyle(color: Colors.white)),
                              ),
                              TextButton(
                                onPressed: () => context.push('/contact'),
                                child: const Text('Contact', style: TextStyle(color: Colors.white)),
                              ),
                              TextButton(
                                onPressed: () => context.push('/admin/login'),
                                child: const Text('Admin', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'We design and build digital products that move businesses forward.',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Strategy, branding, web experiences, mobile apps, and product design for ambitious founders and teams.',
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 18,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 28),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () => context.push('/projects'),
                                  icon: const Icon(Icons.arrow_forward),
                                  label: const Text('View work'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.green.shade900,
                                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                                  ),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () => context.push('/contact'),
                                  icon: const Icon(Icons.mail),
                                  label: const Text('Hire us'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    side: const BorderSide(color: Colors.white70),
                                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          _Stat(label: '6+', value: 'Years experience'),
                          _Stat(label: '32', value: 'Projects launched'),
                          _Stat(label: '98%', value: 'Client satisfaction'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What we do',
                      style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: AppMockData.services.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (context, index) {
                        final service = AppMockData.services[index];
                        final icon = switch (service['icon']) {
                          'code' => Icons.code,
                          'smartphone' => Icons.smartphone,
                          'palette' => Icons.palette,
                          _ => Icons.analytics,
                        };

                        return Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(icon, size: 34, color: Colors.green.shade700),
                                const SizedBox(height: 16),
                                Text(
                                  service['title'],
                                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  service['description'],
                                  style: GoogleFonts.poppins(color: Colors.grey[700], height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                    colors: [Colors.green.shade800, Colors.green.shade900],
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Our process',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...AppMockData.processSteps.asMap().entries.map((entry) {
                      final index = entry.key;
                      final step = entry.value;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: GoogleFonts.poppins(
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step['title'],
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    step['description'],
                                    style: GoogleFonts.poppins(color: Colors.white70, height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected work',
                      style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 18),
                    ...AppMockData.featuredProjects.map((project) => Container(
                          margin: const EdgeInsets.only(bottom: 18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Container(
                                  height: 220,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(project.image ?? ''),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.38),
                                        BlendMode.darken,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(18),
                                    color: Colors.black.withOpacity(0.42),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          project.title,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          project.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(color: Colors.white70),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What clients say',
                      style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 18),
                    ...AppMockData.testimonials.map((item) => Card(
                          margin: const EdgeInsets.only(bottom: 14),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '“${item['quote']}”',
                                  style: GoogleFonts.poppins(height: 1.6),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  item['name'],
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  item['role'],
                                  style: GoogleFonts.poppins(color: Colors.grey[700], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 28),
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.green.shade50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ready to grow your digital presence?',
                      style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Bring your product, brand, and vision together in one polished experience.',
                      style: GoogleFonts.poppins(color: Colors.grey[800], height: 1.5),
                    ),
                    const SizedBox(height: 18),
                    ElevatedButton.icon(
                      onPressed: () => context.push('/contact'),
                      icon: const Icon(Icons.mail),
                      label: const Text('Start a project'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;

  const _Stat({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
