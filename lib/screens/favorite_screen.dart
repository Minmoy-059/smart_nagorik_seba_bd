import 'package:flutter/material.dart';
import 'favorite_service.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> _favList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
  _favList = await FavoriteService.getFavorites();

  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('পছন্দের সেবাসমূহ'),
      ),
      body: _favList.isEmpty
          ? const Center(
              child: Text(
                'কোনো পছন্দের সেবা বুকমার্ক করা নেই!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _favList.length,
              itemBuilder: (context, index) {
                final route = _favList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    title: Text(route.replaceAll('/', '').toUpperCase()),
                    subtitle: Text('Route: $route'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await FavoriteService.toggleFavorite(route);
                        _loadData();
                      },
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, route);
                    },
                  ),
                );
              },
            ),
    );
  }
}