package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentTransaction;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.FrameLayout;

import com.cantech.cannect.fragment.Absolute_Load_Fragment;
import com.cantech.cannect.fragment.Actual_Engine_Torque_Fragment;
import com.cantech.cannect.fragment.Air_temp_fragment;
import com.cantech.cannect.fragment.Calculate_Engine_Load_Fragment;
import com.cantech.cannect.fragment.Coolant_temp_fragment;
import com.cantech.cannect.fragment.Demand_Engine_Torque_Fragment;
import com.cantech.cannect.fragment.Fuel_Pressure_fragment;
import com.cantech.cannect.fragment.Fuel_fragment;
import com.cantech.cannect.fragment.Fuel_type_Fragment;
import com.cantech.cannect.fragment.MAF_Fragment;
import com.cantech.cannect.fragment.RPMgauge_fragment;
import com.cantech.cannect.fragment.Speedgauge_fragment;
import com.cantech.cannect.fragment.Throttle_Fragment;
import com.google.android.material.bottomnavigation.BottomNavigationView;


public class Dashboard_gauge extends AppCompatActivity implements Speedgauge_fragment.FromSpeedGauge, MAF_Fragment.FromMAFGauge, Fuel_fragment.FromFuelLevelGauge, Actual_Engine_Torque_Fragment.FromActualTorque,
                                                                RPMgauge_fragment.FromRPMGauge, Air_temp_fragment.FromAirTempGauge, Coolant_temp_fragment.FromCoolantTempGauge,
                                                                Throttle_Fragment.FromThrottleGauge, Fuel_type_Fragment.FromFuelTypeGauge, Fuel_Pressure_fragment.FromFuelPressureGauge,
                                                                Demand_Engine_Torque_Fragment.FromDemandTorque, Absolute_Load_Fragment.FromAbsLoad, Calculate_Engine_Load_Fragment.FromEngineLoad{
    private static final String TAG = "Dashboard_gauge";
    DataParsing dataParsing;
    StringBuilder data_message;
    SharedPref sharedPref;

    Speedgauge_fragment speedgauge = new Speedgauge_fragment();
    RPMgauge_fragment rpmgauge = new RPMgauge_fragment();
    Coolant_temp_fragment coolantgauge = new Coolant_temp_fragment();
    Fuel_fragment fuelgauge = new Fuel_fragment();
    Fuel_Pressure_fragment fuelpressuregauge = new Fuel_Pressure_fragment();
    Air_temp_fragment airtemptextview = new Air_temp_fragment();
    MAF_Fragment maftextview = new MAF_Fragment();
    Fuel_type_Fragment fuelTypeFragment = new Fuel_type_Fragment();
    Throttle_Fragment throttle_fragment = new Throttle_Fragment();
    Calculate_Engine_Load_Fragment calELoad_fragment = new Calculate_Engine_Load_Fragment();
    Absolute_Load_Fragment absLoad_fragment = new Absolute_Load_Fragment();
    Demand_Engine_Torque_Fragment demandETorque_fragment = new Demand_Engine_Torque_Fragment();
    Actual_Engine_Torque_Fragment actualETorque_fragment = new Actual_Engine_Torque_Fragment();

    //speed 0, fuelpressure 1, throttle 2, rpm 3, airtemp 4
    //coolant 5, fueltype 6, fuellevel 7, maf 8, calELoad 9
    //absLoad 10, demandETorque 11, actualETorque 12
    private String[] str = new String[13];


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

        frameLayout1 = findViewById(R.id.gauge_container1);
        frameLayout2 = findViewById(R.id.gauge_container2);
        frameLayout3 = findViewById(R.id.gauge_container3);
        frameLayout4 = findViewById(R.id.gauge_container4);

        registerForContextMenu(frameLayout1);
        registerForContextMenu(frameLayout2);
        registerForContextMenu(frameLayout3);
        registerForContextMenu(frameLayout4);

        data_message = new StringBuilder();

        for(int i = 0; i < str.length; i++){
            str[i] = "";
        }
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
        Intent sendingMessageIntent = new Intent("sendingMessage");
        switch (item.getItemId()) {
            case R.id.speedView_menu:
                ft1.replace(R.id.gauge_container1, speedgauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 0);
                return true;

            case R.id.fuelpressure_menu:
                ft1.replace(R.id.gauge_container1, fuelpressuregauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 1);
                return true;

            case R.id.RPMView_menu:
                ft1.replace(R.id.gauge_container2, rpmgauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 3);
                return true;

            case R.id.TEMPView_menu:
                ft1.replace(R.id.gauge_container3, coolantgauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 5);
                return true;

            case R.id.IntakAirTemp_menu:
                ft1.replace(R.id.gauge_container2, airtemptextview);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 4);
                return true;

            case R.id.MAF_menu:
                ft1.replace(R.id.gauge_container4, maftextview);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 8);
                return true;

            case R.id.Fuel_type_menu:
                ft1.replace(R.id.gauge_container3, fuelTypeFragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 6);
                return true;

            case R.id.Fuel_levle_menu:
                ft1.replace(R.id.gauge_container4, fuelgauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 7);
                return true;

            case R.id.throttle_menu:
                ft1.replace(R.id.gauge_container1, throttle_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 2);
                return true;

            case R.id.CalELoad_menu:
                ft1.replace(R.id.gauge_container3, calELoad_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 9);
                return true;

            case R.id.AbsLoad_menu:
                ft1.replace(R.id.gauge_container3, absLoad_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 10);
                return true;

            case R.id.DemandTorque_menu:
                ft1.replace(R.id.gauge_container4, demandETorque_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 11);
                return true;

            case R.id.ActualTorque_menu:
                ft1.replace(R.id.gauge_container4, actualETorque_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 12);
                return true;
            default:
                return super.onContextItemSelected(item);
        }
    }

    private void sendingPID2BT(Intent sendingMessageIntent, int i) {
        sendingMessageIntent.putExtra("theMessage", str[i]);
        Log.d("dtc", str[i]);
        LocalBroadcastManager.getInstance(this).sendBroadcast(sendingMessageIntent);
        str[i] = "";
    }

    @Override
    public void sendSpeedPID(String string) { str[0] = string;}

    @Override
    public void sendFuelPressurePID(String string) { str[1] = string;}

    @Override
    public void sendThrottlePID(String string) { str[2] = string;}

    @Override
    public void sendRPMPID(String string) { str[3] = string;}

    @Override
    public void sendAirTempPID(String string) { str[4] = string;}

    @Override
    public void sendCoolantTempPID(String string) { str[5] = string;}

    @Override
    public void sendFuelTypePID(String string) { str[6] = string;}

    @Override
    public void sendFuelLevelPID(String string) { str[7] = string;}

    @Override
    public void sendMAFPID(String string) { str[8] = string;}

    @Override
    public void sendCalculatedEngineLoadPID(String string) { str[9] = string;}

    @Override
    public void sendAbsoluteLoadPID(String string) { str[10] = string;}

    @Override
    public void sendDemandETorquePID(String string) { str[11] = string;}

    @Override
    public void sendActualETorquePID(String string) { str[12] = string;}
}


