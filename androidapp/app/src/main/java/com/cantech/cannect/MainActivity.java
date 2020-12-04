package com.cantech.cannect;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.cardview.widget.CardView;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.widget.RelativeLayout;

// for bluetooth status
import android.bluetooth.BluetoothAdapter;
import android.widget.TextView;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.widget.Toast;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import static android.bluetooth.BluetoothProfile.GATT;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    SharedPref sharedPref;
    private TextView BTstatus;
    private TextView protocolstatus;

    static String protocol = "finding protocol...";
    //create objects for cards
    private CardView mapCard, dashboardCard, diagnosticsCard, settingsCard;
    // object for bottom bar (connect)
    private RelativeLayout connectBar;
    private BluetoothSocket mBTSocket = null; // bi-directional client-to-client data path
    //list of protocols
    ArrayList<String> protocolList = new ArrayList<>();
    static int flag = 0;


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
        setContentView(R.layout.activity_main);

        // 33 ISO 15765 CAN 500Kps // 11bits
        // 34 ISO 15765 CAN 500Kps // 29bits
        // 35 ISO 15765 CAN 250Kps // 11bits
        // 36 ISO 15765 CAN 250Kps // 29bits
        // 22 ISO 9141 - 2
        // 11 J1850 PWM
        // 12 J1850 VPW
        protocolList.addAll(Arrays.asList("33" , "34", "35", "36", "11", "12", "21", "23", "24", "25", "22"));
        //protocolstatus = findViewById(R.id.protocol_text);
        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        // Register for broadcasts on BluetoothAdapter state change
        IntentFilter filter = new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED);
        registerReceiver(mReceiver, filter);

        //define cards
        settingsCard = (CardView) findViewById(R.id.settings_card);
        diagnosticsCard = (CardView) findViewById(R.id.diagnostics_card);
        dashboardCard = (CardView) findViewById(R.id.dashboard_card);
        mapCard = (CardView) findViewById(R.id.map_card);

        //add click listener to the cards
        settingsCard.setOnClickListener(this);
        diagnosticsCard.setOnClickListener(this);
        dashboardCard.setOnClickListener(this);
        mapCard.setOnClickListener(this);
        //add onclick listener to bottom bar
        connectBar = (RelativeLayout)findViewById(R.id.connect_bar);
        //add click listener to the bar
        connectBar.setOnClickListener(this);


    }

    public void runOnce(){
        Log.d("main", "runOnce");
        final StringBuilder messages;
        Thread t = new Thread(){
            public void run(){
                int i = 0;
                Intent sendingMessageIntent = new Intent("sendingMessage");
                while(true){
                    sendingMessageIntent.putExtra("theMessage", "stp "+ protocolList.get(i)  + ">");
                    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                    Log.d("main", sendingMessageIntent.getExtras().toString());
                    i++;
                    if(i == protocolList.size()){
                        break;
                    }
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
                Log.d("main", "thread is existed");
            }
        };
        t.start();
    }
    @Override
    public void onClick(View view) {
        //will be called everytime we click a card
        Intent i;
        switch (view.getId()){
            case R.id.settings_card :
                i = new Intent(this, Settings.class);
                startActivity(i);
                break;
            case R.id.diagnostics_card :
                i = new Intent(this, Diagnostics.class);
                startActivity(i);
                break;
            case R.id.dashboard_card :
                i = new Intent(this, Dashboard.class);
                startActivity(i);
                break;
            case R.id.map_card :
                i = new Intent(this, Map.class);
                startActivity(i);
                break;
            case R.id.connect_bar :
                i = new Intent(this, Connect.class);
                startActivity(i);
                break;
            default:
                break;
        }
    }

    // below codes are all for main connection
    // Source: https://stackoverflow.com/questions/9693755/detecting-state-changes-made-to-the-bluetoothadapter
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            Log.d("inside receiver", "receiver");



            final String action = intent.getAction();
            BTstatus = (TextView)findViewById(R.id.status_text);

            if (action.equals(BluetoothAdapter.ACTION_STATE_CHANGED)) {
                final int state = intent.getIntExtra(BluetoothAdapter.EXTRA_STATE,
                        BluetoothAdapter.ERROR);
                switch (state) {
                    case BluetoothAdapter.STATE_OFF:
                        BTstatus.setText("Disconnected");
                        break;
                    case BluetoothAdapter.STATE_TURNING_OFF:
                        BTstatus.setText("Turning Bluetooth off...");
                        // close socket -- it will not clear the socket though ...
                        try {
                            mBTSocket = null;
                            mBTSocket = SocketHandler.getSocket();
                            if (mBTSocket != null && mBTSocket.isConnected()) {
                                mBTSocket.close();
                                //SystemClock.sleep(1000);
                            }
                        } catch (Throwable e) {
                            e.printStackTrace();
                            BTstatus.setText("Error!!");
                        }
                        break;
                    case BluetoothAdapter.STATE_ON:
                        //BTstatus.setText("Disconnected"); // Orginally Bluetooth ON
                        try {
                            mBTSocket = null;
                            mBTSocket = SocketHandler.getSocket();
                            if (mBTSocket == null) {
                                BTstatus.setText("Disconnected"); // Originally Bluetooth ON
                            } else {
                                if (mBTSocket.isConnected()){
                                    BTstatus.setText("Connected");
                                }

                                else {
                                    BTstatus.setText("Disconnected"); // Originally Bluetooth ON
                                }
                            }
                        }
                        catch (Throwable e) {
                            // if you get this, the code has an issue
                            e.printStackTrace();
                            BTstatus.setText("Error!!");
                        }
                        break;
                    case BluetoothAdapter.STATE_TURNING_ON:
                        BTstatus.setText("Turning Bluetooth on...");
                        break;
                }
            }
        }
    };


    // 33 ISO 15765 CAN 500Kps // 11bits
    // 34 ISO 15765 CAN 500Kps // 29bits
    // 35 ISO 15765 CAN 250Kps // 11bits
    // 36 ISO 15765 CAN 250Kps // 29bits
    // 22 ISO 9141 - 2
    // 11 J1850 PWM
    // 12 J1850 VPW

    void findProtocol(String str){
        Log.d("inside find", str);
        switch(str){
            case "33":
                protocol = "ISO 15765 CAN 500Kps/11bits" ;
                break;
            case "34":
                protocol = "ISO 15765 CAN 500Kps/29bits";
                break;
            case "35":
                protocol = "ISO 15765 CAN 500Kps/29bits";
                break;
            case "36":
                protocol = "ISO 15765 CAN 250Kps/29bits";
                break;
            case "22":
                protocol = "ISO 9141 - 2";
                break;
            case "11":
                protocol = "SAE J1850 PWM";
                break;
            case "12":
                protocol = "SAE J1850 VPW";
                break;
            default:
                protocol = "NOT FOUND!";
                break;
        }
        //protocolstatus.setText(protocol);
    }
    @Override
    public void onResume() {
        super.onResume();
        connectionStatusUpdate();
        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
        Log.d("main1", protocol);
        if(flag == 1){
            runOnce();
            flag++;
            //protocolstatus.setText(protocol);
        }


    }

    @Override
    protected void onPause() {
        super.onPause();
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        // Unregister broadcast listeners
        unregisterReceiver(mReceiver);
    }

    public void connectionStatusUpdate()
    {
        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        BTstatus = (TextView)findViewById(R.id.status_text);
        if (mBluetoothAdapter == null) {
            BTstatus.setText("Bluetooth Not Supported");
        } else if (!mBluetoothAdapter.isEnabled()) {
            BTstatus.setText("Disconnected");
        } else {
            try {
                mBTSocket = null;
                mBTSocket = SocketHandler.getSocket();
                if (mBTSocket == null) {
                    BTstatus.setText("Disconnected"); // Originally Bluetooth ON
                } else {
                    if (mBTSocket.isConnected()){
                        BTstatus.setText("Connected");
                        flag++;
                    }
                    else {
                        BTstatus.setText("Disconnected"); // Originally Bluetooth ON
                    }
                }
            }
            catch (Throwable e) {
                // if you get this, the code has an issue
                e.printStackTrace();
                BTstatus.setText("Error!!");
            }
        }
    }
}