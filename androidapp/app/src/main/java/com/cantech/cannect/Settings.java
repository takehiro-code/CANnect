package com.cantech.cannect;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;

import android.content.Context;
import android.content.Intent;
import android.media.Image;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class Settings extends AppCompatActivity {

    SharedPref sharedPref;
    ListView listView;
    String mTitle[] ={"Preferences & Units", "Car Brand","Help","About","Contact Us"};
    String mDescription[] ={"Preferences & Units Description", "Choose a Car Brand and its OBD2 protocol","Help Description","About Description","Contact Us Description"};
    int Images[]={R.drawable.ic_touch_app,R.drawable.ic_car,R.drawable.ic_help,R.drawable.ic_about,R.drawable.ic_contact};

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
        setContentView(R.layout.activity_settings);

        getSupportActionBar().setTitle("Settings");
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        listView= findViewById(R.id.settings_list);

        MyAdapter adapter = new MyAdapter(this, mTitle, mDescription, Images);
        listView.setAdapter(adapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Intent intent;
                if (i == 0){
                    Toast.makeText(Settings.this, "Preferences", Toast.LENGTH_SHORT).show();
                    intent = new Intent(view.getContext(), Preferences.class);
                    startActivity(intent);
                }
                if (i == 1){
                    Toast.makeText(Settings.this, "Choose a Brand", Toast.LENGTH_SHORT).show();
                    intent = new Intent(view.getContext(), CarBrand.class);
                    startActivity(intent);
                }
                if (i == 2){
                    Toast.makeText(Settings.this, "Help", Toast.LENGTH_SHORT).show();
                    intent = new Intent(view.getContext(), Help.class);
                    startActivity(intent);
                }
                if (i == 3){
                    Toast.makeText(Settings.this, "About", Toast.LENGTH_SHORT).show();
                    intent = new Intent(view.getContext(), About.class);
                    startActivity(intent);
                }
                if (i == 4){
                    Toast.makeText(Settings.this, "Contact", Toast.LENGTH_SHORT).show();
                    intent = new Intent(view.getContext(), Contact.class);
                    startActivity(intent);
                }
            }
        });
    }

    class MyAdapter extends ArrayAdapter<String>{
        Context context;
        String rTitle[];
        String rDescription[];
        int rImgs[];

        MyAdapter(Context c, String title[], String description[], int imgs[]){
            super(c, R.layout.setting_list_row,R.id.mainText, title);
            this.context = c;
            this.rTitle = title;
            this.rDescription = description;
            this.rImgs = imgs;
        }

        @NonNull
        @Override
        public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
            LayoutInflater layoutInflater = (LayoutInflater)getApplicationContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            View row = layoutInflater.inflate(R.layout.setting_list_row, parent, false);
            ImageView imageView = row.findViewById(R.id.setting_list_row_image);
            TextView mmainText = row.findViewById(R.id.mainText);
            TextView msubText = row.findViewById(R.id.subText);

            imageView.setImageResource(rImgs[position]);
            mmainText.setText(rTitle[position]);
            msubText.setText(rDescription[position]);
            return row;
        }
    }
}