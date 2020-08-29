package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class Diagnostics extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_diagnostics);

        getSupportActionBar().setTitle("Diagnostics");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }
}