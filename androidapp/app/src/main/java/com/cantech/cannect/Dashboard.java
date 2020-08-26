package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

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

    private BroadcastReceiver broadcastReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //Update Your UI here..
            String data = intent.getStringExtra("message");
            updateUI(data);
        }
    };

    public void updateUI(String data) {
        read_buffer =  (TextView)findViewById(R.id.read_buffer);
        read_buffer.setText(data);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        // for bluetooth
        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

        // from xml
        read_buffer =  (TextView)findViewById(R.id.read_buffer);
        registerReceiver(broadcastReceiver, new IntentFilter(BluetoothServices.BROADCAST_ACTION));
    }



    @Override
    protected void onStart() {
        super.onStart();

        Intent intent = new Intent(this, BluetoothServices.class);
//        intent.putExtra("bluetooth_device", deviceMacAddress);
//        startService(intent);
        intent.putExtra("bluetooth_device", deviceMacAddress);
        bindService(intent, connection, Context.BIND_AUTO_CREATE);

    }

    @Override
    protected void onStop() {
        super.onStop();
        unbindService(connection);
        mBound = false;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
//        Intent intent = new Intent(this, BluetoothServices.class);
//        stopService(intent);
        unregisterReceiver(broadcastReceiver);
    }

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
}