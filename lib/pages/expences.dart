import 'package:expence_master_app/models/expence.dart';
import 'package:expence_master_app/widgets/add_new_expences.dart';
import 'package:expence_master_app/widgets/expenceList.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  //expencelist
  final List<ExpenceModel> _expenceList = [
    ExpenceModel(
        title: "Foot Ball",
        amount: 12.5,
        date: DateTime.now(),
        category: Category.leasure),
    ExpenceModel(
        title: "Carrot",
        amount: 10,
        date: DateTime.now(),
        category: Category.food),
    ExpenceModel(
        title: "Bag",
        amount: 20,
        date: DateTime.now(),
        category: Category.travel)
  ];

  //add new Expence
  void onAddNewExpence(ExpenceModel expence) {
    //store the deleting expence
    ExpenceModel deletingExpence = expence;
    //get the index og the removing expence
    final int removingIndex = _expenceList.indexOf(expence);

    setState(
      () {
        _expenceList.add(expence);
      },
    );

    //show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expence Deleted Successfully"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(
              () {
                _expenceList.insert(removingIndex, deletingExpence);
              },
            );
          },
        ),
      ),
    );
  }

  //Remove a expence
  void onDeleteExpence(ExpenceModel expence) {
    setState(() {
      _expenceList.remove(expence);
    });
  }

  //function to open a model overlay
  void _openAddExpencesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewExpences(
          onAddExpence: onAddNewExpence,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expence Master",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 77, 4, 195),
        elevation: 0,
        actions: [
          Container(
            color: Colors.yellow,
            child: IconButton(
              onPressed: _openAddExpencesOverlay,
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ExpenceList(
            expenceList: _expenceList,
            onDeleteExpence: onDeleteExpence,
          ),
        ],
      ),
    );
  }
}
