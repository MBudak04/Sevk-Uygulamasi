import 'package:neden_sevk_application/core/models/sevkler_db_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper.internal();
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  static DatabaseHelper get instance => _instance;
  static Database? _db;

  Future<Database> get db async {
    _db = await initDatabase();
    _db ??= await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sevk_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE sevkler(id INTEGER PRIMARY KEY, sevkEdenPersonel TEXT, sevkEdenFirma TEXT, teslimAlanPersonel TEXT, teslimAlanFirma TEXT, islem TEXT, eIrsaliye TEXT, sevkEdenPersonelID INTEGER, sevkEdenFirmaID INTEGER, teslimAlanPersonelID INTEGER, teslimAlanFirmaID INTEGER, islemID INTEGER, cuvallarID TEXT)',
    );
  }

  Future<SevklerDB> insertSevkler(SevklerDB sevklerDB) async {
   final database = await instance.db;
   sevklerDB.id = await database.insert("sevkler", sevklerDB.toMap());
    return sevklerDB;
  }
}
