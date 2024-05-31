import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add back navigation here
          },
        ),
        title: const Text('Checkout'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.circle, color: Colors.orange),
                    Text('Address'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.circle, color: Colors.orange),
                    Text('Payment'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.circle_outlined),
                    Text('Delivery'),
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/mastercard.png', // Replace with your image URL for MasterCard
                  height: 40,
                ),
                Image.asset(
                  'assets/visa.png', // Replace with your image URL for VISA
                  height: 40,
                ),
                Image.asset(
                  'assets/paypal.png', // Replace with your image URL for PayPal
                  height: 40,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Cardholder Name',
                hintText: 'Jason Piit',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                hintText: '8790 8772 6721 2155',
              ),
              keyboardType: TextInputType.number,
            ),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      hintText: '999',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: '11/21',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add payment processing functionality
                },
                child: const Text('Pay Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
