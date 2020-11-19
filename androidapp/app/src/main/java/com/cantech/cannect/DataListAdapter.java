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
import java.util.List;

public class DataListAdapter extends ArrayAdapter<Data> {
    private Context mContext;
    int mResource;

    public DataListAdapter(Context context, int resource, ArrayList<Data> objects) {
        super(context, resource, objects);
        this.mContext = context;
        this.mResource = resource;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        String pid =getItem(position).getPid();
        String value = getItem(position).getValue();
        Data data = new Data(pid,value);
        LayoutInflater inflater = LayoutInflater.from(mContext);
        convertView = inflater.inflate(mResource, parent, false);

        TextView tvpid = (TextView) convertView.findViewById(R.id.textView1);
        TextView tvvalue = (TextView) convertView.findViewById(R.id.textView2);
        tvpid.setText(pid);
        tvvalue.setText(value);
        return convertView;
    }
}
