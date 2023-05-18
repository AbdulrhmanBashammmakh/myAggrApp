import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myaggr/UI/Widget/custom_text.dart';

class ListAddProducts extends StatefulWidget {
  const ListAddProducts({Key? key}) : super(key: key);

  @override
  State<ListAddProducts> createState() => _ListAddProductsState();
}

class _ListAddProductsState extends State<ListAddProducts> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  List<Map<String, dynamic>> _items = [];

  final _productsBox = Hive.box('products_box');
  void _refreshItems() {
    final data = _productsBox.keys.map((key) {
      final item = _productsBox.get(key);
      return {
        "key": key,
        "product": item["product"],
        "price": item["price"],
        "qty": item["qty"]
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _productsBox.add(newItem);
    _refreshItems();
    print("amount of data now ... ${_productsBox.length}");
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("تم الاضافة بنجاح ")));
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await _productsBox.put(itemKey, item);
    _refreshItems();
    print("amount of data now ... ${_productsBox.length}");
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("تم التعديل بنجاح ")));
  }

  Future<void> _deleteItem(int itemKey) async {
    await _productsBox.delete(itemKey);
    _refreshItems();
    print("amount of data now ... ${_productsBox.length}");
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("تم الحذف بنجاح ")));
  }

  void _showBottomSheet(BuildContext context, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      _nameController.text = existingItem['product'];
      _qtyController.text = existingItem['qty'];
      _priceController.text = existingItem['price'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
              height:  400, //MediaQuery.of(context).size.height / 2,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CustomText(text: 'Product Name'),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: _nameController,
                        decoration:
                            const InputDecoration(hintText: 'ادخل اسم المنتج'),
                      ),
                    ),
                    const CustomText(text: 'Qty'),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _qtyController,
                        decoration:
                            const InputDecoration(hintText: 'ادخل كمية المنتج'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const CustomText(text: 'Price'),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _priceController,
                        decoration:
                            const InputDecoration(hintText: 'ادخل سعر المنتج'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text(itemKey == null
                            ? "الحفظ مع الرجوع"
                            : "حفظ التعديل"),
                        onPressed: () {
                          //craete item here ...
                          if (itemKey == null) {
                            _createItem({
                              "product": _nameController.text,
                              "qty": _qtyController.text,
                              "price": _priceController.text
                            });
                          }
                          if (itemKey != null) {
                            _updateItem(itemKey, {
                              "product": _nameController.text.trim(),
                              "qty": _qtyController.text.trim(),
                              "price": _priceController.text.trim(),
                            });
                          }

                          _nameController.text = '';
                          _priceController.text = '';
                          _qtyController.text = '';
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: const Text("الرجوع"),
                        onPressed: () {
                          _nameController.text = '';
                          _priceController.text = '';
                          _qtyController.text = '';
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    //  initState();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Add Products"),
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final currentItem = _items[index];
            return Card(
              color: Colors.amberAccent,
              margin: EdgeInsets.all(10),
              elevation: 6,
              child: Center(
                child: ListTile(
                  title: Text(currentItem['product']),
                  subtitle: ListTile(
                    title: Text(currentItem['qty'].toString()),
                    subtitle: Text(currentItem['price'].toString() + " YR"),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () =>
                              _showBottomSheet(context, currentItem['key']),
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            _deleteItem(currentItem['key']);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context, null),
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(
          Icons.add,
          // color: Colors.deepOrangeAccent,
        ),
      ),

      // Container(
      //   child: ListView(
      //     children: [
      //       // SizedBox(
      //       //   height: 20,
      //       // ),
      //       Container(
      //         child: CustomButtonExpanded(
      //           onPress: () {
      //             _showBottomSheet(context, null);
      //           },
      //           padding: 8,
      //           color: Constants.thirdColor2,
      //           textname: 'اضافة منتج ',
      //         ),
      //       ),
      //       Container(
      //         child:
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
