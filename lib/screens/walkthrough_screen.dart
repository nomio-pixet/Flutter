import 'package:flutter/material.dart';
import 'login/login_screen.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _scale = 1.0;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/logo_1.png',
      'title': 'WE ARE ONE WORLD',
      'subtitle': 'Create a team and participate in the tournament',
    },
    {
      'image': 'assets/images/logo_1.png',
      'title': 'CONNECT TOGETHER',
      'subtitle': 'Meet players from all around the globe',
    },
    {
      'image': 'assets/images/logo_1.png',
      'title': 'JOIN & ENJOY',
      'subtitle': 'Get ready for the ultimate experience',
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward(); // animate initial
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });

    _animationController.reset();
    _animationController.forward(); // animate on every page change
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8F4FFB),
      body: Stack(
        children: [
          // PageView content
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100), // Push content down a bit more
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // "WE ARE ONE WORLD" Title
                              Text(
                                page['title']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              // Subtitle under the title
                              Text(
                                page['subtitle']!,
                                style: TextStyle(color: Colors.white, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // ✅ Logo at the bottom with text below it
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50), // Adjust the position of logo and text
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Image.asset(
                          _pages[_currentPage]['image']!,
                          height: 350,
                          width: 350,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _pages[_currentPage]['title']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ✅ Arrow button at the bottom right corner
          Positioned(
            bottom: 40,
            right: 40,
            child: GestureDetector(
              onTap: _nextPage,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(16),
                child: const Icon(Icons.arrow_forward, color: Color(0xFF8F4FFB)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
