import 'package:bubble_tea/components/drink_tile.dart';
import 'package:bubble_tea/models/drink.dart';
import 'package:bubble_tea/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Remove from cart
  void removeFromCart(Drink drink) {
    // Remove from cart
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              const Text(
                'Your cart',
                style: TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 10),

              // List of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // Get the individual drink
                    var individualDrink = value.cart[index];

                    return DrinkTile(
                      drink: individualDrink,
                      onTap: () => removeFromCart(individualDrink),
                      trailing: const Icon(Icons.delete),
                    );
                  },
                ),
              ),

              // Pay button
              MaterialButton(
                onPressed: () {},
                color: Colors.brown,
                child: const Text(
                  'Pay',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
