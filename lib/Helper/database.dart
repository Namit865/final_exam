

import 'package:final_exam/Model/contactmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<void> initDatabase() async {
    _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'contacts.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE contacts(
            id INTEGER PRIMARY KEY,
            firstName TEXT,
            lastName TEXT,
            phoneNumber TEXT,
            email TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final db = await _database;
    await db!.insert('contacts', contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db!.query('contacts');
    return List.generate(maps.length, (i) {
      return Contact(
        firstName: maps[i]['firstName'],
        lastName: maps[i]['lastName'],
        phoneNumber: maps[i]['phoneNumber'],
        email: maps[i]['email'],
      );
    });
  }
}

