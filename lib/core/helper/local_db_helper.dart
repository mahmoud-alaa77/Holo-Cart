import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'cart.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cart(
            id INTEGER PRIMARY KEY,
            productId TEXT,
            title TEXT,
            price REAL,
            quantity INTEGER,
            image TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertCartItem(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('cart', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await database;
    return await db.query('cart');
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    final db = await database;
    await db.update(
      'cart',
      {'quantity': quantity},
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  Future<void> deleteItem(String productId) async {
    final db = await database;
    await db.delete('cart', where: 'productId = ?', whereArgs: [productId]);
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart');
  }
}
