package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class CarBrand extends AppCompatActivity {

    Set<String> checkedPids = new HashSet<String>();
    Set<String> checkMarks = new HashSet<String>();
    SharedPref sharedPref;
    ListView listView;
    String mTitle[] ={"Auto", "SAE J1850 VPW", "SAE J1850 PWM","ISO 9141-2","ISO 14230 KWP2000","ISO 15765-4/SAE J2480 (CAN)"};
    String mDescription[] ={"Standard PIDs", "This protocol is usually used by Ford Motor Company", "This protocol is mostly used by General Motors","Asian, Chrysler, and European cars","Asian Cars","vehicles made after 2008"};
    private AlertDialog.Builder dialogBuilder;
    private  AlertDialog dialog;
    int pid_counter = 0;

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
        setContentView(R.layout.activity_car_brand);

        getSupportActionBar().setTitle("Car Brand");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        listView= findViewById(R.id.carbrand_list);

        CarBrand.MyAdapter adapter = new CarBrand.MyAdapter(this, mTitle, mDescription);
        listView.setAdapter(adapter);



        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Intent intent;
                if (i == 0){
                    //Toast.makeText(CarBrand.this, "Standardized pids", Toast.LENGTH_SHORT).show();
//                    Intent sendingMessageIntent = new Intent("sendingMessage");
//                    sendingMessageIntent.putExtra("theMessage", "stp 35 >");
//                    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                    createNewPidListDialog(i);
                }
                if (i == 1){
                    //Toast.makeText(CarBrand.this, "SAE J1850 VPW pids", Toast.LENGTH_SHORT).show();
                    createNewPidListDialog(i);
                }
                if (i == 2){
                    //Toast.makeText(CarBrand.this, "SAE J1850 PWM pids", Toast.LENGTH_SHORT).show();
//                    Intent sendingMessageIntent = new Intent("sendingMessage");
//                    sendingMessageIntent.putExtra("theMessage", "stp 11 >");
//                    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                    createNewPidListDialog(i);
                }
                if (i == 3){
                    //Toast.makeText(CarBrand.this, "ISO 9141-2 pids", Toast.LENGTH_SHORT).show();
//                    Intent sendingMessageIntent = new Intent("sendingMessage");
//                    sendingMessageIntent.putExtra("theMessage", "stp 22 >");
//                    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                    createNewPidListDialog(i);
                }
                if (i == 4){
                    //Toast.makeText(CarBrand.this, "ISO 14230 KWP2000 pids", Toast.LENGTH_SHORT).show();
                    createNewPidListDialog(i);
                }
                if (i == 5){
                    //Toast.makeText(CarBrand.this, "ISO 15765-4/SAE J2480 (CAN)", Toast.LENGTH_SHORT).show();
                    Intent sendingMessageIntent = new Intent("sendingMessage");
                    sendingMessageIntent.putExtra("theMessage", "stp 35 >");
                    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                    createNewPidListDialog(i);
                }
            }
        });
    }
    class MyAdapter extends ArrayAdapter<String> {
        Context context;
        String rTitle[];
        String rDescription[];

        MyAdapter(Context c, String title[], String description[]){
            super(c, R.layout.setting_list_row,R.id.mainText, title);
            this.context = c;
            this.rTitle = title;
            this.rDescription = description;
        }

        @NonNull
        @Override
        public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
            LayoutInflater layoutInflater = (LayoutInflater)getApplicationContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            View row = layoutInflater.inflate(R.layout.carbrand_list_row, parent, false);
            TextView mmainText = row.findViewById(R.id.mainText);
            TextView msubText = row.findViewById(R.id.subText);

            mmainText.setText(rTitle[position]);
            msubText.setText(rDescription[position]);
            return row;
        }
    }

    public void createNewPidListDialog(int i){
        dialogBuilder = new AlertDialog.Builder(this);
        //final View PidListPopupView = getLayoutInflater().inflate(R.layout.pidslistpopup, null);
        //dialogBuilder.setView(PidListPopupView);
        dialogBuilder.setTitle("Choose PIDs");
        String[] pids={};
        boolean[] checkedItems={};
        if (i==0){
            pids = new String[]{"ENGINE COOLANT TEMP", "FUEL PRESSURE", "ENGINE RPM", "VEHICLE SPEED", "MAF SENSOR", "THROTTLE", "O2 VOLTAGE","Fuel Type", "Fuel Level", "Driver Demand Engine Torque"
                                ,"Actual Engine Torque", "Calculated Engine Load", "Absolute Engine Load", "Ambient Air Temperature"};
            checkedItems = new boolean[]{ false, false, false, false, false, false, false, false, false, false, false, false, false, false};
        }
        if (i==1){
            pids = new String[]{"FUEL STATUS", "ENGINE COOLANT TEMP", "FUEL PRESSURE", "ENGINE RPM", "VEHICLE SPEED", "MAF SENSOR", "THROTTLE", "O2 VOLTAGE", "SENSORA", "SENSORB"};
            checkedItems = new boolean[]{false, false, false, false, false, false, false, false, false, false};
        }
        if (i==2){
            pids = new String[]{"FUEL STATUS", "ENGINE COOLANT TEMP", "FUEL PRESSURE", "ENGINE RPM", "VEHICLE SPEED", "MAF SENSOR", "THROTTLE", "O2 VOLTAGE", "pid1", "pid2", "pid3"};
            checkedItems = new boolean[]{false, false, false, false, false, false, false, false, false, false, false};
        }
        if (i==3){
            pids = new String[]{"FUEL STATUS", "ENGINE COOLANT TEMP", "FUEL PRESSURE", "ENGINE RPM", "VEHICLE SPEED", "MAF SENSOR", "THROTTLE", "O2 VOLTAGE", "Sensor 1"};
            checkedItems = new boolean[]{false, false, false, false, false, false, false, false, false};
        }
        if (i==4){
            pids = new String[]{"FUEL STATUS", "ENGINE COOLANT TEMP", "FUEL PRESSURE", "ENGINE RPM", "VEHICLE SPEED", "MAF SENSOR", "THROTTLE", "O2 VOLTAGE"};
            checkedItems = new boolean[]{false, false, false, false, false, false, false, false};
        }
        if (i==5){
            pids = new String[]{"FUEL STATUS", "ENGINE COOLANT TEMP", "FUEL PRESSURE", "ENGINE RPM", "VEHICLE SPEED", "MAF SENSOR", "THROTTLE", "O2 VOLTAGE"};
            checkedItems = new boolean[]{false, false, false, false, false, false, false, false};
        }

        final String[] finalPids = pids;
        final boolean[] finalCheckedItems = checkedItems;

        dialogBuilder.setMultiChoiceItems(pids, checkedItems, new DialogInterface.OnMultiChoiceClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which, boolean isChecked) {
                // user checked or unchecked a box
                if (isChecked){
                    pid_counter++;
                    //Toast.makeText(CarBrand.this, "pid counter is"+ pid_counter, Toast.LENGTH_SHORT).show();

                    if (pid_counter<5) {
                        finalCheckedItems[which] = true;
                    }
                    if (pid_counter>5){
                        Toast.makeText(CarBrand.this, "You can not choose more than 5 items, the last item you chose will not be selected", Toast.LENGTH_SHORT).show();
                        pid_counter--;
                        finalCheckedItems[which] = false;
                    }
                }else{
                    finalCheckedItems[which] = false;
                }
            }
        });

        // add OK and Cancel buttons
        dialogBuilder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dial, int which) {
                // user clicked OK
                StringBuilder checkedPids = new StringBuilder();
                StringBuilder checkMarksString = new StringBuilder();
                for (int i=0;i<finalCheckedItems.length;i++){
                    if(finalCheckedItems[i]){
                        checkedPids.append(finalPids[i]);
                        checkedPids.append(",");
                    }
                    checkMarksString.append(finalCheckedItems[i]);
                    checkMarksString.append(",");
                }
                //save checked pids as preferences
                SharedPreferences settingPids = getSharedPreferences("checked_pids_list", Context.MODE_PRIVATE);
                SharedPreferences.Editor editor = settingPids.edit();
                editor.putString("pids", checkedPids.toString());
                editor.commit();
                //save check marks as preferences
                SharedPreferences settingCheckMarks = getSharedPreferences("check_marks_list", Context.MODE_PRIVATE);
                SharedPreferences.Editor editorCheckMarks = settingCheckMarks.edit();
                editorCheckMarks.putString("checkMarks", checkMarksString.toString());
                editorCheckMarks.commit();
                pid_counter = 0;
            }
        });
        dialogBuilder.setNegativeButton("Cancel", null);

        //create and show the alert dialog
        dialog = dialogBuilder.create();
        dialog.show();


    }

}