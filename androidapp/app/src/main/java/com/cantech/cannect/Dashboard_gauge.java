package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentTransaction;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.FrameLayout;

import com.cantech.cannect.fragment.Air_temp_fragment;
import com.cantech.cannect.fragment.Coolant_temp_fragment;
import com.cantech.cannect.fragment.Fuel_Pressure_fragment;
import com.cantech.cannect.fragment.Fuel_fragment;
import com.cantech.cannect.fragment.Fuel_type_Fragment;
import com.cantech.cannect.fragment.MAF_Fragment;
import com.cantech.cannect.fragment.RPMgauge_fragment;
import com.cantech.cannect.fragment.Speedgauge_fragment;
import com.github.anastr.speedviewlib.ProgressiveGauge;
import com.google.android.material.bottomnavigation.BottomNavigationView;

import com.github.anastr.speedviewlib.Speedometer;
import com.github.anastr.speedviewlib.TubeSpeedometer;

public class Dashboard_gauge extends AppCompatActivity implements Speedgauge_fragment.FromSpeedGauge {
    private static final String TAG = "Dashboard_gauge";
    private static final int SPEED_GAUGE = 0;
    private static final int RPM_GAUGE = 1;
    private static final int COOLANT_GAUGE = 2;
    DataParsing dataParsing;
    StringBuilder data_message;
    SharedPref sharedPref;

    TubeSpeedometer engineRPM;
    Speedometer carSpeed;
    Speedometer engineTempView;
    ProgressiveGauge fuelstatusView;

    Speedgauge_fragment speedgauge = new Speedgauge_fragment();
    RPMgauge_fragment rpmgauge = new RPMgauge_fragment();
    Coolant_temp_fragment coolantgauge = new Coolant_temp_fragment();
    Fuel_fragment fuelgauge = new Fuel_fragment();
    Fuel_Pressure_fragment fuelpressuregauge = new Fuel_Pressure_fragment();
    Air_temp_fragment airtemptextview = new Air_temp_fragment();
    MAF_Fragment maftextview = new MAF_Fragment();
    Fuel_type_Fragment fuelTypeFragment = new Fuel_type_Fragment();
    String speed;

    FrameLayout frameLayout1;
    FrameLayout frameLayout2;
    FrameLayout frameLayout3;
    FrameLayout frameLayout4;


    FragmentTransaction ft1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        sharedPref = new SharedPref(this);
        //set theme
        if(sharedPref.loadDarkModeState()==true){
            setTheme(R.style.darkTheme);
        }else{
            setTheme(R.style.AppTheme);
        }
        Log.d(TAG, "OnCreate started.");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard_gauge);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().hide();

        frameLayout1 = findViewById(R.id.gauge_container1);
        frameLayout2 = findViewById(R.id.gauge_container2);
        frameLayout3 = findViewById(R.id.gauge_container3);
        frameLayout4 = findViewById(R.id.gauge_container4);

        registerForContextMenu(frameLayout1);
        registerForContextMenu(frameLayout2);
        registerForContextMenu(frameLayout3);
        registerForContextMenu(frameLayout4);

        data_message = new StringBuilder();

        //LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));

        //initialize and assign variable
        BottomNavigationView bottomNavigationView = findViewById(R.id.bottom_navigation);
        //Set Table selected
        bottomNavigationView.setSelectedItemId(R.id.Gauge);

        ft1 = getSupportFragmentManager().beginTransaction();
        ft1.add(R.id.gauge_container1, speedgauge);
        ft1.commit();

        ft1 = getSupportFragmentManager().beginTransaction();
        ft1.add(R.id.gauge_container2, rpmgauge);
        ft1.commit();

        ft1 = getSupportFragmentManager().beginTransaction();
        ft1.add(R.id.gauge_container3, coolantgauge);
        ft1.commit();

        ft1 = getSupportFragmentManager().beginTransaction();
        ft1.add(R.id.gauge_container4, fuelgauge);
        ft1.commit();


//        ft.addToBackStack(null);
//        ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_CLOSE);


        //perform itemselectedlistener
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()) {
                    case R.id.Table:
                        startActivity(new Intent(getApplicationContext(), Dashboard.class));
                        overridePendingTransition(0, 0);
                        return true;
                    case R.id.Chart:
                        startActivity(new Intent(getApplicationContext(), Dashboard_chart.class));
                        overridePendingTransition(0, 0);
                        return true;
                    case R.id.Gauge:
                        return true;
                }
                return false;
            }
        });


    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        return false;
    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        switch (v.getId()) {
            case R.id.gauge_container1:
                getMenuInflater().inflate(R.menu.option_for_container1, menu);
                break;
            case R.id.gauge_container2:
                getMenuInflater().inflate(R.menu.option_for_container2, menu);
                break;
            case R.id.gauge_container3:
                getMenuInflater().inflate(R.menu.option_for_container3, menu);
                break;
            default:
                getMenuInflater().inflate(R.menu.option_for_container4, menu);
                break;
        }
        menu.setHeaderTitle("Select To View");

    }

    @Override
    public boolean onContextItemSelected(MenuItem item) {
        ft1 = getSupportFragmentManager().beginTransaction();
        switch (item.getItemId()) {
            case R.id.speedView_menu:
                ft1.replace(R.id.gauge_container1, speedgauge);
                ft1.commit();
                return true;

            case R.id.fuelpressure_menu:
                ft1.replace(R.id.gauge_container1, fuelpressuregauge);
                ft1.commit();
                return true;

            case R.id.RPMView_menu:
                ft1.replace(R.id.gauge_container2, rpmgauge);
                ft1.commit();
                return true;

            case R.id.TEMPView_menu:
                ft1.replace(R.id.gauge_container3, coolantgauge);
                ft1.commit();
                return true;

            case R.id.IntakAirTemp_menu:
                ft1.replace(R.id.gauge_container2, airtemptextview);
                ft1.commit();
                return true;

            case R.id.MAF_menu:
                ft1.replace(R.id.gauge_container4, maftextview);
                ft1.commit();
                return true;

            case R.id.Fuel_type_menu:
                ft1.replace(R.id.gauge_container3, fuelTypeFragment);
                ft1.commit();
                return true;

            case R.id.Fuel_levle_menu:
                ft1.replace(R.id.gauge_container4, fuelgauge);
                ft1.commit();
                return true;

            default:
                return super.onContextItemSelected(item);
        }
    }

    @Override
    public void sendSpeedPID(String string) {
        speed = string;
    }

//
//    BroadcastReceiver mReceiver = new BroadcastReceiver() {
//        @Override
//        public void onReceive(Context context, Intent intent) {
//            //needs to be modified, received value is a string. also add multiple datasets
//            String text = intent.getStringExtra("theMessage");
//            data_message.append(text + "\n");
//            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(data_message.toString());
//
//
//        }
//    };

    // called whenever Dashboard visited
    @Override
    protected void onStart() {
        super.onStart();
        //register broadcast receiver
//        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
 //sending data example; send data whenever you visit dashboard
        Intent sendingMessageIntent = new Intent("sendingMessage");
        sendingMessageIntent.putExtra("theMessage", speed);
        LocalBroadcastManager.getInstance(this).sendBroadcast(sendingMessageIntent);
    }

    @Override
    protected void onPause() {
        super.onPause();
//        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }

    @Override
    protected void onResume() {
        super.onResume();
//        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
    }

    // called whenever Dashboard leaves
    @Override
    protected void onStop() {
        super.onStop();
//        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }
}


