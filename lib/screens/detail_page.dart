import 'package:flutter/material.dart';
import 'package:tenzi_za_rohoni/utils/song.dart';

class DetailPage extends StatefulWidget {
  final List<Map<String, dynamic>>? itemList;
  final Map<String, dynamic> item;
  final List<int> favoritesList;

  const DetailPage({
    super.key,
    required this.item,
    required this.favoritesList,
    required this.itemList,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DataModel? dataModel;

  bool isLiked() {
    return widget.favoritesList.contains(widget.itemList!.indexOf(widget.item));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.item['song_number']}. ${widget.item['title']}"),
      ),
      body: Center(
        child: dataModel != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dataModel!.chorus.map((paragraph) {
                  return Center(
                    child: Text(
                      paragraph,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
              )
            : const CircularProgressIndicator(),
      ),
      // body: const Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: SongDetail(),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Center(
      //     child: Column(
      //       children: [
      //         const SizedBox(height: 8),
      //         Text(
      //           widget.item['chorus'].toString(),
      //           style:
      //               const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      //         ),
      //         // Text(
      //         //   widget.item['song_1']['chorus']['2'],
      //         //   style:
      //         //       const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      //         // ),
      //         // Text(
      //         //   widget.item['song_1']['chorus']['3'],
      //         //   style:
      //         //       const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      //         // ),
      //         // Text(
      //         //   widget.item['song_1']['chorus']['4'],
      //         //   style:
      //         //       const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      //         // ),
      //         const SizedBox(height: 16),

      //         Text(
      //           isLiked()
      //               ? 'You have liked this item!'
      //               : 'You have not liked this item.',
      //           style: TextStyle(
      //             color: isLiked() ? Colors.green : Colors.red,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         // You can add any other relevant details here
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (widget.favoritesList
                .contains(widget.itemList!.indexOf(widget.item))) {
              widget.favoritesList
                  .remove(widget.itemList!.indexOf(widget.item));
            } else {
              widget.favoritesList.add(widget.itemList!.indexOf(widget.item));
            }
          });
        },
        tooltip: "Favourites",
        backgroundColor: Colors.amber[50],
        child: Icon(
          isLiked() ? Icons.favorite : Icons.favorite_border,
          color: isLiked() ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
