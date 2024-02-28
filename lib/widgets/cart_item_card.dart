import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String name;
  final String imageUrl;

  ItemCard({required this.name, required this.imageUrl});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int _quantity = 0;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              widget.imageUrl,
              height: 70,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),

          Text(
                widget.name,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),


              IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _decrement,
                  ),
                  Text(
                    '$_quantity',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _increment,
                  ),
          
        ],
      ),
    );
  
  
  }
}