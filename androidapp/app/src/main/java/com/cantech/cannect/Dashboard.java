package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;
import android.bluetooth.BluetoothSocket;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import java.util.ArrayList;

public class Dashboard extends AppCompatActivity {
    SharedPref sharedPref;
    private BluetoothSocket mBTSocket = null;
    private BTCommunication.ConnectedThread mConnectedThread;
    ArrayList<Data> dataArrayList;
    DataListAdapter adapter;
    String messages;
    ListView listPids;
    Data FUEL_STATUS;
    Data ENGINE_COOLANT_TEMP;
    Data FUEL_PRESSURE;
    Data ENGINE_RPM;
    Data VEHICLE_SPEED;
    Data MAF_SENSOR;
    Data THROTTLE;
    Data O2_VOLTAGE;
    Data newData;
    DataParsing dataParsing;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        //load saved theme state
        sharedPref = new SharedPref(this);
        //set theme
        if(sharedPref.loadDarkModeState()==true){
            setTheme(R.style.darkTheme);
        }else{
            setTheme(R.style.AppTheme);
        }
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        listPids = (ListView)findViewById(R.id.listPids);
        messages = "";//new StringBuilder();
        dataParsing = new DataParsing();
        //Below code is for setting up the tabular form
        //Create Data objects
        //FUEL_STATUS = new Data("FUEL STATUS","0");
        //ENGINE_COOLANT_TEMP = new Data("ENGINE COOLANT TEMPERATURE","0");
        //FUEL_PRESSURE = new Data("FUEL PRESSURE","0");
        //ENGINE_RPM = new Data("ENGINE RPM","0");
        //VEHICLE_SPEED = new Data("VEHICLE SPEED","0");
        //MAF_SENSOR = new Data("MAF SENSOR","0");
        //THROTTLE = new Data("THROTTLE","0");
        //O2_VOLTAGE = new Data("O2 VOLTAGE","0");

        dataArrayList = new ArrayList<>();
        //dataArrayList.add(FUEL_STATUS);
        //dataArrayList.add(ENGINE_COOLANT_TEMP);
        //dataArrayList.add(FUEL_PRESSURE);
        //dataArrayList.add(ENGINE_RPM);
        //dataArrayList.add(VEHICLE_SPEED);
        //dataArrayList.add(MAF_SENSOR);
        //dataArrayList.add(THROTTLE);
        //dataArrayList.add(O2_VOLTAGE);

        //get saved pids in settings
        SharedPreferences PrefPids = getSharedPreferences("checked_pids_list",Context.MODE_PRIVATE);
        String PrefPidss = PrefPids.getString("pids","");
        String[] checkedPids = PrefPidss.split(",");
        for (int i=0; i<checkedPids.length;i++){
            System.out.println("pid is");
            System.out.println(checkedPids[i]);
            newData = new Data(checkedPids[i],"0");
            dataArrayList.add(newData);
        }

        adapter = new DataListAdapter(this, R.layout.adapter_view_pidstable_layout, dataArrayList);
        listPids.setAdapter(adapter);

        //pass the socket into Dashboard activity
        //try {
        //    mBTSocket = SocketHandler.getSocket();
        //    mConnectedThread = new BTCommunication.ConnectedThread(mBTSocket, Dashboard.this);
        //    mConnectedThread.start();
        //} catch (Exception e) {//dashboard opened without connecting to device
        //    e.printStackTrace();
        //}

        //Below code is for page navigation
        //initialize and assign variable
        BottomNavigationView bottomNavigationView = findViewById(R.id.bottom_navigation);

        //Set Table selected
        bottomNavigationView.setSelectedItemId(R.id.Table);

        //perform itemselectedlistener
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.Table:
                        return true;
                    case R.id.Chart:
                        startActivity(new Intent(getApplicationContext(),Dashboard_chart.class));
                        overridePendingTransition(0,0);
                        return true;
                    case R.id.Gauge:
                        startActivity(new Intent(getApplicationContext(),Dashboard_gauge.class));
                        overridePendingTransition(0,0);
                        return true;
                }
                return false;
            }
        });

    }

    //Below code is for updating the table

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String text = intent.getStringExtra("theMessage");
            messages+=text; //.append(text+"\n");
            System.out.println("inside dashboard, messages");
            System.out.println(messages);
            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(messages.substring(0, messages.length() - 10));//remove  \n255255\r\n and then parse
            System.out.println("messages");
            System.out.println(messages);
            System.out.println("substring2");
            System.out.println(messages.substring(0, messages.length() - 10));
            System.out.println("parsed[0]");
            System.out.println(parsed[0]);
            System.out.println("parsed[1]");
            System.out.println(parsed[1]);
            
            switch(parsed[0])
            {
                case "FUEL STATUS":
                    newData = new Data("FUEL STATUS",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("FUEL STATUS")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "ENGINE COOLANT TEMP":
                    newData = new Data("ENGINE COOLANT TEMP",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("ENGINE COOLANT TEMP")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "FUEL PRESSURE":
                    newData = new Data("FUEL PRESSURE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("FUEL PRESSURE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "ENGINE RPM":
                    newData = new Data("ENGINE RPM",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("ENGINE RPM")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "VEHICLE SPEED":
                    newData = new Data("VEHICLE SPEED",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("VEHICLE SPEED")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "MAF SENSOR":
                    newData = new Data("MAF SENSOR",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("MAF SENSOR")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "THROTTLE":
                    newData = new Data("THROTTLE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("THROTTLE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "O2 VOLTAGE":
                    newData = new Data("O2 VOLTAGE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("O2 VOLTAGE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                default:
                    System.out.println("default");
            }
            if (messages.contains("FF") || messages.contains("255255")){//(messages.length()>=28){
                //Toast.makeText(Dashboard.this, messages, Toast.LENGTH_LONG).show();
                System.out.println("the end");
                System.out.println(messages);
                //messages.setLength(0);
                //messages = new StringBuilder();
                messages="";
                System.out.println("the beginnig");
                System.out.println(messages);
            }
        }
    };

    // called only when you go back to main activity, but will called the number of times onCreate called
    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    // called whenever Dashboard visited
    @Override
    protected void onStart() {
        super.onStart();
        //register broadcast receiver
        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));

        // sending data example; send data whenever you visit dashboard
//        String writeMsg = "hello from dashboard";
//        Intent sendingMessageIntent = new Intent("sendingMessage");
//        sendingMessageIntent.putExtra("theMessage", writeMsg);
//        LocalBroadcastManager.getInstance(this).sendBroadcast(sendingMessageIntent);
    }

    // called whenever Dashboard leaves
    @Override
    protected void onStop() {
        super.onStop();
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }

    // don't worry about this lifecycle
//    @Override
//    protected void onResume() {
//        super.onResume();
//    }
//
//    @Override
//    protected void onPause() {
//        super.onPause();
//    }
}