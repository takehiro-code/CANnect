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
import android.util.Log;
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
import java.util.List;

import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

public class Dashboard extends AppCompatActivity {
    SharedPref sharedPref;
    private BluetoothSocket mBTSocket = null;
    private BTCommunication.ConnectedThread mConnectedThread;
    ArrayList<Data> dataArrayList;
    DataListAdapter adapter;
    String messages;
    List<String> BTPIDs = new ArrayList<>();
    List<String> BTStrings = new ArrayList<>();
    boolean flag;
    ListView listPids;
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
    int toExport;//0=pid,1=sensor
    double pitch;
    double roll;

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

        listPids = findViewById(R.id.listPids);
        messages = "";
        dataParsing = new DataParsing();

        dataArrayList = new ArrayList<>();

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
            BTStrings.add(checkedPids[i]);
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
        newData = new Data("Gyroscope-x","0");
        dataArrayList.add(newData);
        newData = new Data("Gyroscope-y","0");
        dataArrayList.add(newData);
        newData = new Data("Gyroscope-z","0");
        dataArrayList.add(newData);
        newData = new Data("Temperature","0");
        dataArrayList.add(newData);

        adapter = new DataListAdapter(this, R.layout.adapter_view_pidstable_layout, dataArrayList);
        listPids.setAdapter(adapter);

        convertStringtoPIDs();
        //creating thread for each pids
        Log.d("table", Integer.toString(BTPIDs.size()));

        //for export log
        calendar = Calendar.getInstance();
        isExport = false;
        exportData = "";
        start_export();
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

