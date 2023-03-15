import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPage = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Topics"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.topic), label: 'Topics'),
          NavigationDestination(icon: Icon(Icons.class_), label: 'Classes'),
          NavigationDestination(icon: Icon(Icons.scanner), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
      body: Container(
        child: GridView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.orange,
                child: Icon(Icons.person),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                child: Icon(Icons.earbuds_battery),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.redAccent,
                child: Icon(Icons.phone),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.pinkAccent,
                child: Icon(Icons.mail),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.deepPurple,
                child: Icon(Icons.read_more),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.yellow,
                child: Icon(Icons.home),
              ),
            ),
          ],
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Physics',
    'C#',
    'C',
    'Java',
    'Introduction to Programming',
    'Calculus',
    'Data Minning',
    'Web Technology',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var topics in searchTerms) {
      if (topics.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(topics);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var topics in searchTerms) {
      if (topics.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(topics);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
