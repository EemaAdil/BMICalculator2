import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List _items = [];

  final _shoppingBox = Hive.box('BMI_Activity');

  @override
  void initState() {
    super.initState();
    _refreshItems(); // Load data when app starts
  }

  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {
        "key": key,
        "name": value["name"],
        "quantity": value['quantity'],
        "date": value['date'],
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  Future<void> _deleteItem(int itemKey) async {
    await _shoppingBox.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('An item has been deleted'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae9ee),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "History",
          style: GoogleFonts.robotoSlab(
            textStyle: Theme.of(context).textTheme.displaySmall,
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'No Data',
                style: TextStyle(fontSize: 30),
              ),
            )
          : ListView.builder(
              // the list of items
              itemCount: _items.length,
              itemBuilder: (_, index) {
                var currentItem = _items[index];

                

                print("currentItem: ${currentItem['date']}");

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        title: Text(
                          currentItem['name'].toString(),
                          style: GoogleFonts.robotoSlab(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 0.5,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5.0),
                            Text(currentItem['quantity'].toString()),
                            // Text(currentItem['date'].toString()),
                            SizedBox(height: 5.0),
                            Text(DateFormat.yMMMMd()
                                .format(DateTime.parse(
                                    currentItem['date'].toString()))
                                .toString()),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Edit button
                            // IconButton(
                            //     icon: const Icon(Icons.edit),
                            //     onPressed: () =>
                            //         _showForm(context, currentItem['key'])),
                            // Delete button
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteItem(currentItem['key']),
                            ),
                          ],
                        )),
                  ),
                );
              }),
    );
  }
}
