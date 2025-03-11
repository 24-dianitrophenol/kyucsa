import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  // Dummy data for updates and learning materials
  final List<Map<String, String>> updates = [
    {"title": "Session 1", "description": "Introduction to KYUCSA"},
    {"title": "Session 2", "description": "Leadership Training"},
    {"title": "Session 3", "description": "Team Building Activities"},
  ];

  final List<Map<String, String>> learningMaterials = [
    {"title": "Flutter Basics", "description": "Learn Flutter from scratch"},
    {"title": "Dart Programming", "description": "Master Dart language"},
    {"title": "Firebase Integration", "description": "Integrate Firebase with Flutter"},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KYUCSA App'),
        centerTitle: true,
      ),
      body: _selectedIndex == 0
          ? _buildHomePage()
          : _selectedIndex == 1
              ? _buildSearchPage()
              : _buildProfilePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: Icon(Icons.arrow_upward),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: const Color.fromARGB(255, 61, 59, 59)!,
              hoverColor: const Color.fromARGB(255, 234, 234, 236)!,
              gap: 8,
              activeColor: const Color.fromARGB(255, 216, 128, 4),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: const Color.fromARGB(255, 27, 3, 208),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomePage() {
    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Latest Updates',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 16),
        ...updates.map((update) => Card(
              child: ListTile(
                title: Text(update["title"]!),
                subtitle: Text(update["description"]!),
              ),
            )),
        SizedBox(height: 24),
        Text(
          'Learning Materials',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 16),
        ...learningMaterials.map((material) => Card(
              child: ListTile(
                title: Text(material["title"]!),
                subtitle: Text(material["description"]!),
              ),
            )),
      ],
    );
  }

  Widget _buildSearchPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search learning materials...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement search functionality
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePage() {
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}