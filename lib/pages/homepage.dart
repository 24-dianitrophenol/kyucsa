import 'package:flutter/material.dart';
import 'package:kyucsa/pages/Navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
        _controller.forward().then((_) => _controller.reverse());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: const Center(
            child: Text('KYUCSA-APP',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _buildAnimatedIcon(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildAnimatedIcon(Icons.search, 1),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _buildAnimatedIcon(Icons.person, 2),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  Widget _buildAnimatedIcon(IconData icon, int index) {
    return ScaleTransition(
      scale: _currentIndex == index ? _animation : const AlwaysStoppedAnimation(1.0),
      child: SizedBox(
        width: 50,
        height: 40,
        child: Icon(icon, size: 30),
      ),
    );
  }
}
