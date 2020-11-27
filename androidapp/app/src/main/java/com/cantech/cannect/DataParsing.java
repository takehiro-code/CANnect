package com.cantech.cannect;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
//import android.support.v4.app.ActivityCompat; // no longer support
//import android.support.v4.content.ContextCompat; // no longer support
//import android.support.v7.app.AppCompatActivity; // no longer support
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.Set;
import java.util.UUID;

// added library to resolve "Cannot Resolve Symbol" Error
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.core.app.ActivityCompat;


public class DataParsing extends AppCompatActivity{
    private static final String FUEL_STATUS = "03";
    private static final String ENGINE_COOLANT_TEMP = "05";
    private static final String FUEL_PRESSURE = "0A";
    private static final String ENGINE_RPM = "0C";
    private static final String VEHICLE_SPEED = "0D";
    private static final String MAF_SENSOR = "10";
    private static final String THROTTLE = "11";
    private static final String O2_VOLTAGE = "14";

    public static final String FUEL_STATUS_STRING = "FUEL STATUS";
    public static final String ENGINE_COOLANT_TEMP_STRING = "ENGINE COOLANT TEMP";
    public static final String FUEL_PRESSURE_STRING = "FUEL PRESSURE";
    public static final String ENGINE_RPM_STRING = "ENGINE RPM";
    public static final String VEHICLE_SPEED_STRING = "VEHICLE SPEED";
    public static final String MAF_SENSOR_STRING = "MAF SENSOR";
    public static final String THROTTLE_STRING = "THROTTLE";
    public static final String O2_VOLTAGE_STRING = "O2 VOLTAGE";

    public static final String PID_CURRENT_DATA = "41";
    public static final String PID_FREEZE_DATA = "42";

    //sensor data
    public static final String acc_x = "acc_x";
    public static final String acc_y = "acc_y";
    public static final String acc_z = "acc_z";
    public static final String pitch = "pitch";
    public static final String roll = "roll";
    public static final String yaw = "yaw";

    // OBD2 Stub Function for different Modes
    // Input a set of 8 segments separated by space (eg. "00 00 00 00 00 00 00 00")
    // Return: User friendly format (Name of field and actual value)
    public static String[] convertOBD2FrameToUserFormat(String obd2message){
        String[] splitobd2msg = obd2message.split("\\s+");
        // CAN ID: ix=0
        // # bytes: ix=1
        // Mode: ix=2
        // OBD2 PID: ix=3
        // OBD2 Data: ix=4 to 7
        // END: ix=8
        String[] result = {"",""};
        //added try-except clause because sometimes the incoming messages are weird characters
        //this may not be the case with a real car - need to test and see
        try {
            //sensor data conversion
            String[] splitdatamsg = obd2message.split(" ");
            switch (splitdatamsg[0]) {
                case acc_x:
                    result[0] = acc_x;
                    result[1] = splitdatamsg[1];
                    System.out.println("result[0]");
                    System.out.println(result[0]);
                    System.out.println(result[1]);
                    return result;
                case acc_y:
                    result[0] = acc_y;
                    result[1] = splitdatamsg[1];
                    return result;
                case acc_z:
                    result[0] = acc_z;
                    result[1] = splitdatamsg[1];
                    return result;
                case pitch:
                    result[0] = pitch;
                    result[1] = splitdatamsg[1];
                    return result;
                case roll:
                    result[0] = roll;
                    result[1] = splitdatamsg[1];
                    return result;
                case yaw:
                    result[0] = yaw;
                    result[1] = splitdatamsg[1];
                    return result;
                default:
                    result[0] = "UNDEFINED";
                    result[1] = "UNDEFINED";
            }
            //obd2 data
            switch (splitobd2msg[2]) {
                case PID_CURRENT_DATA:
                    result = convertOBD2PIDToUserFormat(splitobd2msg);
                    break;
                case PID_FREEZE_DATA:
                    result = convertOBD2PIDToUserFormat(splitobd2msg);
                    break;
                default:
                    result[0] = "UNDEFINED";
                    result[1] = "UNDEFINED";
            }
            System.out.println(result[0]);
            System.out.println(result[1]);
            return result;
        }catch (Exception e){
            result[0] = "UNDEFINED";
            result[1] = "UNDEFINED";
            return result;
        }
    }

