package com.cantech.cannect;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;

public class DTCArrayAdapter extends ArrayAdapter<String> {
    private Context mContext;
    int mResource;

    public DTCArrayAdapter(@NonNull Context context, int resource, ArrayList<String> objects) {
        super(context, resource, objects);
        this.mContext = context;
        this.mResource = resource;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        String dtc = getItem(position);
        LayoutInflater inflater = LayoutInflater.from(mContext);
        convertView = inflater.inflate(mResource, parent, false);

        TextView code = convertView.findViewById(R.id.tvDiagnostics);
        code.setText(dtc);
        return convertView;
    }
}
