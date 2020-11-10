package com.cantech.cannect;

import android.app.Activity;
import android.app.AlertDialog;
import android.view.LayoutInflater;

import static android.app.AlertDialog.*;

public class ExportLoadingDialog {
    private Activity activity;
    private AlertDialog alertDialog;

    ExportLoadingDialog(Activity myActivity){
        activity = myActivity;
    }
    void startLoadingDialog(){
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);

        LayoutInflater inflater = activity.getLayoutInflater();
        builder.setView(inflater.inflate(R.layout.export_loading_dialog, null));
        alertDialog = builder.create();
        alertDialog.show();
    }
    void stopLoadingDialog(){
        alertDialog.dismiss();
    }

}
