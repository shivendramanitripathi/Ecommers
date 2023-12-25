import 'package:ecommers/widget/top_titles.dart';
import 'package:flutter/material.dart';

class ViewItem extends StatefulWidget {
  final String figure;
  final String des;
  final String price;
  final String id;
  const ViewItem({
    super.key,
    required this.figure,
    required this.des,
    required this.price,
    required this.id,
  });

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(heading: 'View Item', tittle: ''),
            Image.network(widget.figure),
            Text(
              'Price:₹${widget.price}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(widget.des,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
