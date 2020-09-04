package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;
import android.bluetooth.BluetoothSocket;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import java.util.ArrayList;

public class Dashboard extends AppCompatActivity {
    private BluetoothSocket mBTSocket = null;
    private BTCommunication.ConnectedThread mConnectedThread;
    ArrayList<Data> dataArrayList;
    DataListAdapter adapter;
    StringBuilder messages;
    ListView listPids;
    Data FUEL_STATUS;
    Data ENGINE_COOLANT_TEMP;
    Data FUEL_PRESSURE;
    Data ENGINE_RPM;
    Data VEHICLE_SPEED;
    Data MAF_SENSOR;
    Data THROTTLE;
    Data O2_VOLTAGE;
    DataParsing dataParsing;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        listPids = (ListView)findViewById(R.id.listPids);
        messages = new StringBuilder();
        dataParsing = new DataParsing();
        //Below code is for setting up the tabular form
        //Create Data objects
        FUEL_STATUS = new Data("FUEL STATUS","0");
        ENGINE_COOLANT_TEMP = new Data("ENGINE COOLANT TEMPERATURE","0");
        FUEL_PRESSURE = new Data("FUEL PRESSURE","0");
        ENGINE_RPM = new Data("ENGINE RPM","0");
        VEHICLE_SPEED = new Data("VEHICLE SPEED","0");
        MAF_SENSOR = new Data("MAF SENSOR","0");
        THROTTLE = new Data("THROTTLE","0");
        O2_VOLTAGE = new Data("O2 VOLTAGE","0");

        dataArrayList = new ArrayList<>();
        dataArrayList.add(FUEL_STATUS);
        dataArrayList.add(ENGINE_COOLANT_TEMP);
        dataArrayList.add(FUEL_PRESSURE);
        dataArrayList.add(ENGINE_RPM);
        dataArrayList.add(VEHICLE_SPEED);
        dataArrayList.add(MAF_SENSOR);
        dataArrayList.add(THROTTLE);
        dataArrayList.add(O2_VOLTAGE);

        adapter = new DataListAdapter(this, R.layout.adapter_view_pidstable_layout, dataArrayList);
        listPids.setAdapter(adapter);

        //pass the socket into Dashboard activity -- this will cut the stream data into pieces issue
//        try {
//            mBTSocket = SocketHandler.getSocket();
//            mConnectedThread = new BTCommunication.ConnectedThread(mBTSocket, Dashboard.this);
//            mConnectedThread.start();
//        } catch (Exception e) {//dashboard opened without connecting to device
//            e.printStackTrace();
//        }


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

    //Below code is for the broadcast receiver
    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String text = intent.getStringExtra("theMessage");
            messages.append(text+"\n");
            System.out.println("inside dashboard, messages");
            System.out.println(messages);
            System.out.println("messages size");
            System.out.println(messages.length());
            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(messages.toString());
            System.out.println("parsed[0]");
            System.out.println(parsed[0]);
            System.out.println("parsed[1]");
            System.out.println(parsed[1]);
            
            switch(parsed[0])
            {
                case "FUEL_STATUS":
                    FUEL_STATUS.setValue(parsed[1]);
                    dataArrayList.set(0,FUEL_STATUS);
                    adapter.notifyDataSetChanged();
                    break;
                case "ENGINE_COOLANT_TEMP":
                    ENGINE_COOLANT_TEMP.setValue(parsed[1]);
                    dataArrayList.set(1,ENGINE_COOLANT_TEMP);
                    adapter.notifyDataSetChanged();
                    break;
                case "FUEL_PRESSURE":
                    FUEL_PRESSURE.setValue(parsed[1]);
                    dataArrayList.set(2,FUEL_PRESSURE);
                    adapter.notifyDataSetChanged();
                    break;
                case "ENGINE_RPM":
                    ENGINE_RPM.setValue(parsed[1]);
                    dataArrayList.set(3,ENGINE_RPM);
                    adapter.notifyDataSetChanged();
                    break;
                case "VEHICLE_SPEED":
                    System.out.println("here1");
                    VEHICLE_SPEED.setValue(parsed[1]);
                    System.out.println("here2");
                    dataArrayList.set(4,VEHICLE_SPEED);
                    System.out.println("here3");
                    adapter.notifyDataSetChanged();
                    System.out.println("here4");
                    break;
                case "MAF_SENSOR":
                    MAF_SENSOR.setValue(parsed[1]);
                    dataArrayList.set(5,MAF_SENSOR);
                    adapter.notifyDataSetChanged();
                    break;
                case "THROTTLE":
                    THROTTLE.setValue(parsed[1]);
                    dataArrayList.set(6,THROTTLE);
                    adapter.notifyDataSetChanged();
                    break;
                case "O2_VOLTAGE":
                    O2_VOLTAGE.setValue(parsed[1]);
                    dataArrayList.set(7,O2_VOLTAGE);
                    adapter.notifyDataSetChanged();
                    break;
                default:
                    System.out.println("default");
            }
            if (messages.length()>=38){
                messages.setLength(0);
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