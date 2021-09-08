// import 'dart:async';
// import 'dart:io' as io;
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

// import '../common/config.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = new DatabaseHelper.internal();

//   factory DatabaseHelper() => _instance;

//   static Database _db;

//   Future<Database> get db async {
//     if (_db != null) return _db;

//     _db = await initDb();

//     return _db;
//   }

//   DatabaseHelper.internal();

//   initDb() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "tracker-db$DB_VERSION.db");

//     var theDb =
//         await openDatabase(path, version: DB_VERSION, onCreate: _onCreate);

//     return theDb;
//   }

//   void _onCreate(Database db, int version) async {
//     for (final table in DB_FIELDS) {
//       createTable(db, table['name'], table['fields']);
//     }
//   }

//   createTable(Database db, String name, List fields) async {
//     await db.execute("CREATE TABLE $name (${fields.join(',')})");
//   }

//   Future<int> create(dynamic model) async {
//     var dbClient = await db;
//     int id = await dbClient.insert(model.dbName, model.toMap());

//     return id;
//   }

//   Future<int> update(String dbName, Map<String, dynamic> data, int id) async {
//     var dbClient = await db;
//     int res =
//         await dbClient.update(dbName, data, where: 'id = ?', whereArgs: [id]);
//     return res;
//   }

//   Future<int> truncate(dynamic model) async {
//     var dbClient = await db;
//     int res = await dbClient.rawDelete("DELETE FROM ${model.dbName}");

//     return res;
//   }

//   Future<Map> findOne(String dbName, String condition, List args) async {
//     var dbClient = await db;
//     List<Map> maps =
//         await dbClient.query(dbName, where: condition, whereArgs: args);

//     // if (maps.length > 0) {
//     //   return maps.first;
//     // }
//     return maps.first;
//   }

//   findAll(String dbName, List<String> columns) async {
//     var dbClient = await db;
//     List<Map> maps = await dbClient.query(dbName, columns: columns);

//     return maps;
//   }

//   findOneAndUpdate(String dbName, String condition, List args,
//       Map<String, dynamic> data) async {
//     var model = await this.findOne(dbName, condition, args);

//     if (model != null) this.update(dbName, data, model['id']);
//   }

//   Future<int> execute(String query) async {
//     var dbClient = await db;
//     await dbClient.execute(query);

//     return 1;
//   }

//   clear() async {
//     var dbClient = await db;
//     for (final table in DB_FIELDS) {
//       // if(!(table['name'] == USERS_DB))
//       await dbClient.rawDelete("DELETE FROM ${table['name']}");
//     }
//   }
// }
