package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;


import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;

import java.lang.reflect.Array;
import java.util.ArrayList;


public class Dashboard_chart extends AppCompatActivity {

    private LineChart mChart;
    private Thread thread;
    private boolean plotData = true;
    private Button mButton;
    ArrayList<Entry> datavals;
    ArrayList<Integer> btdata;
    LineDataSet dataset;
    LineData data;
    ArrayList<ILineDataSet> linedata;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard_chart);

        LocalBroadcastManager.getInstance(this).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
        datavals = new ArrayList<Entry>();
        btdata = new ArrayList<Integer>();

        mChart = (LineChart) findViewById(R.id.chart1);
        //LineDataSet dataSet1 = new LineDataSet(dataValue1(), "Data1");
        datavals = new ArrayList<Entry>();
        datavals.add(new Entry(0, 1));
        datavals.add(new Entry(2, 10));
        dataset = new LineDataSet(datavals, "speed");
        ArrayList<ILineDataSet> dataSet= new ArrayList<>();
        dataSet.add(dataset);
        LineData data = new LineData(dataSet);
        mChart.setData(data);
        mChart.invalidate();
        mChart.setDrawBorders(true);

        data.setValueTextColor(Color.RED);
        mChart.setDrawGridBackground(true);

        Legend legend = mChart.getLegend();
        legend.setForm(Legend.LegendForm.LINE);
        legend.setTextColor(Color.WHITE);

        XAxis xaxis = mChart.getXAxis();
        xaxis.setTextColor(Color.WHITE);
        xaxis.setDrawGridLines(true);
        xaxis.setAvoidFirstLastClipping(true);
        xaxis.setEnabled(true);

        YAxis lefty = mChart.getAxisLeft();
        lefty.setTextColor(Color.WHITE);
        lefty.setDrawGridLines(true);
        lefty.setAxisMaximum(10f);
        lefty.setAxisMinimum(0f);
        lefty.setDrawGridLines(true);

        YAxis righty = mChart.getAxisRight();
        righty.setEnabled(false);

        mChart.getAxisLeft().setDrawGridLines(true);
        mChart.getXAxis().setDrawGridLines(true);


        //below code is for page navigation
        //initialize and assign variable
        BottomNavigationView bottomNavigationView = findViewById(R.id.bottom_navigation);

        //Set Table selected
        bottomNavigationView.setSelectedItemId(R.id.Chart);

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
                        return true;
                    case R.id.Gauge:
                        startActivity(new Intent(getApplicationContext(),Dashboard_gauge.class));
                        overridePendingTransition(0,0);
                        return true;
                }
                return false;
            }
        });
    }

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //needs to be modified, received value is a string. also add multiple datasets
            int value = intent.getIntExtra("theMessage", -1);
            btdata.add(value);
            datavals.add(new Entry(btdata.size(), value));

        }
    };

}