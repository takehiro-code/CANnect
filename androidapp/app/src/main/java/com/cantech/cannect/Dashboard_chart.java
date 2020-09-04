
//References https://youtu.be/a20EchSQgpw   https://youtu.be/QEbljbZ4dNs
package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;

import com.google.android.gms.common.server.converter.StringToIntConverter;
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
import android.widget.ListView;
import android.widget.Toast;


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

    private BluetoothSocket mBTSocket = null;
    private BTCommunication.ConnectedThread mConnectedThread;

    ArrayList<Data> dataArrayList;
    StringBuilder messages;
    Data FUEL_STATUS;
    Data ENGINE_COOLANT_TEMP;
    Data FUEL_PRESSURE;
    Data ENGINE_RPM;
    Data VEHICLE_SPEED;
    Data MAF_SENSOR;
    Data THROTTLE;
    Data O2_VOLTAGE;
    DataParsing dataParsing;

    private LineChart mChart;
    private Thread thread;
    private boolean plotData = true;
    private Button mButton;
    ArrayList<Entry> datavals;
    ArrayList<Integer> btdata;
    ArrayList<ILineDataSet> line_dataSet;
    LineDataSet dataset;
    LineData data;
    ArrayList<ILineDataSet> linedata;
    int i = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard_chart);

        getSupportActionBar().setTitle("Dashboard");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        messages = new StringBuilder();
        dataParsing = new DataParsing();

        datavals = new ArrayList<Entry>();
        btdata = new ArrayList<Integer>();
        line_dataSet = new ArrayList<>();

        mChart = (LineChart) findViewById(R.id.chart1);

        datavals.add(new Entry(0,0));
        dataset = new LineDataSet(datavals, "Speed");
        line_dataSet.add(dataset);
        data = new LineData(line_dataSet);

        mChart.setTouchEnabled(true);
        mChart.setHighlightPerTapEnabled(true);

        mChart.setDragEnabled(true);
        mChart.setScaleEnabled(true);
        mChart.setDrawGridBackground(false);
        mChart.setPinchZoom(true);

        mChart.setBackgroundColor(Color.WHITE);
        mChart.setDrawBorders(true);

        data.setValueTextColor(Color.RED);
        mChart.setDrawGridBackground(true);

        //setup axis and legends
        Legend legend = mChart.getLegend();
        legend.setForm(Legend.LegendForm.LINE);
        legend.setTextColor(Color.WHITE);

        XAxis xaxis = mChart.getXAxis();
        xaxis.setTextColor(Color.BLACK);
        xaxis.setDrawGridLines(false);
        xaxis.setAvoidFirstLastClipping(true);

        YAxis lefty = mChart.getAxisLeft();
        lefty.setTextColor(Color.BLACK);
        lefty.setDrawGridLines(true);
        lefty.setAxisMinimum(0f);
        lefty.setAxisMaximum(150f);

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
            String text = intent.getStringExtra("theMessage");
            messages.append(text + "\n");
            String[] parsed;
            parsed = dataParsing.convertOBD2FrameToUserFormat(messages.toString());

            switch (parsed[0]){
                case "VEHICLE_SPEED":
                    dataset.addEntry(new Entry(++i, Float.parseFloat(parsed[1])));
                    data.addDataSet(dataset);
                    mChart.setData(data);
                    mChart.invalidate(); // refresh
                    break;
                default:
                    break;
            }
            if (messages.length() >= 38) {
                messages.setLength(0);
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