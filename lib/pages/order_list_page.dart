import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  final List<int> _orders = List.generate(6, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order List"),
      ),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) => ListTile(
          key: Key('$index'),
          title: Text("This is Order #${_orders[index]}"),
          trailing: const Icon(Icons.more_horiz),
        ),
        itemCount: _orders.length,
        onReorder: (oldIndex, newIndex) {
          setState(
            () {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int order = _orders.removeAt(oldIndex);
              _orders.insert(newIndex, order);
            },
          );
        },
      ),
    );
  }
}
