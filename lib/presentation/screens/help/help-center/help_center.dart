import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final TextEditingController _searchController = TextEditingController();

  // The complete list of help topics.
  final List<Map<String, dynamic>> _allHelpTopics = [
    {
      'title': 'Frequently Asked Questions',
      'icon': Icons.question_answer,
      'route': '/faqs', // Replace with actual routes or leave null
    },
    {
      'title': 'Shipping & Delivery',
      'icon': Icons.local_shipping,
      'route': '/shipping',
    },
    {
      'title': 'Returns & Exchanges',
      'icon': Icons.replay,
      'route': '/returns',
    },
    {
      'title': 'Payment Options',
      'icon': Icons.payment,
      'route': '/payment',
    },
    {
      'title': 'Contact Us',
      'icon': Icons.contact_support,
      'route': '/contact',
    },
  ];

  // List to hold filtered help topics based on search input.
  List<Map<String, dynamic>> _filteredHelpTopics = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all topics.
    _filteredHelpTopics = List.from(_allHelpTopics);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // Called whenever the search query changes.
  void _onSearchChanged() {
    final query = _searchController.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredHelpTopics = List.from(_allHelpTopics);
      } else {
        _filteredHelpTopics = _allHelpTopics
            .where((topic) =>
                topic['title'].toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center", style: TextStyle(color: AppColors.surface),),
        centerTitle: true,
        backgroundColor: AppColors.primaryLight,
      ),
      backgroundColor: AppColors.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Help Articles...",
                prefixIcon: const Icon(Icons.search),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Help Topics List
            Expanded(
              child: _filteredHelpTopics.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredHelpTopics.length,
                      itemBuilder: (context, index) {
                        final topic = _filteredHelpTopics[index];
                        return _buildHelpTile(
                          context,
                          icon: topic['icon'],
                          title: topic['title'],
                          onTap: () {
                            // Navigate to specific help detail page if route provided.
                            final route = topic['route'];
                            if (route != null) {
                              Navigator.pushNamed(context, route);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${topic['title']} tapped'),
                                ),
                              );
                            }
                          },
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a consistent ListTile widget for each help topic.
  ListTile _buildHelpTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}
