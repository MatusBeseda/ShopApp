import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skusanie2/components/shoe_tile.dart';

import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

//add shoe to cart
void addShoeToCart(Shoe shoe, BuildContext context) {
  Provider.of<Cart>(context, listen: false).addToCart(shoe);

  //alert the user when shoe is succesfully added to cart
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Succesfully added!'),
      content: Text('Check your cart.'),
    ),
  );
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search bar
          Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search', style: TextStyle(color: Colors.grey)),
                  Icon(Icons.search, color: Colors.grey),
                ],
              )),
          //message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Test aplikacie, text pod search barom',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          //hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Hot picks :D',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text('See all',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue))
                ]),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get a shoe
                  Shoe shoe = value.getShoeList()[index];

                  //return a shoe tile
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCart(shoe, context),
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
