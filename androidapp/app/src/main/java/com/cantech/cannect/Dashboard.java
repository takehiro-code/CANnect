package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.Bundle;

// for bluetooth
import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

import android.os.IBinder;

import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;


import java.util.ArrayList;
import java.util.Set;
import java.util.UUID;


public class Dashboard extends AppCompatActivity {

    // define member variables
    private Set<BluetoothDevice> mPairedDevices;
    private ArrayAdapter<String> mBTArrayAdapter;
    private ArrayList<String> stringArrayList;
    private TextView read_buffer;
    private ListView mDevicesListView;
    private String deviceMacAddress = "F0:08:D1:DD:30:5A";
    BluetoothServices mService;
    boolean mBound = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        // for bluetooth
        mBTArrayAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1);
        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

        // from xml
        read_buffer =  (TextView)findViewById(R.id.read_buffer);
        mDevicesListView = (ListView)findViewById(R.id.devices_list_view);
        mDevicesListView.setAdapter(mBTArrayAdapter); // assign model to view

        // step1: check if BT is on
        if (mBluetoothAdapter.isEnabled()) {
            read_buffer.setText("Bluetooth ON");
            // start discovery of device
            mBluetoothAdapter.startDiscovery();
    }

    }

    @Override
    protected void onStart() {
        super.onStart();

        Intent intent = new Intent(this, BluetoothServices.class);
        intent.putExtra("bluetooth_device", deviceMacAddress);
        startService(intent);
    }

    @Override
    protected void onStop() {
        super.onStop();
        mBound = false;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        Intent intent = new Intent(this, BluetoothServices.class);
        stopService(intent);
    }

    // this is not being called!! why?
    /** Defines callbacks for service binding, passed to bindService() */
    private ServiceConnection connection = new ServiceConnection() {

        @Override
        public void onServiceConnected(ComponentName className,
                                       IBinder service) {
            // We've bound to LocalService, cast the IBinder and get LocalService instance
            BluetoothServices.LocalBinder binder = (BluetoothServices.LocalBinder) service;
            mService = binder.getService();
            mBound = true;
        }

        @Override
        public void onServiceDisconnected(ComponentName arg0) {
            mBound = false;
        }
    };



    // after onReceive, it is not being called!! why
//    @Override
    // step2: check if device is found

//    public void onResume() {
//        super.onResume();
//
//        // step3: connect and get data
//        for (int i = 0; i < mBTArrayAdapter.getCount(); i++) {
//            if (mBTArrayAdapter.getItem(i).equals("CANnectReader")) {
//                read_buffer.setText("ESP32 Found");
//                unregisterReceiver(mReceiver);
//            }
//        }
//    }


}