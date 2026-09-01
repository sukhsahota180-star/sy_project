import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in Touch',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We\'d love to hear from you. Send us a message!',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 32),
            _ContactOption(
              icon: Icons.email,
              title: 'Email',
              subtitle: 'sukhsahota180@gmail.com',
              onTap: () =>
                  _launchUrl('mailto:sukhsahota180@gmail.com'),
            ),
            SizedBox(height: 16),
            _ContactOption(
              icon: Icons.phone,
              title: 'Phone',
              subtitle: '+91 8437 584 541',
              onTap: () => _launchUrl('tel:+918437584541'),
            ),
            SizedBox(height: 16),
            _ContactOption(
              icon: Icons.message,
              title: 'WhatsApp',
              subtitle: '+91 8437 584 541',
              onTap: () => _launchUrl(
                'https://wa.me/918437584541',
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Or fill out the form below',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Send Message'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
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

class _ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Color(0xFF2E7D32),
          size: 32,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
