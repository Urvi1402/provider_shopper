// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class CatalogModel {
  static List<String> itemNames = [
    'Hakka Noodles',
    'Grilled Sandwich',
    'Momos',
    'Peri Peri Fries',
    'Red Sauce Pasta',
    'Chicken 65',
    'Spaghetti',
    'Burger',
    'Cheese Chilly',
    'Veg. Manchurian',
    'Paneer Tikka Masala',
    'Fried Rice',
    'Garlic Noodles',
    'Dosa',
    'Uttapam',
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  Color color = Color.fromARGB(255, 138, 96, 110);
  final int price = 75;

  Item(this.id, this.name)
      // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.
      // List<Color>colors = [Color.fromARGB(255, 28, 78, 119), Color.fromARGB(255, 105, 97, 97)];
      // Random = random = Random();

      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
