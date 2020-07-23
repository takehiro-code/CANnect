package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.RelativeLayout;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    //create objects for cards
    private CardView mapCard, dashboardCard, diagnosticsCard, settingsCard;
    // object for bottom bar (connect)
    private RelativeLayout connectBar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //define cards
        settingsCard = (CardView) findViewById(R.id.settings_card);
        diagnosticsCard = (CardView) findViewById(R.id.diagnostics_card);
        dashboardCard = (CardView) findViewById(R.id.dashboard_card);
        mapCard = (CardView) findViewById(R.id.map_card);

        //add click listener to the cards
        settingsCard.setOnClickListener(this);

        //start diagnostics activity
        dashboardCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(MainActivity.this,Dashboard.class );
                startActivity(i);
            }
        });

        diagnosticsCard.setOnClickListener(this);
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
}

//added comments to test
//comment issue 33 test environment