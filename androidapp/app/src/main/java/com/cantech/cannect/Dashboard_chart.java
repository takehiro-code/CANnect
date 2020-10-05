package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;


import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.graphics.Color;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Toast;


import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.Legend;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;

import java.util.ArrayList;
import java.util.List;


public class Dashboard_chart extends AppCompatActivity {

    StringBuilder messages;
    DataParsing dataParsing;

    private LineChart mChart;
    private Spinner spinner;
    private Thread thread;
    private boolean plotData = true;
    List<Entry> data;
    LineDataSet lineDataSet;
    LineData lineData;
    int x;
    XAxis xl;
    YAxis leftAxis;
    YAxis rightAxis;

    String toDisplay = "VEHICLE SPEED";
    String previousPID = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard_chart);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        messages = new StringBuilder();
        dataParsing = new DataParsing();

        data =  new ArrayList<>();
        data.add(new Entry(0,0));
        lineDataSet = new LineDataSet(data, toDisplay);
        lineData = new LineData(lineDataSet);

        lineDataSet.setAxisDependency(YAxis.AxisDependency.LEFT);
        lineDataSet.setLineWidth(1f);
        lineDataSet.setHighlightEnabled(false);
        lineDataSet.setDrawValues(false);
        lineDataSet.setDrawCircles(false);

        mChart = (LineChart) findViewById(R.id.chart1);
        spinner = findViewById(R.id.spinner1);
        mChart.setData(lineData);
        previousPID = toDisplay;



        ArrayAdapter<String> adapter = new ArrayAdapter<>(this,
                android.R.layout.simple_spinner_dropdown_item, getResources().getStringArray(R.array.PIDs));
        spinner.setAdapter(adapter);

        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                toDisplay = adapterView.getItemAtPosition(i).toString();
                Toast.makeText(getApplicationContext(), toDisplay, Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
        // enable touch gestures
        mChart.setTouchEnabled(true);

        // enable scaling and dragging
        mChart.setDragEnabled(true);
        mChart.setScaleEnabled(true);
        mChart.setDrawGridBackground(false);

        // if disabled, scaling can be done on x- and y-axis separately
        mChart.setPinchZoom(true);

        // set an alternative background color
        mChart.setBackgroundColor(Color.BLACK);


        Legend l = mChart.getLegend();

        // modify the legend ...
        l.setForm(Legend.LegendForm.LINE);
        l.setTextColor(Color.WHITE);
        l.setWordWrapEnabled(true);


        xl = mChart.getXAxis();
        leftAxis = mChart.getAxisLeft();
        rightAxis = mChart.getAxisRight();

        xl.setTextColor(Color.WHITE);
        xl.setDrawGridLines(false);
        xl.setAvoidFirstLastClipping(true);
        xl.setEnabled(true);

        leftAxis.setTextColor(Color.WHITE);
        leftAxis.setDrawGridLines(false);
        leftAxis.setAxisMaximum(200f);
        leftAxis.setAxisMinimum(0f);
        leftAxis.setDrawGridLines(true);


        rightAxis.setEnabled(false);

        mChart.getAxisLeft().setDrawGridLines(true);
        mChart.getXAxis().setDrawGridLines(true);
        mChart.setDrawBorders(true);
        // limit the number of visible entries

        //feedMultiple();

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


    private void addEntry(int i, float value) {

        LineData data = mChart.getData();

        if (data != null) {

            ILineDataSet set = data.getDataSetByIndex(i);

            if (set == null) {
                set = createSet(i);
                data.addDataSet(set);
            }

//            data.addEntry(new Entry(set.getEntryCount(), (float) (Math.random() * 80) + 10f), 0);
            data.addEntry(new Entry(set.getEntryCount(), value), i);
            data.notifyDataChanged();

            // let the chart know it's data has changed
            mChart.notifyDataSetChanged();

            // limit the number of visible entries
            mChart.setVisibleXRangeMaximum(5);
            // mChart.setVisibleYRange(30, AxisDependency.LEFT);

            // move to the latest entry
            mChart.moveViewToX(data.getEntryCount());
        }
    }


    private LineDataSet createSet(int i) {

        String label = "UNDEFINED";
        int color = Color.WHITE;

        if (i == 0) {
            label = "FUEL_STATUS";
            color = Color.RED;
        } else if ( i == 1) {
            label = "ENGINE_COOLANT_TEMP";
            color = Color.GREEN;
        } else if (i == 2) {
            label = "FUEL_PRESSURE";
            color = Color.BLUE;
        } else if (i == 3) {
            label = "ENGINE_RPM";
            color = Color.CYAN;
        } else if (i == 4) {
            label = "VEHICLE_SPEED";
            color = Color.YELLOW;
        } else if (i == 5) {
            label = "MAF_SENSOR";
            color = Color.rgb(255, 0, 255);
        } else if (i == 6) {
            label = "THROTTLE";
            color = Color.rgb(255, 255, 0);
        } else if (i == 7) {
            label = "O2_VOLTAGE";
            color = Color.rgb(255, 100, 100);
        }

        LineDataSet set = new LineDataSet(null, label);
        set.setAxisDependency(YAxis.AxisDependency.LEFT);
        set.setLineWidth(1f);
        set.setColor(color);
        set.setHighlightEnabled(false);
        set.setDrawValues(false);
        set.setDrawCircles(false);
        return set;
    }


    private void feedMultiple() {

        if (thread != null){
            thread.interrupt();
        }

        thread = new Thread(new Runnable() {

            @Override
            public void run() {
                while (true){
                    plotData = true;
                    try {
                        Thread.sleep(2000);
                    } catch (InterruptedException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
            }
        });

        thread.start();
    }

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String text = intent.getStringExtra("theMessage");
            messages.append(text + "\n");
            System.out.println("inside dashboard, messages");
            System.out.println(messages);
            System.out.println("messages size");
            System.out.println(messages.length());
            String[] parsed;
            parsed = dataParsing.convertOBD2FrameToUserFormat(messages.toString());
            System.out.println("parsed[0]");
            System.out.println(parsed[0]);
            System.out.println("parsed[1]");
            System.out.println(parsed[1]);

            float value = Float.parseFloat(parsed[1]);
            if(previousPID.equals(toDisplay)) {
                if(parsed[0].equals(toDisplay)) {
                    data.add(new Entry(lineDataSet.getEntryCount(), value));
                    lineDataSet.notifyDataSetChanged();
                    lineData.notifyDataChanged();
                    mChart.notifyDataSetChanged();
                    mChart.invalidate();
                    mChart.setVisibleXRangeMaximum(20);
                    // mChart.setVisibleYRange(30, AxisDependency.LEFT);

                    // move to the latest entry
                    mChart.moveViewToX(lineData.getEntryCount());
                }

            }else if(!previousPID.equals(toDisplay)){
                data.clear();
                data.add(new Entry(0,0));
                lineDataSet.clear();
                lineDataSet = new LineDataSet(data, toDisplay);
                data.add(new Entry(lineDataSet.getEntryCount(), value));
                reDesignChart(lineDataSet, toDisplay);
                lineData.clearValues();
                lineData.addDataSet(lineDataSet);
                mChart.setData(lineData);
                lineDataSet.notifyDataSetChanged();
                lineData.notifyDataChanged();
                mChart.notifyDataSetChanged();
                mChart.invalidate();
                System.out.println("Array size");
                System.out.println(lineDataSet.getEntryCount());
                previousPID = toDisplay;
            }


            if (messages.length() >= 38) {
                messages.setLength(0);
            }
        }
    };

    protected  void reDesignChart(LineDataSet toChange, String str){
        toChange.setAxisDependency(YAxis.AxisDependency.LEFT);
        toChange.setLineWidth(1f);
        toChange.setHighlightEnabled(false);
        toChange.setDrawValues(false);
        toChange.setDrawCircles(false);
        switch (str){
            case "ENGINE COOLANT TEMP":
                leftAxis.setAxisMaximum(100f);
                leftAxis.setAxisMinimum(30f);
                break;
            case "VEHICLE SPEED":
                leftAxis.setAxisMaximum(200f);
                leftAxis.setAxisMinimum(0f);
                break;
            case "ENGINE RPM":
                leftAxis.setAxisMaximum(9000f);
                leftAxis.setAxisMinimum(0f);
                break;
            case "FUEL PRESSURE":
                leftAxis.setAxisMaximum(100f);
                leftAxis.setAxisMinimum(0f);
                break;
            default:
                leftAxis.setAxisMaximum(200f);
                leftAxis.setAxisMinimum(0f);
                break;
        }

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

        if (thread != null) {
            thread.interrupt();
        }
        LocalBroadcastManager.getInstance(this).unregisterReceiver(mReceiver);
    }

    @Override
    protected void onDestroy() {
        // thread.interrupt();
        super.onDestroy();
    }
}