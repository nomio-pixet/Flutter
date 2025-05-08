import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Дээр background зураг + profile зураг
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Background image + gradient overlay
              Container(
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  image: DecorationImage(
                    image: NetworkImage('assets/images/profile_background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.25),
                        Colors.deepPurple.withOpacity(0.18),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              // Profile avatar + border + сүүдэр + overlap
              Positioned(
                left: 0,
                right: 0,
                bottom: -56,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.25),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 56,
                      backgroundImage: NetworkImage(
                        'assets/images/my_profile.jpg',
                      ),
                    ),
                  ),
                ),
              ),
              // Camera icon (profile зураг дээр давхарласан)
              Positioned(
                right: MediaQuery.of(context).size.width / 2 - 56 + 70,
                bottom: -48,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          // Username
          const Text(
            "Nomure",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              fontSize: 22,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 24),
          // Card with menu
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _ProfileMenuItem(icon: Icons.group, text: "Team info"),
                  _ProfileMenuItem(icon: Icons.settings, text: "Settings"),
                  _ProfileMenuItem(icon: Icons.emoji_events, text: "Rank"),
                  _ProfileMenuItem(icon: Icons.delete, text: "Delete account", iconColor: Colors.red),
                  _ProfileMenuItem(icon: Icons.logout, text: "Log Out", iconColor: Colors.red),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;

  const _ProfileMenuItem({
    required this.icon,
    required this.text,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.deepPurple),
        title: Text(
          text,
          style: TextStyle(
            color: iconColor ?? Colors.deepPurple,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.deepPurple),
        onTap: () {},
      ),
    );
  }
}