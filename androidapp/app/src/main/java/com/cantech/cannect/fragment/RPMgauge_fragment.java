package com.cantech.cannect.fragment;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.cantech.cannect.DataParsing;
import com.cantech.cannect.R;
import com.cantech.cannect.SharedPref;
import com.github.anastr.speedviewlib.TubeSpeedometer;
import com.github.anastr.speedviewlib.components.Section;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link RPMgauge_fragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class RPMgauge_fragment extends Fragment {
    private static final String TAG = "RPMgauge";
    private Context mContext;
    private DataParsing dataParsing;
    SharedPref sharedPref;
    private StringBuilder data_message;
    TubeSpeedometer engineRPM;
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    public interface FromRPMGauge{
        void sendRPMPID(String string);
    }

    FromRPMGauge mCallback;
    public RPMgauge_fragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment RPMgauge_fragment.
     */
    // TODO: Rename and change types and number of parameters
    public static RPMgauge_fragment newInstance(String param1, String param2) {
        RPMgauge_fragment fragment = new RPMgauge_fragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        mContext = context;
        if (context instanceof FromRPMGauge) {
            mCallback = (FromRPMGauge) context;
        } else {
            throw new ClassCastException(context.toString() + "must implement sendRPMPID");

        }
        LocalBroadcastManager.getInstance(mContext).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        sharedPref = new SharedPref(mContext);
        //set theme
        if(sharedPref.loadDarkModeState()==true){
            mContext.getTheme().applyStyle(R.style.darkTheme, true);
        }else{

            mContext.getTheme().applyStyle(R.style.AppTheme, true);
        }
        super.onCreate(savedInstanceState);
        data_message = new StringBuilder();
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_rpmgauge, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        engineRPM = (TubeSpeedometer) view.findViewById(R.id.RPMView);
        // change MAX speed to x 1K
        engineRPM.setMaxSpeed(9);
        // set or remove 3D Effects.
        engineRPM.clearSections();
        engineRPM.addSections(
                new Section(0f, 0.8f, Color.GREEN),
                new Section(0.8f, 1f, Color.RED)
        );
        engineRPM.setSpeedometerWidth(30);
        engineRPM.setTickPadding(15);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    @Override
    public void onResume() {
        LocalBroadcastManager.getInstance(mContext).registerReceiver(mReceiver, new IntentFilter("incomingMessage"));
        super.onResume();
    }

    @Override
    public void onPause() {
        LocalBroadcastManager.getInstance(mContext).unregisterReceiver(mReceiver);
        super.onPause();
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mContext = null;
        mCallback = null;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
    }

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //needs to be modified, received value is a string. also add multiple datasets
            String text = intent.getStringExtra("theMessage");
            data_message.append(text + "\n");

            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(data_message.toString());
            try {
                switch (parsed[0]) {
                    case "ENGINE RPM":
                        //changing string to float.
                        engineRPM.speedTo(Float.parseFloat(parsed[1]) / 1000.00f);
                        break;
                    default:
                        //mCallback.sendRPMPID("0C");
                        break;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (data_message.length() >= 32) {
                data_message.setLength(0);
            }
        }
    };
}