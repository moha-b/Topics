
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/dog.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase.init();

  static Database? _database;

  AppDatabase.init();

  // to see weather the database where exits or not
  // if it not then 'created'
  Future<Database> get database async{
    if(_database != null) return _database!;
    _database  = await initDB(databaseName: 'app_database.db');
    return _database!;
  }

  // create
  Future<Database> initDB({required String databaseName}) async{
    final dbPath = await getDatabasesPath();
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(dbPath,databaseName);
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db,int version) async{
    // CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
    );
  }

  // Define a function that inserts dogs into the database
  Future<void> insert(Dog dog) async {
    // Get a reference to the database.
    final db = await database;
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    // In this case, replace any previous data.
    await db.insert('dogs', dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("data has been added");
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Dog>> getData() async {
    // Get a reference to the database.
    final db = await database;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> update(Dog dog) async {
    // Get a reference to the database.
    final db = await database;
    // Update the given Dog.
    await db.update('dogs', dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> delete(int id) async {
    // Get a reference to the database.
    final db = await database;
    // Remove the Dog from the database.
    await db.delete('dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // close the database
  Future close() async{
    final db = await instance.database;
    db.close();
  }
}
