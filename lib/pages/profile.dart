import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add back navigation here
          },
        ),
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/logo.png'), // Replace with your image URL
            ),
            const SizedBox(height: 8),
            const Text(
              'Jason Nacua Piit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ProfileMenuItem(
              icon: Icons.person,
              text: 'Edit Profile',
              onTap: () {
                // Navigate to edit profile
              },
            ),
            ProfileMenuItem(
              icon: Icons.history,
              text: 'Order Histories',
              onTap: () {
                // Navigate to order histories
              },
            ),
            ProfileMenuItem(
              icon: Icons.qr_code,
              text: 'QR Code',
              onTap: () {
                // Navigate to QR Code
              },
            ),
            ProfileMenuItem(
              icon: Icons.notifications,
              text: 'Notifications',
              onTap: () {
                // Navigate to notifications
              },
            ),
            ProfileMenuItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                // Navigate to settings
              },
            ),
            ProfileMenuItem(
              icon: Icons.contact_phone,
              text: 'Contact Us',
              onTap: () {
                // Navigate to contact us
              },
            ),
            ProfileMenuItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                // Logout functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  ProfileMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
