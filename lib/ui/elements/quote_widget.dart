import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  final String quote;
  final String character;
  final String anime;

  const QuoteWidget(
      {Key? key,
      required this.quote,
      required this.character,
      required this.anime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.cyan[100],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"$quote"',
          ),
          const SizedBox(height: 20,),
          Text(
            '$character ($anime)',
          ),
        ],
      ),
    );
  }
}
