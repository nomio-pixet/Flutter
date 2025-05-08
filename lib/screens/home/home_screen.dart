import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.only(top: 48, bottom: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  // Centered Logo
                  Center(
                    child: Image.asset('assets/images/logo_1.png', height: 60),
                  ),
                  const SizedBox(height: 20),
                  //Header02
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        // Profile Image
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            'assets/images/my_profile.jpg',
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Texts
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome !",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Nominerdene",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Tournament List
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Tournament List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildTournamentCard(
                    "PUBG MOBILE",
                    "Not started",
                    "assets/images/pubg.jpg",
                  ),
                  _buildTournamentCard(
                    "Valorant",
                    "Ongoing",
                    "assets/images/valorant.jpg",
                  ),
                  _buildTournamentCard("CS2", "Ended", "assets/images/cs2.jpg"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // News Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "News",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildNewsImage("assets/images/news1.png"),
                  _buildNewsImage("assets/images/news2.png"),
                  _buildNewsImage("assets/images/news3.jpg"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Horizontal Cards Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Match List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            HorizontalCard(
              imagePath: 'assets/images/pubg.jpg',
              title: 'PUBG Tournament',
              subtitle: 'Mongolz vs Faze - 00:00pm',
            ),
          ],
        ),
      ),
    );
  }

  // Tournament Card with Image
  static Widget _buildTournamentCard(
    String title,
    String status,
    String imagePath,
  ) {
    Color statusColor;
    if (status == "Ended") {
      statusColor = Colors.grey;
    } else if (status == "Ongoing") {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.orange;
    }

    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding:  EdgeInsets.all(12),
            width: 130,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
              ],
            ),
          ),
          Positioned(
            top: -0,
          left: 20,
            
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
       
        ],
      ),
    );
  }

  // News Image only (no title)
  static Widget _buildNewsImage(String imagePath) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const HorizontalCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: 2 * 3.14,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}