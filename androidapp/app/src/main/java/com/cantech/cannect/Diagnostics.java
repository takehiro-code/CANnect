//Reference: https://stackoverflow.com/a/27781046
package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import com.cantech.cannect.database.DataBase;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Diagnostics extends AppCompatActivity {
    SharedPref sharedPref;
    DataBase dataBase;
    final Context context = this;
    private static String DBName = "data.db";
    ListView dtclv;
    SQLiteDatabase sqLiteDatabase;
    DTCArrayAdapter arrayAdapterDTC;
    String dtc = "";
    ArrayList<String> codes = new ArrayList<>();
    ArrayList<String> arrayListDTC;
    boolean noData = false;

    @SuppressLint("WrongConstant")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        //load saved theme state
        sharedPref = new SharedPref(this);
        //set theme
        if (sharedPref.loadDarkModeState() == true) {
            setTheme(R.style.darkTheme);
        } else {
            setTheme(R.style.AppTheme);
        }
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_diagnostics);

        getSupportActionBar().setTitle("Diagnostics");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        dtclv = findViewById(R.id.lvDiagnostics);
        dataBase = new DataBase(context);

        try {
            dataBase.creatingDB();
        } catch (IOException e) {
            throw new Error("Database not created.");
        }

        dataBase.openingDB();

        arrayListDTC = new ArrayList<>();
        arrayAdapterDTC = new DTCArrayAdapter(this, R.layout.adapter_view_dtc, arrayListDTC);
        dtclv.setAdapter(arrayAdapterDTC);
        sqLiteDatabase = openOrCreateDatabase("data.db", SQLiteDatabase.CREATE_IF_NECESSARY, null);

        arrayAdapterDTC.notifyDataSetChanged();
        Intent sendingMessageIntent = new Intent("sendingMessage");
        sendingMessageIntent.putExtra("theMessage", "03 >");
        LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
    }


    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String text = intent.getStringExtra("theMessage");
            noData = false;
            text = text.substring(0, 5);  //getting rid off 255255;
            if (text.charAt(0) == 'P' || text.charAt(0) == 'C' || text.charAt(0) == 'B' || text.charAt(0) == 'U') {
                Log.d("Received", text);
                if (!text.equals("P0000")) {
                    dtc = text;
                    displayDTC();
                    arrayAdapterDTC.notifyDataSetChanged();
                }
            }
            dtc = "";
        }
    };

    @Override
    public void onPause() {
        super.onPause();
        LocalBroadcastManager.getInstance(context).unregisterReceiver(mReceiver);
        Intent sendingMessageIntent = new Intent("sendingMessage");
        sendingMessageIntent.putExtra("theMessage", "03 >");
        LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
    }

    @Override
    public void onResume() {
        super.onResume();
         LocalBroadcastManager.getInstance(context).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
    }


    public void displayDTC() {
        String[] str = {dtc};
        String query = "select * from DTCdata_Sheet1 where DTC == ?";
        Cursor cursor = sqLiteDatabase.rawQuery(query, str);
        if (cursor != null) {
            cursor.moveToFirst();
            while (!cursor.isAfterLast()) {
                String temp = "";
                String field1 = cursor.getString(0);
                String field2 = cursor.getString(1);
                temp = temp + "\nDTC:\t" + field1 + "\nDescription:\t" + field2;
                arrayListDTC.add(temp);
                cursor.moveToNext();
            }
            cursor.close();
        }
    }

}
