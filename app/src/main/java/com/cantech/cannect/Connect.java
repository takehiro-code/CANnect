package com.cantech.cannect;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.Tag;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.util.Log;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.Switch;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class Connect extends AppCompatActivity {
    //universal bluetooth serial port
    static final UUID mUUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
    //bluetooth
    BluetoothAdapter btAdapter = BluetoothAdapter.getDefaultAdapter();

    // Create a BroadcastReceiver for ACTION_FOUND.
    private final BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (BluetoothDevice.ACTION_FOUND.equals(action)) {
                // Discovery has found a device. Get the BluetoothDevice
                // object and its info from the Intent.
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                String deviceName = device.getName();
                String deviceHardwareAddress = device.getAddress(); // MAC address
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_connect);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        Switch swBt = (Switch) findViewById(R.id.bluetooth_switch);
        if (btAdapter.isEnabled()){
            swBt.setChecked(true);
        }
        swBt.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                enabledisableBT();
            }
        });

        //bluettoth
//        //create a bluetooth device for the module
//        BluetoothDevice hc05 = btAdapter.getRemoteDevice("00:21:13:02:B6:5B"/*replace the mac address of the module here*/);
//        //create socket for communication
//        BluetoothSocket btSocket = null;
//        int attempt =0;
//        do {
//            try {
//                btSocket = hc05.createRfcommSocketToServiceRecord(mUUID); //secure communication
//                //connect to HC05 server
//                btSocket.connect();
//                attempt++;
//            } catch (IOException e ){
//                e.printStackTrace();
//            }
//        }while (!btSocket.isConnected() && attempt <5);
//
//        //connection established, use stream for serial communication
//        try {
//            InputStream inputStream = btSocket.getInputStream();
//            //skip data from previous buffer
//            inputStream.skip(inputStream.available());
//            //read data
//            int numOfBytes = 10; //change 10 to correct number later
//            for(int i=0;i<numOfBytes;i++){
//                byte b = (byte) inputStream.read();
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        try {
//            btSocket.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        try{
            unregisterReceiver(mBroadcastReceiver);
        }catch (Exception e){
            // already unregistered
        }
    }


    public void enabledisableBT(){
        if(btAdapter == null){
            //device doesnt have bluetooth
        }
        if (!btAdapter.isEnabled()){
            Intent enableBTIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            int REQUEST_ENABLE_BT = 0;
            startActivityForResult(enableBTIntent, REQUEST_ENABLE_BT);

            IntentFilter BTIntent = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
            registerReceiver(mBroadcastReceiver, BTIntent);
        }
        if (btAdapter.isEnabled()) {
            btAdapter.disable();
            IntentFilter BTIntent = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
            registerReceiver(mBroadcastReceiver, BTIntent);
        }

    }
}