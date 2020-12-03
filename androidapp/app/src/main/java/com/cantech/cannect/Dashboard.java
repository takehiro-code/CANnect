package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.core.content.FileProvider;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;
import android.bluetooth.BluetoothSocket;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

public class Dashboard extends AppCompatActivity {
    SharedPref sharedPref;
    private BluetoothSocket mBTSocket = null;
    private BTCommunication.ConnectedThread mConnectedThread;
    ArrayList<Data> dataArrayList;
    DataListAdapter adapter;
    String messages;
    ListView listPids;
    Data FUEL_STATUS;
    Data ENGINE_COOLANT_TEMP;
    Data FUEL_PRESSURE;
    Data ENGINE_RPM;
    Data VEHICLE_SPEED;
    Data MAF_SENSOR;
    Data THROTTLE;
    Data O2_VOLTAGE;
    Data newData;
    DataParsing dataParsing;
    //for export log
    Calendar calendar;
    SimpleDateFormat simpleDateFormat;
    String dateTime;
    boolean isExport;
    String exportData;
    long seconds;
    long duration;
    final ExportLoadingDialog exportLoadingDialog = new ExportLoadingDialog(Dashboard.this);

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
        setContentView(R.layout.activity_dashboard);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        listPids = (ListView)findViewById(R.id.listPids);
        messages = "";//new StringBuilder();
        dataParsing = new DataParsing();
        //Below code is for setting up the tabular form
        //Create Data objects
        //FUEL_STATUS = new Data("FUEL STATUS","0");
        //ENGINE_COOLANT_TEMP = new Data("ENGINE COOLANT TEMPERATURE","0");
        //FUEL_PRESSURE = new Data("FUEL PRESSURE","0");
        //ENGINE_RPM = new Data("ENGINE RPM","0");
        //VEHICLE_SPEED = new Data("VEHICLE SPEED","0");
        //MAF_SENSOR = new Data("MAF SENSOR","0");
        //THROTTLE = new Data("THROTTLE","0");
        //O2_VOLTAGE = new Data("O2 VOLTAGE","0");

        dataArrayList = new ArrayList<>();
        //dataArrayList.add(FUEL_STATUS);
        //dataArrayList.add(ENGINE_COOLANT_TEMP);
        //dataArrayList.add(FUEL_PRESSURE);
        //dataArrayList.add(ENGINE_RPM);
        //dataArrayList.add(VEHICLE_SPEED);
        //dataArrayList.add(MAF_SENSOR);
        //dataArrayList.add(THROTTLE);
        //dataArrayList.add(O2_VOLTAGE);

        //title
        newData = new Data("PIDS");
        dataArrayList.add(newData);
        //get saved pids in settings
        SharedPreferences PrefPids = getSharedPreferences("checked_pids_list",Context.MODE_PRIVATE);
        String PrefPidss = PrefPids.getString("pids","");
        String[] checkedPids = PrefPidss.split(",");
        for (int i=0; i<checkedPids.length;i++){
            System.out.println("pid is");
            System.out.println(checkedPids[i]);
            newData = new Data(checkedPids[i],"0");
            dataArrayList.add(newData);
        }

        //add sensor data
        //title
        newData = new Data("6DOF");
        dataArrayList.add(newData);
        newData = new Data("Acceleration-x","0");
        dataArrayList.add(newData);
        newData = new Data("Acceleration-y","0");
        dataArrayList.add(newData);
        newData = new Data("Acceleration-z","0");
        dataArrayList.add(newData);
        newData = new Data("pitch","0");
        dataArrayList.add(newData);
        newData = new Data("roll","0");
        dataArrayList.add(newData);
        //newData = new Data("yaw","0");
        //dataArrayList.add(newData);

        adapter = new DataListAdapter(this, R.layout.adapter_view_pidstable_layout, dataArrayList);
        listPids.setAdapter(adapter);

        //for export log
        calendar = Calendar.getInstance();
        isExport = false;
        exportData = "";
        //Below code is for page navigation
        //initialize and assign variable
        BottomNavigationView bottomNavigationView = findViewById(R.id.bottom_navigation);

        //Set Table selected
        bottomNavigationView.setSelectedItemId(R.id.Table);

