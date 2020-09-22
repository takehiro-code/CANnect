package com.cantech.cannect.fragment;

import android.graphics.Color;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.cantech.cannect.R;
import com.github.anastr.speedviewlib.TubeSpeedometer;
import com.github.anastr.speedviewlib.components.Section;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link RPMgauge_fragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class RPMgauge_fragment extends Fragment {
    private static final String TAG = "RPMgauge";
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

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
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        Log.d(TAG, "OnCreateView started.");
        // Inflate the layout for this fragment

        View layout = inflater.inflate(R.layout.fragment_rpmgauge, container, false);
        TubeSpeedometer engineRPM = (TubeSpeedometer) layout.findViewById(R.id.RPMView);
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

        return inflater.inflate(R.layout.fragment_rpmgauge, container, false);
    }
}