    private void sendPID2BT(){
        for(int i = 0; i < BTPIDs.size(); i++){
            final Intent sendingMessageIntent = new Intent("sendingMessage");
            final int finalI = i;
            Thread t = new Thread(){
                public void run() {
                    while (true) {
                        sendingMessageIntent.putExtra("theMessage", "01 " + BTPIDs.get(finalI) + ">");
                        Log.d("table", BTPIDs.get(finalI));
                        LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                        try {
                            Thread.sleep(1500);
                        } catch (InterruptedException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                        if (flag)
                            break;
                    }
                }
            };
            t.start();
        }
    }

    private void convertStringtoPIDs() {
        for(String s : BTStrings){
            switch (s){
                case "ENGINE COOLANT TEMP":
                    BTPIDs.add("05 ");
                    break;
                case "FUEL PRESSURE":
                    BTPIDs.add("0A ");
                    break;
                case "ENGINE RPM":
                    BTPIDs.add("0C ");
                    break;
                case "VEHICLE SPEED":
                    BTPIDs.add("0D ");
                    break;
                case "MAF SENSOR":
                    BTPIDs.add("10 ");
                    break;
                case "THROTTLE":
                    BTPIDs.add("11 ");
                    break;
                case "O2 VOLTAGE":
                    BTPIDs.add("14 ");
                    break;
                case "Fuel Type":
                    BTPIDs.add("03 ");
                    break;
                case "FUEL LEVEL":
                    BTPIDs.add("2F ");
                    break;
                case "Driver Demand Engine Torque":
                    BTPIDs.add("61 ");
                    break;
                case "ACTUAL ENGINE TORQUE":
                    BTPIDs.add("62 ");
                    break;
                case "Calculated Engine Load":
                    BTPIDs.add("04 ");
                    break;
                case "INTAKE AIR TEMPERATURE":
                    BTPIDs.add("0F ");
                    break;
                default:
                    BTPIDs.add("Invalid");
                    break;
            }
        }
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
                finish_export();
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
            String[] parsed = DataParsing.convertOBD2FrameToUserFormat(messages);
            Log.d("receiver", parsed[0]);
            switch(parsed[0])
            {
                case "FUEL STATUS":
                    toExport = 0;
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
                    toExport = 0;
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
                    toExport = 0;
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
                    toExport = 0;
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
                    toExport = 0;
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
                    toExport = 0;
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
                    toExport = 0;
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
                    toExport = 0;
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
                case "AMBIENT AIR TEMP":
                    toExport = 0;
                    newData = new Data("AMBIENT AIR TEMP",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("AMBIENT AIR TEMP")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "6DOF":
                    toExport = 1;
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
                    //gyro
                    newData = new Data("Gyroscope-x",data[3]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("Gyroscope-x")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    newData = new Data("Gyroscope-y",data[4]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("Gyroscope-y")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    newData = new Data("Gyroscope-z",data[5]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("Gyroscope-z")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    //temp
                    newData = new Data("Temperature",data[6]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("Temperature")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    double xAxis = Double.parseDouble(data[0]);
                    double yAxis = Double.parseDouble(data[1]);
                    double zAxis = Double.parseDouble(data[2]);
                    // apply trigonometry to get the pitch and roll
                    pitch = Math.atan(xAxis/sqrt(pow(yAxis,2) + pow(zAxis,2)));
                    roll = Math.atan(yAxis/sqrt(pow(xAxis,2) + pow(zAxis,2)));
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
                case "ACTUAL ENGINE TORQUE":
                    toExport = 0;
                    newData = new Data("ACTUAL ENGINE TORQUE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("ACTUAL ENGINE TORQUE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "DEMAND ENGINE TORQUE":
                    toExport = 0;
                    newData = new Data("DEMAND ENGINE TORQUE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("DEMAND ENGINE TORQUE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "FUEL LEVEL":
                    toExport = 0;
                    newData = new Data("FUEL LEVEL",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("FUEL LEVEL")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "ABSOLUTE LOAD VALUE":
                    toExport = 0;
                    newData = new Data("ABSOLUTE LOAD VALUE",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("ABSOLUTE LOAD VALUE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "INTAKE AIR TEMPERATURE":
                    toExport = 0;
                    newData = new Data("AMBIENT AIR TEMP",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("INTAKE AIR TEMPERATURE")){
                            dataArrayList.set(i, newData);
                            break;
                        }
                    }
                    adapter.notifyDataSetChanged();
                    break;
                case "CALCULATED ENGINE LOAD":
                    toExport = 0;
                    newData = new Data("CALCULATED ENGINE LOAD",parsed[1]);
                    for (int i=0;i<dataArrayList.size();i++){
                        String pid = dataArrayList.get(i).getPid();
                        if (pid.equals("CALCULATED ENGINE LOAD")){
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
                seconds = System.currentTimeMillis();
                calendar.setTimeInMillis(seconds);
                //if only pid data coming (using indicator variable)
                if (toExport ==0){//export pids
                    exportData+="\n"+calendar.getTime()+","+messages.substring(0, messages.length() - 10)+","+parsed[0]+","+parsed[1]+","+"0"+","+"0"+","+"0"+","+"0"+","+"0"+","+"0"+","+"0";
                }
                else if (toExport==1){//export sensor
                    exportData+="\n"+calendar.getTime()+","+"Sensor Data"+","+"0"+","+"0"+","+parsed[1]+","+pitch+","+roll;
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
    protected void onResume() {
        super.onResume();
        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
        sendPID2BT();
        flag = false;
    }

    @Override
    protected void onPause() {
        super.onPause();
        BTPIDs.clear();
        BTStrings.clear();
        flag = true;
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        overridePendingTransition(0, 0);
        startActivity(getIntent());
        overridePendingTransition(0, 0);
    }



    // called whenever Dashboard leaves
    @Override
    protected void onStop() {
        super.onStop();
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }

    public void start_export(){
        isExport = true;
        exportData="";
        exportData+="Time, OBD2 message, Pid, Value, Acceleration-x, Acceleration-y, Acceleration-z, Gyroscope-x, Gyroscope-y, Gyroscope-z, Temperature, Pitch, Roll";
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
        //exportLoadingDialog.stopLoadingDialog();
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