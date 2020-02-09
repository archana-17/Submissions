package com.example.android.travia;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        getSupportActionBar().hide();

        new Handler().postDelayed(new Runnable(){

          @Override
            public void run() {
              Intent homeIntent = new Intent(SplashActivity.this, Login.class);
                      startActivity(homeIntent);
          }
        },2500);



    }
}
