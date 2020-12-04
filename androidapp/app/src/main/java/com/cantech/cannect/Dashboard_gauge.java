package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
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
import com.cantech.cannect.fragment.Distance_travelled_since_cleared_fragment;
import com.cantech.cannect.fragment.Engine_fuel_rate_fragment;
import com.cantech.cannect.fragment.Engine_oil_temp_fragment;
import com.cantech.cannect.fragment.Fuel_Pressure_fragment;
import com.cantech.cannect.fragment.Fuel_fragment;
import com.cantech.cannect.fragment.Fuel_type_Fragment;
import com.cantech.cannect.fragment.Intake_air_temp_fragment;
import com.cantech.cannect.fragment.MAF_Fragment;
import com.cantech.cannect.fragment.RPMgauge_fragment;
import com.cantech.cannect.fragment.Speedgauge_fragment;
import com.cantech.cannect.fragment.Throttle_Fragment;
import com.cantech.cannect.fragment.Time_run_with_mil_on_fragment;
import com.cantech.cannect.fragment.Time_since_engine_started_fragment;
import com.cantech.cannect.fragment.Warmups_since_cleared_fragment;
import com.google.android.material.bottomnavigation.BottomNavigationView;


public class Dashboard_gauge extends AppCompatActivity implements Speedgauge_fragment.FromSpeedGauge, MAF_Fragment.FromMAFGauge, Fuel_fragment.FromFuelLevelGauge, Actual_Engine_Torque_Fragment.FromActualTorque,
                                                                RPMgauge_fragment.FromRPMGauge, Air_temp_fragment.FromAirTempGauge, Coolant_temp_fragment.FromCoolantTempGauge,
                                                                Throttle_Fragment.FromThrottleGauge, Fuel_type_Fragment.FromFuelTypeGauge, Fuel_Pressure_fragment.FromFuelPressureGauge,
                                                                Demand_Engine_Torque_Fragment.FromDemandTorque, Absolute_Load_Fragment.FromAbsLoad, Calculate_Engine_Load_Fragment.FromEngineLoad{
    private static final String TAG = "Dashboard_gauge";
    DataParsing dataParsing;
    StringBuilder data_message;
    SharedPref sharedPref;
    private boolean[] flagArray = {false, false, false, false};

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
    Distance_travelled_since_cleared_fragment distanceTravelled_fragment = new Distance_travelled_since_cleared_fragment();
    Warmups_since_cleared_fragment warmups_since_cleared_fragment = new Warmups_since_cleared_fragment();
    Time_run_with_mil_on_fragment mil_on_fragment = new Time_run_with_mil_on_fragment();
    Time_since_engine_started_fragment engine_started_fragment = new Time_since_engine_started_fragment();
    Intake_air_temp_fragment intake_air_temp_fragment = new Intake_air_temp_fragment();
    Engine_fuel_rate_fragment fuel_rate_fragment = new Engine_fuel_rate_fragment();
    Engine_oil_temp_fragment oil_temp_fragment = new Engine_oil_temp_fragment();
    //speed 0, fuelpressure 1, throttle 2, rpm 3, airtemp 4
    //coolant 5, fueltype 6, fuellevel 7, maf 8, calELoad 9
    //absLoad 10, demandETorque 11, actualETorque 12, distanceTravelled 13
    //warmups 14, mil 15, engineStarted 16, intake 17
    //fuel rate 18, oil temp 19
    private String[] PIDS = {"0D ", "0A ", "11 ", "0C ", "46 ", "05 ", "03 ", "2F ", "10 ", "04 ", "43 ", "61 ", "62 ",
            "31 ", "30 ", "4D ", "1F ", "0F ", "5E ", "5C "};
    private String[] initialPIDs = {"0D ", "0C ", "05 ", "2F "};

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
        if(sharedPref.loadDarkModeState()){
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

        for(int i = 0; i < 4; i++){
            final int finalI = i;
            Thread t = new Thread(new Runnable() {
                @Override
                public void run() {
                    Intent sendingMessageIntent = new Intent("sendingMessage");
                    while(true){
                        if(flagArray[finalI]) {
                            flagArray[finalI] = false;
                            break;
                        }
                        sendingMessageIntent.putExtra("theMessage", "01 " + initialPIDs[finalI] + ">");
                        LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                        try {
                            Thread.sleep(1500);
                        } catch (InterruptedException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                        Log.d("BT", initialPIDs[finalI]);
                }
            }
        });
            t.start();
        }

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
                    case R.id.DOF:
                        startActivity(new Intent(getApplicationContext(),FrictionCircle.class));
                        overridePendingTransition(0,0);
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
                break;

            case R.id.fuelpressure_menu:
                ft1.replace(R.id.gauge_container1, fuelpressuregauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 1);
                break;

            case R.id.RPMView_menu:
                ft1.replace(R.id.gauge_container2, rpmgauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 3);
                break;

            case R.id.TEMPView_menu:
                ft1.replace(R.id.gauge_container3, coolantgauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 5);
                break;

            case R.id.AmbientAirTemp_menu:
                ft1.replace(R.id.gauge_container2, airtemptextview);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 4);
                break;

            case R.id.MAF_menu:
                ft1.replace(R.id.gauge_container2, maftextview);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 8);
                break;

            case R.id.Fuel_type_menu:
                ft1.replace(R.id.gauge_container3, fuelTypeFragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 6);
                break;

            case R.id.Fuel_levle_menu:
                ft1.replace(R.id.gauge_container4, fuelgauge);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 7);
                break;

            case R.id.throttle_menu:
                ft1.replace(R.id.gauge_container3, throttle_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 2);
                break;

            case R.id.CalELoad_menu:
                ft1.replace(R.id.gauge_container4, calELoad_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 9);
                break;

