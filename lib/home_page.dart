import 'package:flutter/material.dart';
import 'search_field.dart'; // Add this import

void main() {
  runApp(const ViewXRentApp());
}

class ViewXRentApp extends StatelessWidget {
  const ViewXRentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      bottomNavigationBar: const CustomBottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderSection(),
              const SizedBox(height: 15),
              const CategorySection(),
              const SizedBox(height: 15),
              const FeaturedSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// HEADER SECTION
////////////////////////////////////////////////////////

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xfff36c6c),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "V",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff36c6c),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "ViewXRent",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Icon(Icons.favorite_border, color: Colors.white),
              SizedBox(width: 15),
              Icon(Icons.notifications_none, color: Colors.white),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "Find Your Perfect Home",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Discover rental properties near you",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 15),

          /// SEARCH BAR - Updated to be tappable
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchFieldScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Search location or property...",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Icon(Icons.tune, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// CATEGORY SECTION
////////////////////////////////////////////////////////

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          categoryButton("All", true),
          categoryButton("Studio", false),
          categoryButton("1 Bedroom", false),
          categoryButton("2 Bedrooms", false),
          categoryButton("3+ Bedrooms", false),
        ],
      ),
    );
  }

  Widget categoryButton(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xfff36c6c) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// FEATURED SECTION
////////////////////////////////////////////////////////

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "Featured Properties",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text("See All", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 15),

          /// BIG CARD 1
          propertyCard(
            image: "https://via.placeholder.com/400x200",
            title: "Modern Studio Apartment",
            location: "Makati City, Metro Manila",
            price: "P2,000/month",
            details: "1 Bed 1 Bath 25m",
            label: "Popular",
          ),

          const SizedBox(height: 15),

          /// BIG CARD 2
          propertyCard(
            image: "https://via.placeholder.com/400x200",
            title: "2 floor Apartment",
            location: "Makati City, Metro Manila",
            price: "P4,000/month",
            details: "1 Bed 1 Bath 25m",
            label: "Featured",
          ),

          const SizedBox(height: 15),

          /// GRID STYLE CARDS
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
            children: [
              smallCard("Modern Studio Apartment", "P3,000/month"),
              smallCard("Modern Studio Apartment", "P2,850/month"),
              smallCard("Modern Studio Apartment", "P2,500/month"),
              smallCard("Modern Studio Apartment", "P4,000/month"),
            ],
          ),
        ],
      ),
    );
  }

  Widget propertyCard({
    required String image,
    required String title,
    required String location,
    required String price,
    required String details,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.network(
                  image,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xfff36c6c),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  location,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xfff36c6c),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  details,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget smallCard(String title, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              "https://via.placeholder.com/200",
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Makati City, Metro Manila",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xfff36c6c),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const Text(
                  "1 Bed 1 Bath 25m",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// BOTTOM NAVIGATION
////////////////////////////////////////////////////////

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xfff36c6c),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: "Message",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
      onTap: (index) {
        // Handle bottom navigation taps
        if (index == 1) {
          // Search tab
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchFieldScreen()),
          );
        }
      },
    );
  }
}
