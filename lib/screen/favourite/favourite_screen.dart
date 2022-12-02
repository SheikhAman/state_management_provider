import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statepract_1/provider/favourite_provider.dart';
import 'package:statepract_1/screen/favourite/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFavouriteItemScreen()),
                );
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10000,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, provider, child) {
                    return ListTile(
                      onTap: () {
                        if (provider.selectedItemList.contains(index)) {
                          provider.removeItem(index);
                        } else {
                          provider.addItem(index);
                        }
                      },
                      title: Text(
                        'Item ' + index.toString(),
                      ),
                      trailing: Icon(provider.selectedItemList.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
