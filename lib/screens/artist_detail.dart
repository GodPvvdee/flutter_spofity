import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:spotify/screens/home_page.dart';
import 'package:spotify/screens/home_page.dart';

class ArtistDetail extends StatelessWidget {
  const ArtistDetail({super.key, required this.artist});
  // final Map detailProduct;
  final Artists artist;
  @override
  Widget build(BuildContext context) {
    print("artist detail context: $context");

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white, // <-- SEE HERE
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(artist.name),
            ),
          ],
        ),
      ),
    );
  }
}