        //perform itemselectedlistener
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.Table:
                        return true;
                    case R.id.Chart:
                        startActivity(new Intent(getApplicationContext(),Dashboard_chart.class));
                        overridePendingTransition(0,0);
                        return true;
                    case R.id.Gauge:
                        startActivity(new Intent(getApplicationContext(),Dashboard_gauge.class));
                        overridePendingTransition(0,0);
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
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater=getMenuInflater();
        menuInflater.inflate(R.menu.export_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()){
            case R.id.export_10s:
                start_export(10);
                return true;
            case R.id.export_30s:
                start_export(30);
                return true;
            case R.id.export_60s:
                start_export(60);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    //Below code is for updating the table

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String text = intent.getStringExtra("theMessage");
            messages+=text;
            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(messages.substring(0, messages.length() - 10));//remove  \n255255\r\n and then parse

            switch(parsed[0])
            {
                case "FUEL STATUS":
                    newData = new Data("FUEL STATUS",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("FUEL STATUS")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "ENGINE COOLANT TEMP":
                    newData = new Data("ENGINE COOLANT TEMP",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("ENGINE COOLANT TEMP")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "FUEL PRESSURE":
                    newData = new Data("FUEL PRESSURE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("FUEL PRESSURE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "ENGINE RPM":
                    newData = new Data("ENGINE RPM",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("ENGINE RPM")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "VEHICLE SPEED":
                    newData = new Data("VEHICLE SPEED",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("VEHICLE SPEED")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "MAF SENSOR":
                    newData = new Data("MAF SENSOR",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("MAF SENSOR")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "THROTTLE":
                    newData = new Data("THROTTLE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("THROTTLE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "O2 VOLTAGE":
                    newData = new Data("O2 VOLTAGE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("O2 VOLTAGE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "6DOF":
                    String[] data = parsed[1].split(",");
                    newData = new Data("Acceleration-x",data[0]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("Acceleration-x")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    newData = new Data("Acceleration-y",data[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("Acceleration-y")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    newData = new Data("Acceleration-z",data[2]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("Acceleration-z")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    double xAxis = Double.parseDouble(data[0]);
                    double yAxis = Double.parseDouble(data[1]);
                    double zAxis = Double.parseDouble(data[2]);
                    // apply trigonometry to get the pitch and roll
                    double pitch = Math.atan(xAxis/sqrt(pow(yAxis,2) + pow(zAxis,2)));
                    double roll = Math.atan(yAxis/sqrt(pow(xAxis,2) + pow(zAxis,2)));
                    //convert radians into degrees
                    pitch = pitch * (180.0/3.14);
                    roll = roll * (180.0/3.14);
                    String pitch_S = String.valueOf(pitch);
                    String roll_S = String.valueOf(roll);
                    newData = new Data("pitch",pitch_S);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("pitch")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    newData = new Data("roll",roll_S);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("roll")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                default:
                    System.out.println("default");
            }
            if (isExport){
                //append
                calendar.setTimeInMillis(seconds);
                exportData+="\n"+calendar.getTime()+","+messages.substring(0, messages.length() - 10)+","+parsed[0]+","+parsed[1];
                //update the timer
                seconds = System.currentTimeMillis();
                System.out.println("seconds is");
                System.out.println(seconds);
                if (seconds>duration){
                    isExport = false;
                    finish_export();
                }
            }
            if (messages.contains("FF") || messages.contains("255255")){//(messages.length()>=28){
                //Toast.makeText(Dashboard.this, messages, Toast.LENGTH_LONG).show();
                messages="";
            }
        }
    };

    // called only when you go back to main activity, but will called the number of times onCreate called
    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    // called whenever Dashboard visited
    @Override
    protected void onStart() {
        super.onStart();
        //register broadcast receiver
        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
    }

    // called whenever Dashboard leaves
    @Override
    protected void onStop() {
        super.onStop();
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }

    public void start_export(int Duration){
        isExport = true;
        exportData="";
        exportData+="Time, OBD2 message, Pid, Value";
        //calendar = Calendar.getInstance();
        //simpleDateFormat = new SimpleDateFormat("ss");
        //dateTime = simpleDateFormat.format(calendar.getTime());
        //seconds = Integer.parseInt(dateTime);
        seconds = System.currentTimeMillis();
        duration = seconds+Duration*1000;
        System.out.println("duration is");
        System.out.println(duration);
        exportLoadingDialog.startLoadingDialog();
    }
    public void finish_export(){
        try{
            //writing to a file
            FileOutputStream out = openFileOutput("data.csv", Context.MODE_PRIVATE);
            out.write(exportData.getBytes());
            out.close();
            //exporting
            Context context =getApplicationContext();
            File filelocation = new File(getFilesDir(),"data.csv");
            Uri path = FileProvider.getUriForFile(context, "com.cantech.cannect.FileProvider", filelocation);
            Intent fileIntent = new Intent(Intent.ACTION_SEND);
            fileIntent.setType("text/csv");
            fileIntent.putExtra(Intent.EXTRA_SUBJECT,"data");
            fileIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            fileIntent.putExtra(Intent.EXTRA_STREAM,path);
            startActivity(Intent.createChooser(fileIntent,"Send mail"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        exportData="";
        exportLoadingDialog.stopLoadingDialog();
    }
    // don't worry about this lifecycle
//    @Override
//    protected void onResume() {
//        super.onResume();
//    }
//
//    @Override
//    protected void onPause() {
//        super.onPause();
//    }
}