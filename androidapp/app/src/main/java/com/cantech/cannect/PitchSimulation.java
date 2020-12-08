package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;
import android.widget.TextView;

import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

public class PitchSimulation extends AppCompatActivity {
    String messages;
    DataParsing dataParsing;
    ImageView mpitch_iv;
    ImageView mroll_iv;
    TextView mpitch_text;
    TextView mroll_text;
    String[] data_S = {"", "", ""};//acc-x,acc-y,acc-z respectively
    double[] data_D = {0.0, 0.0, 0.0};//acc-x,acc-y,acc-z respectively
    double pitch = 0.0;
    int currentPitchAngle = 0;
    int newPitchAngle = 0;
    double roll = 0.0;
    int currentRollAngle = 0;
    int newRollAngle = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pitch_simulation);
        mpitch_iv = findViewById(R.id.pitch_iv);
        mroll_iv = findViewById(R.id.roll_iv);
        mpitch_text = findViewById(R.id.pitch_text);
        mpitch_text.setText("0°");
        mroll_text = findViewById(R.id.roll_text);
        mpitch_text.setText("0°");
        getSupportActionBar().setTitle("Pitch&Roll");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String text = intent.getStringExtra("theMessage");
            messages += text;
            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(messages);//remove  \n255255\r\n and then parse

            switch (parsed[0])
            {
                case "6DOF":
                    data_S = parsed[1].split(",");
                    data_D[0] = Double.parseDouble(data_S[0])* 9.81;
                    data_D[1] = Double.parseDouble(data_S[1])* 9.81;
                    data_D[2] = Double.parseDouble(data_S[2])* 9.81;
                    // apply trigonometry to get the pitch and roll
                    pitch = Math.atan(data_D[0] / sqrt(pow(data_D[1], 2) + pow(data_D[2], 2)));
                    roll = Math.atan(data_D[1] / sqrt(pow(data_D[0], 2) + pow(data_D[2], 2)));
                    //convert radians into degrees
                    pitch = pitch * (180.0 / 3.14);
                    newPitchAngle = currentPitchAngle+(int)pitch;
                    roll = roll * (180.0 / 3.14);
                    newRollAngle = currentRollAngle+(int)(roll);
                    String pitch_S = String.valueOf(pitch);
                    String roll_S = String.valueOf(roll);
                    //rotate pitch image
                    RotateAnimation rotateAnimation = new RotateAnimation(currentPitchAngle, newPitchAngle, RotateAnimation.RELATIVE_TO_SELF, .5f, RotateAnimation.RELATIVE_TO_SELF, .5f);
                    rotateAnimation.setFillAfter(true);
                    rotateAnimation.setDuration(100);
                    //rotate roll image
                    RotateAnimation rotateAnimation2 = new RotateAnimation(currentRollAngle, newRollAngle, RotateAnimation.RELATIVE_TO_SELF, .5f, RotateAnimation.RELATIVE_TO_SELF, .5f);
                    rotateAnimation2.setFillAfter(true);
                    rotateAnimation2.setDuration(100);

                    mpitch_text.setText(newPitchAngle+"°");
                    mroll_text.setText(newRollAngle+"°");
                    mpitch_iv.startAnimation(rotateAnimation);
                    mroll_iv.startAnimation(rotateAnimation2);
                    currentPitchAngle = newPitchAngle;
                    newRollAngle = currentRollAngle;
                    break;
                default:
                    System.out.println("default");
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
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    // called whenever Dashboard leaves
    @Override
    protected void onStop() {
        super.onStop();
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }
}