//Reference: https://www.c-sharpcorner.com/UploadFile/e14021/importing-database-in-android-studio/
package com.cantech.cannect.database;

import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class DataBase extends SQLiteOpenHelper {

    private static String DBName = "data";
    private static String DBPath = "/data/data/com.cantech.cannect/databases/";
    String path = DBPath + DBName;
    SQLiteDatabase sqLiteDatabase;
    Context context;

    public DataBase(Context context){
        super(context, DBName, null, 1);
        this.context = context;
    }

    public void openingDB() throws SQLException{
        sqLiteDatabase = SQLiteDatabase.openDatabase(path, null, SQLiteDatabase.OPEN_READWRITE);
    }

    public void copyingDB() throws IOException{
        try{

            InputStream inputStream = context.getAssets().open(DBName + ".db");
            Log.d("copyingdata", "gettingfromAssets.");
            OutputStream outputStream = new FileOutputStream(path+".db");
            byte[] buffer = new byte[1024];
            int len;
            while((len = inputStream.read(buffer)) > 0){
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush();
            outputStream.close();
            inputStream.close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public boolean checkingDB() throws SQLException{
        SQLiteDatabase database = null;
        try{
            database = SQLiteDatabase.openDatabase(path, null, SQLiteDatabase.OPEN_READONLY);

            if(database != null){
                Cursor cursor = database.rawQuery("SELECT * FROM DATA", null);
                cursor.moveToFirst();

                while(!cursor.isAfterLast()){
                    String str = "";
                    String DTC = cursor.getString(0);
                    String desc = cursor.getString(1);
                    str = str + DTC + desc;

                    cursor.moveToNext();
                }
            }else
                return false;
        }catch (SQLException e){
            e.printStackTrace();
        }
        if(database != null)
            database.close();

        return database != null ? true : false;
    }

    public void creatingDB() throws IOException{
        this.getReadableDatabase();
        try {
            copyingDB();
        }catch (IOException e){
            throw new Error("Error copying database.");
        }
    }

    @Override
    public synchronized void close() {
        if(sqLiteDatabase != null)
            sqLiteDatabase.close();
        super.close();
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {

    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {

    }
}
