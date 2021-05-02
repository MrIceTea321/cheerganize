import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbInitiator {
  static const String TABLE = "table";
  static const _databaseName = "vereinomat.db";

  //-----------------Table names---------------------
  static const TABLE_SJR_NAME = 'sjr' + TABLE;
  static const TABLE_CARD_NAME = 'card' + TABLE;
  static const TABLE_CATEGORY_NAME = 'category' + TABLE;
  static const TABLE_CLUB_NAME = 'club' + TABLE;
  static const TABLE_IMAGE_NAME = 'image' + TABLE;

  //-----------------SjrTable------------------------
  static const COLUMN_SJR_ID = 'sjrid';
  static const COLUMN_CITY = 'city';
  static const COLUMN_SJR_NAME = 'name';
  static const COLUMN_SJR_ADRESS = 'adress';
  static const COLUMN_SJR_PHONE = 'phonenumber';
  static const COLUMN_SJR_EMAIL = 'mail';
  static const COLUMN_SJR_URL = 'url';
  static const COLUMN_SJR_DESCRIPTION = 'description';

  //--------------ImageTable------------------------
  static const COLUMN_IMAGE_ID = 'imageid';
  static const COLUMN_IMAGE_ADRESS = 'imageadress';

  //---------------ClubTable------------------------
  static const COLUMN_CLUB_ID = 'clubid';
  static const COLUMN_CLUB_SJR_ID = 'sjrid';
  static const COLUMN_CLUB_CATEGORY_ID = 'categoryid';
  static const COLUMN_CLUB_IMAGE_ID = 'imageid';
  static const COLUMN_CLUB_NAME = "name";
  static const COLUMN_CLUB_ADRESS = 'adress';
  static const COLUMN_CLUB_PHONE = 'phonenumber';
  static const COLUMN_CLUB_EMAIL = 'mail';
  static const COLUMN_CLUB_URL = 'url';
  static const COLUMN_CLUB_DESCRIPTION = 'description';

  //---------------CategoryTable--------------------
  static const COLUMN_CATEGORY_ID = 'categoryid';
  static const COLUMN_CATEGORY_NAME = 'name';

  //---------------CardTable------------------------
  static const COLUMN_CARD_ID = 'cardid';
  static const COLUMN_CARD_IMAGE_ID = 'imageid';
  static const COLUMN_CARD_CATEGORY_ID = 'categroyid';
  static const COLUMN_CARD_SJR_ID = 'sjrid';
  static const COLUMN_CARD_CONTENT = 'content';

  //---------------DatabaseInitiatorCredentials------------------------
  DbInitiator._privateConstructor();

  static final DbInitiator instance =
      DbInitiator._privateConstructor();

  String path;

  DbInitiator._();

  static final DbInitiator db = DbInitiator._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await init();
    return _database;
  }

  init() async {
    String path = await getDatabasesPath();
    path = join(path, _databaseName);
    print("Entered path $path");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $TABLE_SJR_NAME (
            $COLUMN_SJR_ID INTEGER PRIMARY KEY,
            $COLUMN_CITY TEXT NOT NULL,
            $COLUMN_SJR_NAME TEXT NOT NULL,
            $COLUMN_SJR_ADRESS TEXT NOT NULL,
            $COLUMN_SJR_PHONE TEXT NOT NULL,
            $COLUMN_SJR_EMAIL TEXT NOT NULL,
            $COLUMN_SJR_URL TEXT NOT NULL,
            $COLUMN_SJR_DESCRIPTION TEXT NOT NULL
          )
          ''');
      await db.execute('''
          CREATE TABLE $TABLE_IMAGE_NAME (
            $COLUMN_IMAGE_ID INTEGER PRIMARY KEY,
            $COLUMN_IMAGE_ADRESS TEXT NOT NULL
          )
          ''');
      await db.execute('''
          CREATE TABLE $TABLE_CATEGORY_NAME (
            $COLUMN_CATEGORY_ID INTEGER PRIMARY KEY,
            $COLUMN_CATEGORY_NAME TEXT NOT NULL
          )
          ''');
      await db.execute('''
           CREATE TABLE $TABLE_CLUB_NAME (
            $COLUMN_CLUB_ID INTEGER PRIMARY KEY,
            $COLUMN_CLUB_SJR_ID INTEGER NOT NULL,
            $COLUMN_CLUB_CATEGORY_ID INTEGER NOT NULL,
            $COLUMN_CLUB_IMAGE_ID INTEGER NOT NULL,
            $COLUMN_CLUB_NAME TEXT NOT NULL,
            $COLUMN_CLUB_ADRESS TEXT NOT NULL,
            $COLUMN_CLUB_PHONE TEXT NOT NULL,
            $COLUMN_CLUB_EMAIL TEXT NOT NULL,
            $COLUMN_CLUB_URL TEXT NOT NULL,
            $COLUMN_CLUB_DESCRIPTION TEXT NOT NULL,
            FOREIGN KEY ($COLUMN_CLUB_SJR_ID) REFERENCES $TABLE_SJR_NAME
            ($COLUMN_SJR_ID)ON DELETE NO ACTION ON UPDATE NO ACTION,
            FOREIGN KEY ($COLUMN_CLUB_CATEGORY_ID) REFERENCES 
            $TABLE_CATEGORY_NAME($COLUMN_CATEGORY_ID)ON DELETE NO ACTION 
            ON UPDATE NO ACTION,
            FOREIGN KEY ($COLUMN_CLUB_IMAGE_ID) REFERENCES 
            $TABLE_IMAGE_NAME($COLUMN_IMAGE_ID)ON DELETE NO ACTION ON UPDATE NO ACTION
          )
          ''');
      await db.execute('''
          CREATE TABLE $TABLE_CARD_NAME (
            $COLUMN_CARD_ID INTEGER PRIMARY KEY,
            $COLUMN_CARD_SJR_ID INTEGER,
            $COLUMN_CARD_IMAGE_ID INTEGER,
            $COLUMN_CARD_CATEGORY_ID INTEGER,
            $COLUMN_CARD_CONTENT TEXT NOT NULL,
            FOREIGN KEY ($COLUMN_CARD_SJR_ID) REFERENCES $TABLE_SJR_NAME
            ($COLUMN_SJR_ID) ON DELETE NO ACTION ON UPDATE NO ACTION,
            FOREIGN KEY ($COLUMN_CARD_IMAGE_ID) REFERENCES 
            $TABLE_IMAGE_NAME($COLUMN_IMAGE_ID) ON DELETE NO ACTION ON 
            UPDATE NO ACTION,
            FOREIGN KEY ($COLUMN_CARD_CATEGORY_ID) REFERENCES 
            $TABLE_CATEGORY_NAME($COLUMN_CATEGORY_ID) ON DELETE NO 
            ACTION ON 
            UPDATE NO ACTION

          )
          ''');
    });
  }

  Future<int> insert(Map<String, dynamic> row, String tableName) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<int> delete(int id, String tableName, String tableRow) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '$tableRow = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future<int> queryRowCount(String tableName) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }


}
