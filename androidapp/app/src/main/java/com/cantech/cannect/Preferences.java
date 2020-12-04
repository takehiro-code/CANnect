package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.CompoundButton;
import android.widget.Switch;

public class Preferences extends AppCompatActivity {
    SharedPref sharedPref;
    private Switch theme_switch;
    boolean flag;
    String BTSensor;
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
        setContentView(R.layout.activity_preferences);

        getSupportActionBar().setTitle("Preferences");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        theme_switch = (Switch)findViewById(R.id.theme_switch);
        if (sharedPref.loadDarkModeState()){
            theme_switch.setChecked(true);
        }
        theme_switch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {//b is button boolean status
                if (b){
                    sharedPref.setDarkModeState(true);
                }else{
                    sharedPref.setDarkModeState(false);
                }
                recreate();
            }
        });
    }

    private void sendPID2BT(){
        final Intent sendingMessageIntent = new Intent("sendingMessage");
        Thread t = new Thread(){
                public void run() {
             while (true) {
                 sendingMessageIntent.putExtra("theMessage", "31 ");
                 LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(sendingMessageIntent);
                 try {
                     Thread.sleep(1500);
                 } catch (InterruptedException e) {
                     // TODO Auto-generated catch block
                     e.printStackTrace();
                 }
                 if (flag){
                     break;}
                 }
                }
            };
            t.start();
    }
}