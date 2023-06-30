import 'package:bubble_tea/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // Customize sweet
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // Customize ice
  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // Customize pealrs
  double pearlsValue = 0.5;
  void customizePearls(double newValue) {
    setState(() {
      pearlsValue = newValue;
    });
  }

  // Add to cart
  void addToCart() {
    // Add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    // Navigate the user to shop page
    Navigator.pop(context);

    // Show dialog
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          // Drink image
          Image.asset(
            widget.drink.imagePath,
            height: 420,
          ),

          // Slider to customize the drink
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // Sweet slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Sweet'),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    ),
                  ],
                ),

                // Ice slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Ice'),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                      ),
                    ),
                  ],
                ),

                // Pearls slide
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Pearls'),
                    ),
                    Expanded(
                      child: Slider(
                        value: pearlsValue,
                        label: pearlsValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearls(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add to cart
          MaterialButton(
            onPressed: addToCart,
            color: Colors.brown,
            child: const Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
