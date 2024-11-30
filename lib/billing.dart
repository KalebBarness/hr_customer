import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hp_customer/featured.dart';
import 'package:hp_customer/profile.dart';
import 'package:hp_customer/home.dart';
import 'package:hp_customer/claims.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({super.key});

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 1;
    return WillPopScope(
        onWillPop: () async {
          // Intercept the back button press and navigate back to HomePage
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false, // This removes all previous routes from the stack
          );
          return false; // Prevent the default back navigation behavior
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Billing',
                  style: TextStyle(color: Colors.white, fontSize: 28)),
              backgroundColor: const Color.fromARGB(255, 3, 176, 251),
              centerTitle: true,
            ),
            body: Stack(clipBehavior: Clip.none, children: [
              Container(
                width: double.infinity,
                height: 250,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 3, 176, 251),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(25),
                  child: Row(children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.sunny)
                  ])),
              Positioned(
                  top: 120,
                  left: 40,
                  right: 40,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Column(children: [
                      SizedBox(height: 25),
                      Text(
                        '\$120.00',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Amount Due by MM/DD/YYYY',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 118, 117, 117),
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(),
                    ]),
                  )),
              Center(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 250)),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 65),
                        backgroundColor: const Color.fromARGB(255, 6, 136, 2),
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const Text(
                        'Make a Payment',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print("Text tapped!");
                        }
                      },
                      child: const Text(
                        'Bill Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 75)),
                    const Text(
                      'What\'s all included in your subscription?',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print("Text tapped!");
                        }
                      },
                      child: const Text(
                        'Subcription Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 145),
                    GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print("Text tapped!");
                        }
                      },
                      child: const Text(
                        'Manage Subcription ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
            bottomNavigationBar: NavigationBar(
              indicatorColor: const Color.fromARGB(255, 0, 174, 255),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.wallet), label: 'Billing'),
                NavigationDestination(
                    icon: Icon(Icons.add_box_rounded), label: 'Claims'),
                NavigationDestination(
                    icon: Icon(Icons.star_rate_outlined), label: 'Featured'),
                NavigationDestination(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
              onDestinationSelected: (int index) {
                setState(() {
                  currentPage = index;
                });
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                    break;

                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClaimsPage()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeaturedPage()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                    break;
                }
              },
              selectedIndex: currentPage,
            )));
  }
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Page')),
      body: const Center(
        child: Text('Welcome to the Payment Page!'),
      ),
    );
  }
}
