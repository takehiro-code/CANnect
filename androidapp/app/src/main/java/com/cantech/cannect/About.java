package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;

import android.os.Bundle;

public class About extends AppCompatActivity {
    SharedPref sharedPref;
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
        setContentView(R.layout.activity_about);

        getSupportActionBar().setTitle("About");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }
}