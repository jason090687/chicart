import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  int _selectedIndex = 3; // Default to profile tab

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the appropriate screen based on the index
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/homepage');
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed('/cart');
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed('/favorites');
        break;
      case 3:
        // Stay on the current profile page
        break;
    }
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
            final displayName = currentUser?.displayName ?? 'No Name';
            final initialLetters = displayName.isNotEmpty
                ? displayName.substring(
                    0, displayName.length < 2 ? displayName.length : 2)
                : 'NN';

            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(userData['username'] ?? 'No Name'),
                  accountEmail: Text(currentUser?.email ?? 'No Email'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(
                      initialLetters,
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
