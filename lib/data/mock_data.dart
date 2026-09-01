import 'package:sy_projects/models/models.dart';

class AppMockData {
  static final List<Project> featuredProjects = [
    Project(
      id: 'p1',
      title: 'E-commerce Growth Platform',
      slug: 'ecommerce-growth-platform',
      description:
          'A conversion-focused storefront with advanced analytics, campaign tracking, and modular product management for a fast-growing brand.',
      image:
          'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=80',
      technologies: ['Flutter', 'Node.js', 'Stripe', 'Analytics'],
      link: 'https://example.com',
      github: 'https://github.com',
      createdAt: DateTime.now().subtract(const Duration(days: 120)),
      updatedAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    Project(
      id: 'p2',
      title: 'Startup Launch Dashboard',
      slug: 'startup-launch-dashboard',
      description:
          'A modern SaaS admin panel for founders, with KPI dashboards, real-time sales tracking, secure access, and partner workflows.',
      image:
          'https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1200&q=80',
      technologies: ['Flutter', 'Supabase', 'Charts', 'Auth'],
      link: 'https://example.com',
      github: 'https://github.com',
      createdAt: DateTime.now().subtract(const Duration(days: 180)),
      updatedAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
    Project(
      id: 'p3',
      title: 'Travel Booking Experience',
      slug: 'travel-booking-experience',
      description:
          'A premium travel booking mobile and web app focused on guided discovery, itinerary planning, and personalized recommendations.',
      image:
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1200&q=80',
      technologies: ['Flutter', 'Maps', 'Payments', 'UX Design'],
      link: 'https://example.com',
      github: 'https://github.com',
      createdAt: DateTime.now().subtract(const Duration(days: 220)),
      updatedAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  static final List<Map<String, dynamic>> services = [
    {
      'icon': 'code',
      'title': 'Web Products',
      'description': 'Fast, conversion-focused digital products built for modern brands.',
    },
    {
      'icon': 'smartphone',
      'title': 'Mobile Apps',
      'description': 'Native-quality Flutter apps with polished UX and scalable architecture.',
    },
    {
      'icon': 'palette',
      'title': 'UI / UX',
      'description': 'Clean design systems, stronger storytelling, and more trust in every screen.',
    },
    {
      'icon': 'analytics',
      'title': 'Business Growth',
      'description': 'Strategy, experimentation, and customer journeys that improve results.',
    },
  ];

  static final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Aisha Mehta',
      'role': 'Founder, UrbanNest',
      'quote':
          'SY Projects transformed our rough concept into a product that clients genuinely trust. The experience felt premium from day one.',
    },
    {
      'name': 'Daniel Ross',
      'role': 'Marketing Lead, Novo Labs',
      'quote':
          'The design quality and clarity of the platform made a huge difference in how our sales team positioned our offer.',
    },
    {
      'name': 'Rahul Sharma',
      'role': 'CEO, NextOrbit',
      'quote':
          'We needed a modern digital presence and a platform that could scale. They delivered both with speed and precision.',
    },
  ];

  static final List<Map<String, dynamic>> processSteps = [
    {
      'title': 'Discover',
      'description': 'Understand your goals, audience, and product direction.',
    },
    {
      'title': 'Design',
      'description': 'Create a visual system and product blueprint built around UX clarity.',
    },
    {
      'title': 'Build',
      'description': 'Develop a polished MVP or full product using scalable architecture.',
    },
    {
      'title': 'Launch',
      'description': 'Deploy, optimize, and support the product for ongoing growth.',
    },
  ];
}
