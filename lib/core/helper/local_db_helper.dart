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
    String path = join(await getDatabasesPath(), 'app.db'); // اسم عام للقاعدة
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // جدول cart
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

        // جدول favourites
        await db.execute('''
          CREATE TABLE favourites(
            id INTEGER PRIMARY KEY,
            productId TEXT UNIQUE,
            title TEXT,
            price REAL,
            image TEXT
          )
        ''');
      },
    );
  }

  // ------------------- CART METHODS -------------------

  Future<void> insertCartItem(Map<String, dynamic> data) async {
    final db = await database;

    final String productId = data['productId'];

    await db.delete(
      'cart',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    await db.insert('cart', data);
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

  Future<void> deleteCartItem(String productId) async {
    final db = await database;
    await db.delete('cart', where: 'productId = ?', whereArgs: [productId]);
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart');
  }

  // ------------------- FAVOURITES METHODS -------------------

  Future<void> insertFavouriteItem(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(
      'favourites',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getFavouriteItems() async {
    final db = await database;
    return await db.query('favourites');
  }

  Future<void> deleteFavouriteItem(String productId) async {
    final db = await database;
    await db
        .delete('favourites', where: 'productId = ?', whereArgs: [productId]);
  }

  Future<void> clearFavourites() async {
    final db = await database;
    await db.delete('favourites');
  }

  Future<bool> isFavourite(String productId) async {
    final db = await database;
    final result = await db.query(
      'favourites',
      where: 'productId = ?',
      whereArgs: [productId],
    );
    return result.isNotEmpty;
  }
}
