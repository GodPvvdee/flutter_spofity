import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spotify/components/icon_button_widget.dart';
import 'package:spotify/screens/artist_detail.dart';
import "package:spotify/utils/AppColors.dart";

class Artists {
  final String name;
  final String id;
  const Artists(this.name, this.id);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = List.generate(6, (index) => {"id": index, "name": "Artist $index "}).toList();
    final List artist = [
      Artists('Weekend', "1"),
      Artists('Sash', '2'),
      Artists('Ginjin', '3'),
      Artists('Joji', '4'),
      Artists('Kendrick', '5'),
      Artists('Post malone', '6'),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Good afternoon',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add, color: Colors.white),
            onPressed: () {
              // Add your search action here
            },
          ),
          IconButton(
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your settings action here
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your settings action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Music"),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.secondColor), // Background color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Corner radius
                          // You can also specify other border properties here (e.g., side)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Podcasts & Shows"),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.secondColor), // Background color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Corner radius
                          // You can also specify other border properties here (e.g., side)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Card(),
            Padding(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200, childAspectRatio: 3 / 1, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemCount: artist.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return PlayListContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ArtistDetail(artist: artist[index])),
                        );
                      },
                      // title: (myProducts[index]["name"]),
                      title: (artist[index].name),
                      description: 'Playlist 1',
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRUkli95GEv-r_Sn6lgtMUAn8GA28NhlQ8Jj0epUt9oBhI4Gabk'),
                          fit: BoxFit.cover),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Jump back in",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700, fontFamily: "Raleway", fontStyle: FontStyle.normal, fontSize: 22.0),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return BannerListContainer(
                      title: (artist[index].name),
                      description: 'Playlist 1',
                      image: DecorationImage(
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO41R5DqpivDD3ePKbxvaUOtGZ9OhpbqWVMO7D86c&s'),
                          fit: BoxFit.cover),
                    );
                  },
                  itemCount: 6,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Recently played",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700, fontFamily: "Raleway", fontStyle: FontStyle.normal, fontSize: 22.0),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return BannerListContainer(
                      title: (myProducts[index]["name"]),
                      description: 'Playlist 1',
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media.pitchfork.com/photos/5a5e71370c74bb56c7af6f0d/1:1/w_600/rich-chigga-amen-cover-low-res.jpg'),
                          fit: BoxFit.cover),
                    );
                  },
                  itemCount: 6,
                )),

// end duusaj bn
            // Add more content as needed
          ],
        ),
      ),
    );
  }
}

class BannerListContainer extends StatelessWidget {
  const BannerListContainer({
    Key? key,
    required this.title,
    required this.description,
    this.image,
    this.onTap,
    this.color = const Color(0xff2E2F33),
  }) : super(key: key);

  final String title;
  final String description;
  final DecorationImage? image;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 400,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // img
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: color,
                image: image,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400, fontFamily: "Raleway", fontStyle: FontStyle.normal, fontSize: 13.0),
                ),
                Text(
                  description,
                  style: const TextStyle(
                      color: Colors.white54, fontWeight: FontWeight.w400, fontFamily: "Raleway", fontStyle: FontStyle.normal, fontSize: 12.0),
                ),
              ],
            ),
            // text
          ],
        ),
      ),
    );
  }
}

class PlayListContainer extends StatelessWidget {
  const PlayListContainer({
    Key? key,
    required this.title,
    this.description,
    this.image,
    this.onTap,
    this.color = const Color(0xff2E2F33),
  }) : super(key: key);

  final String title;
  final String? description;
  final DecorationImage? image;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: AppColors.secondColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // img
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: color,
                image: image,
              ),
            ),
            // text
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // title
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(title,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis, // new
                        style: const TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left),
                  ),
                  // description
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: 2,
                      child: Text(
                        description ?? '',
                        style: const TextStyle(
                          color: Color(0xffa7a7a7),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