    // OBD2 Mode 1 and 2 PID Converter
    // Space separated array of strings containing OBD2 Message
    // Return: User friendly format (Name of field and actual value)
    private static String[] convertOBD2PIDToUserFormat(String[] splitobd2msg)
    {
        String[] result = {"",""};
        float convertA = (float) (Integer.parseInt(splitobd2msg[4], 16));
        float convertB = (float) (Integer.parseInt(splitobd2msg[5], 16));
        switch(splitobd2msg[3])
        {
            case FUEL_STATUS:
                result[0] = FUEL_STATUS_STRING;
                result[1] = splitobd2msg[4]; // NEED BETTER SYSTEM TO ORGANIZE THIS
                break;
            case ENGINE_COOLANT_TEMP:
                result[0] = ENGINE_COOLANT_TEMP_STRING;
                result[1] = Integer.toString(Integer.parseInt(splitobd2msg[4], 16) - 40);
                break;
            case FUEL_PRESSURE:
                result[0] = FUEL_PRESSURE_STRING;
                result[1] = Integer.toString(Integer.parseInt(splitobd2msg[4], 16) *3);
                break;
            case ENGINE_RPM:
                result[0] = ENGINE_RPM_STRING;
                System.out.println(convertA);
                System.out.println(convertB);
                result[1] = Float.toString(((convertA * 256) + convertB )/ 4.000f);
                break;
            case VEHICLE_SPEED:
                result[0] = VEHICLE_SPEED_STRING;
                result[1] = Integer.toString(Integer.parseInt(splitobd2msg[4], 16));
                break;
            case MAF_SENSOR:
                result[0] = MAF_SENSOR_STRING;
                result[1] = Float.toString(((convertA * 256) + convertB) / 100.000f);
                break;
            case THROTTLE:
                result[0] = THROTTLE_STRING;
                result[1] = Float.toString(convertA * (100.0000f/256.000f));
                break;
            case O2_VOLTAGE:
                result[0] = O2_VOLTAGE_STRING;
                result[1] = Float.toString(convertA / 255.000f);
                break;
            default:
                result[0] = "UNDEFINED: " + splitobd2msg[3];
                result[1] = "UNDEFINED: " + splitobd2msg[4] + " " + splitobd2msg[5] + " " + splitobd2msg[6] + " " + splitobd2msg[7];
        }

        return result;
    }

    public static String convertBufferToSingleOBD2String(String[] bufferOutput)
    {
        String outputString = "";
        for (int i = 0; i < (bufferOutput.length); i++)
        {
            outputString += bufferOutput[i];
            if ((i + 1) != bufferOutput.length)
            {
                outputString += " ";
            }
            // Don't copy FF FF delimiters
            if (bufferOutput.length >= 9)
            {
                break;
            }
        }
        return outputString;
    }

    private static String[] convertSensorData(String[] splitobd2msg) {
        String[] result = {"", ""};
        switch (splitobd2msg[0]) {
            case acc_x:
                result[0] = acc_x;
                result[1] = splitobd2msg[1];
                break;
            case acc_y:
                result[0] = acc_y;
                result[1] = splitobd2msg[1];
                break;
            case acc_z:
                result[0] = acc_z;
                result[1] = splitobd2msg[1];
                break;
            case pitch:
                result[0] = pitch;
                result[1] = splitobd2msg[1];
                break;
            case roll:
                result[0] = roll;
                result[1] = splitobd2msg[1];
                break;
            case yaw:
                result[0] = yaw;
                result[1] = splitobd2msg[1];
                break;
            default:
                result[0] = "UNDEFINED";
                result[1] = "UNDEFINED";
        }
        return result;
    }
}
