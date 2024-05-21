import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(currentUser?.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              return ListView(
                // Remove padding so the menu fits the screen better
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(userData['username'] ?? 'No Name'),
                    accountEmail: Text(currentUser?.email ?? 'No Email'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text(
                        currentUser?.displayName?.substring(0, 2) ?? 'NN',
                        style: const TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Edit Profile'),
                    leading: const Icon(Icons.account_circle),
                    onTap: () {
                      // Navigate to edit profile screen
                    },
                  ),
                  ListTile(
                    title: const Text('Order Histories'),
                    leading: const Icon(Icons.list),
                    onTap: () {
                      // Navigate to order history screen
                    },
                  ),
                  ListTile(
                    title: const Text('QR Code'),
                    leading: const Icon(Icons.qr_code),
                    onTap: () {
                      // Generate and display QR code
                    },
                  ),
                  ListTile(
                    title: const Text('Notifications'),
                    leading: const Icon(Icons.notifications),
                    onTap: () {
                      // Navigate to notifications screen
                    },
                  ),
                  ListTile(
                    title: const Text('Settings'),
                    leading: const Icon(Icons.settings),
                    onTap: () {
                      // Navigate to settings screen
                    },
                  ),
                  ListTile(
                    title: const Text('Contact Us'),
                    leading: const Icon(Icons.help),
                    onTap: () {
                      // Navigate to contact us screen
                    },
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    leading: const Icon(Icons.logout),
                    onTap: () {
                      signOut();
                      Navigator.of(context).pushReplacementNamed(
                          '/login'); // Assuming you have a login route
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