//            case R.id.AbsLoad_menu:
//                ft1.replace(R.id.gauge_container4, absLoad_fragment);
//                ft1.commit();
//                sendingPID2BT(sendingMessageIntent, 10);
//                break;

            case R.id.DemandTorque_menu:
                ft1.replace(R.id.gauge_container4, demandETorque_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 11);
                break;

            case R.id.ActualTorque_menu:
                ft1.replace(R.id.gauge_container4, actualETorque_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 12);
                break;

            case R.id.distance_travelled_since_code_cleared_menu:
                ft1.replace(R.id.gauge_container1, distanceTravelled_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 13);
                break;

            case R.id.warnup_since_code_cleared_menu:
                ft1.replace(R.id.gauge_container1, warmups_since_cleared_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 14);
                break;

            case R.id.time_run_with_MIL_on_menu:
                ft1.replace(R.id.gauge_container1,mil_on_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 15);
                break;

            case R.id.runtime_since_engine_start_menu:
                ft1.replace(R.id.gauge_container2,engine_started_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 16);
                break;

            case R.id.intake_air_temp_menu:
                ft1.replace(R.id.gauge_container2,intake_air_temp_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 17);
                break;

            case R.id.engine_fuel_rate_menu:
                ft1.replace(R.id.gauge_container3,fuel_rate_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 18);
                break;
            case R.id.engine_oil_temp_menu:
                ft1.replace(R.id.gauge_container3,oil_temp_fragment);
                ft1.commit();
                sendingPID2BT(sendingMessageIntent, 19);
                break;

            default:
                break;

        }
        return super.onContextItemSelected(item);
    }

    private void sendingPID2BT(final Intent sendingMessageIntent, final int i) {
        sendingMessageIntent.putExtra("theMessage", "01 " + PIDS[i]  + ">");
        int threadnum = -1;
        Log.d("dtcount", Integer.toString(Thread.activeCount()));

        if(i == 0 || i == 1 || i == 13 || i == 14 || i == 15){
            threadnum = 0;
        }else if(i == 3 || i == 4 || i == 8 || i == 16 || i == 17){
            threadnum = 1;
        }else if(i == 5 || i == 6 || i == 2 || i == 18 || i == 19){
            threadnum = 2;
        }else{
            threadnum = 3;
        }
        flagArray[threadnum] = true;
        final int finalThreadnum = threadnum;
        Thread t = new Thread(Integer.toString(threadnum)){
            public void run(){
                while (true) {
                    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    Log.d("BTS", PIDS[i]);
                    Log.d("thread", Integer.toString(Thread.activeCount()));
                    if(flagArray[finalThreadnum]) {
                        flagArray[finalThreadnum] = false;
                        break;
                    }
                }
            }
        };
        t.start();
    }

    @Override
    protected void onPause() {
        super.onPause();
        for(int i = 0; i < 4; i++){
            flagArray[i] = true;
        }
    }


    @Override
    protected void onRestart(){
        super.onRestart();
        finish();
        overridePendingTransition(0, 0);
        startActivity(getIntent());
        overridePendingTransition(0, 0);
    }

    @Override
    protected void onResume() {
        super.onResume();
        for(int i = 0; i < 4; i++){
            flagArray[i] = false;
        }
    }

    @Override
    public void sendAbsoluteLoadPID(String string) {

    }

    @Override
    public void sendActualETorquePID(String string) {

    }

    @Override
    public void sendAirTempPID(String string) {

    }

    @Override
    public void sendCalculatedEngineLoadPID(String string) {

    }

    @Override
    public void sendCoolantTempPID(String string) {

    }

    @Override
    public void sendDemandETorquePID(String string) {

    }

    @Override
    public void sendFuelPressurePID(String string) {

    }

    @Override
    public void sendFuelLevelPID(String string) {

    }

    @Override
    public void sendFuelTypePID(String string) {

    }

    @Override
    public void sendMAFPID(String string) {

    }

    @Override
    public void sendRPMPID(String string) {

    }

    @Override
    public void sendSpeedPID(String string) {

    }

    @Override
    public void sendThrottlePID(String string) {

    }
}


