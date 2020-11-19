package com.cantech.cannect;

import android.content.Context;
import android.content.SharedPreferences;

public class SharedPref {
    SharedPreferences mSharedPref;
    public SharedPref(Context context){
        mSharedPref = context.getSharedPreferences("filename",Context.MODE_PRIVATE);
    }
    public void setDarkModeState(Boolean state){
        SharedPreferences.Editor editor = mSharedPref.edit();
        editor.putBoolean("DarkMode", state);
        editor.commit();
    }
    public Boolean loadDarkModeState(){
        Boolean state = mSharedPref.getBoolean("DarkMode",false);
        return state;
    }
}
