package com.home.websites;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.GridLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {

    static final String SILK = "com.amazon.cloud9";

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.rgb(16, 18, 24));
        root.setPadding(dp(64), dp(40), dp(64), dp(40));

        TextView title = new TextView(this);
        title.setText("Websites");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 34);
        title.setPadding(dp(8), 0, 0, dp(24));
        root.addView(title);

        GridLayout grid = new GridLayout(this);
        grid.setColumnCount(3);
        root.addView(grid);

        // fit 3 per row whatever the screen size
        int cellW = (getResources().getDisplayMetrics().widthPixels - dp(128)) / 3 - dp(20);

        Button first = null;
        for (String line : getResources().getStringArray(R.array.sites)) {
            String[] parts = line.split("[|]", 2);
            if (parts.length < 2) continue;
            Button btn = makeButton(parts[0].trim(), parts[1].trim());
            GridLayout.LayoutParams lp = new GridLayout.LayoutParams();
            lp.width = cellW;
            lp.height = dp(120);
            lp.setMargins(dp(10), dp(10), dp(10), dp(10));
            grid.addView(btn, lp);
            if (first == null) first = btn;
        }

        setContentView(root);
        if (first != null) first.requestFocus();
    }

    Button makeButton(String name, final String url) {
        Button btn = new Button(this);
        btn.setText(name);
        btn.setAllCaps(false);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 26);
        btn.setGravity(Gravity.CENTER);
        btn.setFocusable(true);
        btn.setStateListAnimator(null);

        // dim when idle, bright + outlined when the remote is on it
        StateListDrawable bg = new StateListDrawable();
        bg.addState(new int[]{android.R.attr.state_focused}, box(Color.rgb(235, 238, 245), Color.WHITE));
        bg.addState(new int[]{android.R.attr.state_pressed}, box(Color.rgb(200, 205, 215), Color.WHITE));
        bg.addState(new int[]{}, box(Color.rgb(40, 44, 54), Color.rgb(40, 44, 54)));
        btn.setBackground(bg);
        btn.setTextColor(new android.content.res.ColorStateList(
                new int[][]{{android.R.attr.state_focused}, {}},
                new int[]{Color.rgb(16, 18, 24), Color.WHITE}));

        btn.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            public void onFocusChange(View v, boolean has) {
                v.animate().scaleX(has ? 1.06f : 1f).scaleY(has ? 1.06f : 1f).setDuration(120).start();
            }
        });
        btn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) { open(url); }
        });
        return btn;
    }

    GradientDrawable box(int fill, int stroke) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(fill);
        d.setCornerRadius(dp(14));
        d.setStroke(dp(3), stroke);
        return d;
    }

    void open(String url) {
        // "app:com.some.package" opens an installed app instead of a site
        if (url.startsWith("app:")) {
            String pkg = url.substring(4);
            Intent app = getPackageManager().getLeanbackLaunchIntentForPackage(pkg);
            if (app == null) app = getPackageManager().getLaunchIntentForPackage(pkg);
            if (app != null) {
                app.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(app);
            } else {
                Toast.makeText(this, "App not installed", Toast.LENGTH_LONG).show();
            }
            return;
        }
        Intent i = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        i.setPackage(SILK);
        try {
            startActivity(i);
        } catch (ActivityNotFoundException e) {
            // silk missing? try whatever browser is there
            i.setPackage(null);
            try {
                startActivity(i);
            } catch (ActivityNotFoundException e2) {
                Toast.makeText(this, "No browser found", Toast.LENGTH_LONG).show();
            }
        }
    }

    int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }
}
