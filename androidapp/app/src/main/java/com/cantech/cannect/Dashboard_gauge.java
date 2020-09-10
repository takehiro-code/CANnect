package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.Toast;

import com.github.anastr.speedviewlib.ProgressiveGauge;
import com.github.anastr.speedviewlib.components.Section;
import com.github.mikephil.charting.data.Entry;
import com.google.android.material.bottomnavigation.BottomNavigationView;

import com.github.anastr.speedviewlib.Speedometer;
import com.github.anastr.speedviewlib.TubeSpeedometer;


public class Dashboard_gauge extends AppCompatActivity {
    private BluetoothSocket mBTSocket = null;
    private BTCommunication.ConnectedThread mConnectedThread;
    DataParsing dataParsing;
    StringBuilder data_message;


    TubeSpeedometer engineRPM;
    Speedometer carSpeed;
    Speedometer engineTempView;
    ProgressiveGauge fuelstatusView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard_gauge);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        data_message = new StringBuilder();

        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));

        //initialize and assign variable
        BottomNavigationView bottomNavigationView = findViewById(R.id.bottom_navigation);
        //Set Table selected
        bottomNavigationView.setSelectedItemId(R.id.Gauge);



        //perform itemselectedlistener
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.Table:
                        startActivity(new Intent(getApplicationContext(),Dashboard.class));
                        overridePendingTransition(0,0);
                        return true;
                    case R.id.Chart:
                        startActivity(new Intent(getApplicationContext(),Dashboard_chart.class));
                        overridePendingTransition(0,0);
                        return true;
                    case R.id.Gauge:
                        return true;
                }
                return false;
            }
        });

        engineRPM = (TubeSpeedometer) findViewById(R.id.RPMView);
        carSpeed = (Speedometer) findViewById(R.id.speedView);
        engineTempView = (Speedometer) findViewById(R.id.engineTempView);
        fuelstatusView = (ProgressiveGauge) findViewById(R.id.fuel_status);

        //setting colours of different sections on car_speed gauge.
        carSpeed.clearSections();
        carSpeed.addSections(
                new Section(0f, .65f, Color.GREEN)
                , new Section(.65f, .85f, Color.YELLOW)
                , new Section(.85f, 1f, Color.RED));
        carSpeed.setSpeedometerWidth(30);




        // change MAX speed to x 1K
        engineRPM.setMaxSpeed(9);
        // set or remove 3D Effects.
        engineRPM.clearSections();
        engineRPM.addSections(
                new Section(0f, 0.8f, Color.GREEN),
                new Section(0.8f, 1f, Color.RED)
        );

        engineTempView.clearSections();
        engineTempView.addSections(
                new Section(0f, 0.85f, Color.GRAY),
                new Section(0.85f, 1f, Color.RED)
        );
        engineTempView.setSpeedometerWidth(30);


        engineRPM.clearSections();
        engineRPM.addSections(
                new Section(0f, 0.8f, Color.BLACK),
                new Section(.8f, 1f, Color.RED)
        );
        engineRPM.setSpeedometerWidth(30);
        engineRPM.setTickPadding(15);

    }

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //needs to be modified, received value is a string. also add multiple datasets
            String text = intent.getStringExtra("theMessage");
            data_message.append(text + "\n");
            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(data_message.toString());

            try {
                switch (parsed[0]) {
                    case "VEHICLE_SPEED":
                        //changing string to float.
                        carSpeed.speedTo(Float.parseFloat(parsed[1]));
                        break;
                    case "ENGINE_RPM":
                        engineRPM.speedTo(Float.parseFloat(parsed[1]));
                        break;
                    case "ENGINE_COOLANT_TEMP":
                        engineTempView.speedTo(Float.parseFloat(parsed[1]));
                        break;
                    case "FUEL_STATUS":
                        fuelstatusView.speedTo(Float.parseFloat(parsed[1]));
                        break;
                    default:
                        break;
                }
            }catch (Exception e){
                e.printStackTrace();
            }

            if (data_message.length()>=28){
                data_message.setLength(0);
            }
        }
    };

    // called whenever Dashboard visited
    @Override
    protected void onStart() {
        super.onStart();
        //register broadcast receiver
        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
    }

    @Override
    protected void onPause() {
        super.onPause();
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }

    @Override
    protected void onResume() {
        super.onResume();
        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
    }

    // called whenever Dashboard leaves
    @Override
    protected void onStop() {
        super.onStop();
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }
}


//For adding context menu. Ignore for now
////        FrameLayout frameLayout = (FrameLayout) findViewById(R.id.flspeedView);
////        registerForContextMenu(frameLayout);
//    @Override
//    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
//        super.onCreateContextMenu(menu, v, menuInfo);
//        menu.setHeaderTitle("Choose One");
//        getMenuInflater().inflate(R.menu.change_data_display_view, menu);
//    }
//
//
//    @Override
//    public boolean onContextItemSelected(@NonNull MenuItem item) {
//        FragmentManager fragmentManager = getSupportFragmentManager();
//        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
//
//        switch (item.getItemId()){
//            case R.id.option_1:
//                return true;
//            case R.id.option_2:
//                return true;
//            default:
//                return super.onContextItemSelected(item);
//        }
//    }