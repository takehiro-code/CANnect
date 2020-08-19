package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;
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
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;

import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Set;
import java.util.UUID;

// added library to resolve "Cannot Resolve Symbol" Error
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.core.app.ActivityCompat;

import android.content.IntentFilter;


public class Dashboard extends AppCompatActivity {

    // define member variables
//    private Set<BluetoothDevice> mPairedDevices;
//    private ArrayAdapter<String> mBTArrayAdapter;
    private ArrayList<String> stringArrayList = new ArrayList<String>(); // not sure if you are going to use this
    private TextView read_buffer;

    // define broadcast receiver
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            // some code here
            String action = intent.getAction();
            if(BluetoothDevice.ACTION_FOUND.equals(action)){
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                // add the name to the list
                //mBTArrayAdapter.add(device.getName());
                Log.d("mytag",device.getName());
                if (device.getName().equals("ESP32test")) {

                    stringArrayList.add(device.getName());
//                    mBTArrayAdapter.add(device.getName());
//                    mBTArrayAdapter.notifyDataSetChanged();
                }
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        // step1: check if BT is on
        read_buffer =  (TextView)findViewById(R.id.read_buffer);
        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mBluetoothAdapter.isEnabled()) {
            read_buffer.setText("Bluetooth ON");

            // step2: check if device is found

            // start discovery of device
            mBluetoothAdapter.startDiscovery();

            //register a broadcast receiver
            IntentFilter intentFilter= new IntentFilter(BluetoothDevice.ACTION_FOUND);
            registerReceiver(mReceiver, intentFilter);

            // step3: connect and get data
            if (stringArrayList.size() > 0) {
                read_buffer.setText("ESP32 Found");
            }

        }

    }


}