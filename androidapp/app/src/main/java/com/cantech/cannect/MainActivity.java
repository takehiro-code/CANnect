package com.cantech.cannect;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.RelativeLayout;

// for bluetooth status
import android.bluetooth.BluetoothAdapter;
import android.widget.TextView;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    SharedPref sharedPref;
    private TextView BTstatus;

    //create objects for cards
    private CardView mapCard, dashboardCard, diagnosticsCard, settingsCard;
    // object for bottom bar (connect)
    private RelativeLayout connectBar;
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

        connectionStatusUpdate();

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

    // Source: https://stackoverflow.com/questions/9693755/detecting-state-changes-made-to-the-bluetoothadapter
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
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
                        break;
                    case BluetoothAdapter.STATE_ON:
                        BTstatus.setText("Connected");
                        break;
                    case BluetoothAdapter.STATE_TURNING_ON:
                        BTstatus.setText("Turning Bluetooth on...");
                        break;
                }
            }
        }
    };

    @Override
    public void onResume() {
        super.onResume();
        connectionStatusUpdate();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        // Unregister broadcast listeners
        unregisterReceiver(mReceiver);
    }

    public void connectionStatusUpdate ()
    {
        BTstatus = (TextView)findViewById(R.id.status_text);
        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mBluetoothAdapter == null) {
            BTstatus.setText("Bluetooth Not Supported");
        } else if (!mBluetoothAdapter.isEnabled()) {
            BTstatus.setText("Disconnected");
        } else {
            BTstatus.setText("Connected");
        }
    }

}

//added comments to test