import 'package:flutter/material.dart';
import 'package:flutter_foods_apps/models/foods.dart';

class DetailScreen extends StatelessWidget {
  final Foods food;

  const DetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return DetailMobilePage(foods: food);
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final Foods foods;

  const DetailMobilePage({Key? key, required this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(foods.picture),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              foods.name,
                              style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF52525B)),
                            ),
                          ),
                        ],
                      ))),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
                child: const Text(
                  'Deskripsi:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  foods.desc,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
      floatingActionButton: const FavoriteFAB(),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.bookmark : Icons.bookmark_outline,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class FavoriteFAB extends StatefulWidget {
  const FavoriteFAB({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteFABState createState() => _FavoriteFABState();
}

class _FavoriteFABState extends State<FavoriteFAB> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
