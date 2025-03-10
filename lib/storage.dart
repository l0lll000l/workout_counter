
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
    String path = join(await getDatabasesPath(), 'counter.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE counter(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT UNIQUE, pushcount1 INTEGER ,pushcount2 INTEGER ,pushcount3 INTEGER ,pullcount1 INTEGER ,pullcount2 INTEGER ,pullcount3 INTEGER)",
        );
      },
    );
  }

  Future<int> getTodayCount(var count) async {
    final db = await database;
    String today = DateTime.now().toIso8601String().split('T')[0];
    var res = await db.query('counter', where: "date = ?", whereArgs: [today]);

    return (res.isNotEmpty ? res.first[count.toString()] as int? : null) ?? 0;
  }

  Future<int> getMaxPastCount(String count) async {
    final db = await database;
    var res = await db.rawQuery("SELECT MAX($count) as maxCount FROM counter");

    return res.isNotEmpty && res.first['maxCount'] != null
        ? res.first['maxCount'] as int
        : 0;
  }

  Future<int> getTotalPushCount() async {
    final db = await database;
    var res = await db.rawQuery(
      "SELECT SUM(pushcount1 + pushcount2 + pushcount3) as totalPush FROM counter",
    );

    return res.isNotEmpty && res.first['totalPush'] != null
        ? res.first['totalPush'] as int
        : 0;
  }

  Future<int> getTotalPullCount() async {
    final db = await database;
    var res = await db.rawQuery(
      "SELECT SUM(pullcount1 + pullcount2 + pullcount3) as totalPull FROM counter",
    );

    return res.isNotEmpty && res.first['totalPull'] != null
        ? res.first['totalPull'] as int
        : 0;
  }

  Future<void> updateCount({
    required int pushcount1,
    required int pushcount2,
    required int pushcount3,
    required int pullcount1,
    required int pullcount2,
    required int pullcount3,
  }) async {
    final db = await database;
    String today = DateTime.now().toIso8601String().split('T')[0];
    await db.insert('counter', {
      'date': today,
      'pushcount1': pushcount1,
      'pushcount2': pushcount2,
      'pushcount3': pushcount3,
      'pullcount1': pullcount1,
      'pullcount2': pullcount2,
      'pullcount3': pullcount3,
    }, conflictAlgorithm: ConflictAlgorithm.replace);

  }

  // Future<void> printDatabase() async {
  //   final db = await database;
  //   List<Map<String, dynamic>> records = await db.query('counter');

  //   if (records.isEmpty) {
  //     print('Database is empty.');
  //   } else {
  //     for (var record in records) {
  //       log(
  //         'ID: ${record['id']}, Date: ${record['date']}, Count: ${record['pushcount1']} ${record['pushcount2']} ${record['pushcount3']} ${record['pullcount1']} ${record['pullcount2']} ${record['pullcount3']}',
  //       );
  //     }
  //   }
  // }
}
