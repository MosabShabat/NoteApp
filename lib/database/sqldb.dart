import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqldb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mosab.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 4, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('onUpgrade ===================');
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
CREATE TABLE "notes"(
  "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
  "title" TEXT nOT NULL,
  "note" TEXT NOT NULL,
  "color" TEXT NOT NULL
)
''');

    await batch.commit();
    print('onCreate ===================');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> respons = await mydb!.rawQuery(sql);
    return respons;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int respons = await mydb!.rawInsert(sql);
    return respons;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int respons = await mydb!.rawUpdate(sql);
    return respons;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int respons = await mydb!.rawDelete(sql);
    return respons;
  }

  mydeleteDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mosab.db');
    await deleteDatabase(path);
  }

  read(String table) async {
    Database? mydb = await db;
    List<Map> respons = await mydb!.query(table);
    return respons;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int respons = await mydb!.insert(table, values);
    return respons;
  }

  update(String table, Map<String, Object?> values, String? mywhere) async {
    Database? mydb = await db;
    int respons = await mydb!.update(table, values, where: mywhere);
    return respons;
  }

  delete(String table, String? mywhere) async {
    Database? mydb = await db;
    int respons = await mydb!.delete(table, where: mywhere);
    return respons;
  }
}
