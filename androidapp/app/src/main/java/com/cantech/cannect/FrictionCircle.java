package com.cantech.cannect;

import androidx.appcompat.app.AppCompatActivity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.View;

import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

public class FrictionCircle extends AppCompatActivity {
    String messages;
    DataParsing dataParsing;
    String outerText = "1.5g";
    String centerText = "1.0g";
    String innerText = "0.5g";
    String[] data_S = {"", "", ""};//acc-x,acc-y,acc-z respectively
    double[] data_D = {0.0, 0.0, 0.0};//acc-x,acc-y,acc-z respectively
    double pitch = 0.0;
    double roll = 0.0;
    boolean isInvalidate = false;
    int width;
    int height;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(new MyView(this));
    }

    public class MyView extends View {
        public MyView(Context context) {
            super(context);
            invalidate();//recalls onDraw
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (!isInvalidate) {
                int x = getWidth();
                int y = getHeight();
                width = x;
                height = y;
                int radius = 600;
                Paint paint2 = new Paint();//canvas
                paint2.setColor(Color.WHITE);
                paint2.setStyle(Paint.Style.FILL);
                canvas.drawPaint(paint2);
                Paint paint = new Paint();//cirlce lines
                paint.setColor(Color.BLACK);
                paint.setStrokeWidth(3);
                paint.setStyle(Paint.Style.STROKE);
                canvas.drawCircle(x / 2, y / 2, radius, paint);
                canvas.drawCircle(x / 2, y / 2, radius * 2 / 3, paint);
                canvas.drawCircle(x / 2, y / 2, radius / 3, paint);

                int textSize = 60;
                int text_x;
                int text_y;
                paint.setColor(Color.BLACK);//outer circle text
                paint.setTextSize(textSize);
                Rect bounds = new Rect();
                paint.getTextBounds(outerText, 0, outerText.length(), bounds);
                int text_height = bounds.height();
                int text_width = bounds.width();
                text_x = x / 2 - text_width / 2;
                text_y = y / 2 - radius;
                canvas.drawText(outerText, text_x, text_y, paint);

                paint.setColor(Color.BLACK);//center circle text
                paint.setTextSize(textSize);
                paint.getTextBounds(centerText, 0, centerText.length(), bounds);
                text_height = bounds.height();
                text_width = bounds.width();
                text_x = x / 2 - text_width / 2;
                text_y += radius / 3;
                canvas.drawText(centerText, text_x, text_y, paint);

                paint.setColor(Color.BLACK);//inner circle text
                paint.setTextSize(textSize);
                paint.getTextBounds(innerText, 0, innerText.length(), bounds);
                text_height = bounds.height();
                text_width = bounds.width();
                text_x = x / 2 - text_width / 2;
                text_y += radius / 3;
                canvas.drawText(innerText, text_x, text_y, paint);
            }else {
                // Draw one point in pixel.
                Paint paint = new Paint();
                paint.setColor(Color.RED);
                float fx = (float)(data_D[0])+width/2;
                float fy = (float)(data_D[0])+height/2;
                canvas.drawPoint(fx, fy, paint);
                /*

                Paint paint = new Paint();
                paint.setColor(Color.RED);
                paint.setStyle(Paint.Style.FILL);
                float fx = (float)(data_D[0]);
                float fy = (float)(data_D[0]);
                canvas.drawCircle(fx, fy, 50, paint);
                 */
                isInvalidate = false;
            }
        }
    }

    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String text = intent.getStringExtra("theMessage");
            messages += text;
            String[] parsed = dataParsing.convertOBD2FrameToUserFormat(messages.substring(0, messages.length() - 10));//remove  \n255255\r\n and then parse

            switch (parsed[0])
            {
                case "6DOF":
                    data_S = parsed[1].split(",");
                    data_D[0] = Double.parseDouble(data_S[0]) / 9.81;
                    data_D[1] = Double.parseDouble(data_S[1]) / 9.81;
                    data_D[2] = Double.parseDouble(data_S[2]) / 9.81;
                    // apply trigonometry to get the pitch and roll
                    pitch = Math.atan(data_D[0] / sqrt(pow(data_D[1], 2) + pow(data_D[2], 2)));
                    roll = Math.atan(data_D[1] / sqrt(pow(data_D[0], 2) + pow(data_D[2], 2)));
                    //convert radians into degrees
                    pitch = pitch * (180.0 / 3.14);
                    roll = roll * (180.0 / 3.14);
                    String pitch_S = String.valueOf(pitch);
                    String roll_S = String.valueOf(roll);
                    isInvalidate = true;
                    MyView myView = new MyView(null);//redraw the point
                    break;
                default:
                    System.out.println("default");
            }
        }
    };
}