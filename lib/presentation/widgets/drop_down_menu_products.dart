import 'dart:collection';

import 'package:flutter/material.dart';

const List<String> list = ["Andamio", "Plataforma", "Escalera"];

class DropDownMenuProducts extends StatefulWidget {
  const DropDownMenuProducts({super.key});

  @override
  State<DropDownMenuProducts> createState() => _DropDownMenuProductsState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DropDownMenuProductsState extends State<DropDownMenuProducts> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );

  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: DropdownMenu<String>(
        width: 250,
        hintText: "Seleccione el producto",
        label: const Text("Seleccione el producto"),
        initialSelection: list.first,
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries: menuEntries,
      ),
    );
  }
}
