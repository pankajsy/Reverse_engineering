package com.keepassdroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Toast;

import com.keepassdroid.password.PasswordGenerator;

public class GeneratePasswordActivity
        extends LockCloseActivity {
    private static final int[] BUTTON_IDS = {2131427410, 2131427409, 2131427408, 2131427407};
    private View.OnClickListener lengthButtonsListener = new View.OnClickListener() {
        public void onClick(View paramAnonymousView) {
            paramAnonymousView = (Button) paramAnonymousView;
            ((EditText) GeneratePasswordActivity.this.findViewById(2131427411)).setText(paramAnonymousView.getText());
        }
    };

    public static void Launch(Activity paramActivity) {
        paramActivity.startActivityForResult(new Intent(paramActivity, GeneratePasswordActivity.class), 0);
    }

    private void fillPassword() {
        ((EditText) findViewById(2131427404)).setText(generatePassword());
    }

    public String generatePassword() {
        try {
            int i = Integer.valueOf(((EditText) findViewById(2131427411)).getText().toString()).intValue();
            ((CheckBox) findViewById(2131427412)).isChecked();
            String str = new PasswordGenerator(this).generatePassword(i, ((CheckBox) findViewById(2131427412)).isChecked(), ((CheckBox) findViewById(2131427413)).isChecked(), ((CheckBox) findViewById(2131427414)).isChecked(), ((CheckBox) findViewById(2131427415)).isChecked(), ((CheckBox) findViewById(2131427416)).isChecked(), ((CheckBox) findViewById(2131427417)).isChecked(), ((CheckBox) findViewById(2131427418)).isChecked(), ((CheckBox) findViewById(2131427419)).isChecked());
            return str;
        } catch (NumberFormatException localNumberFormatException) {
            Toast.makeText(this, 2131099719, 1).show();
            return "";
        } catch (IllegalArgumentException localIllegalArgumentException) {
            Toast.makeText(this, localIllegalArgumentException.getMessage(), 1).show();
        }
        return "";
    }

    protected void onCreate(Bundle paramBundle) {
        int i = 0;
        super.onCreate(paramBundle);
        setContentView(2130903054);
        setResult(0);
        paramBundle = BUTTON_IDS;
        int j = paramBundle.length;
        while (i < j) {
            ((Button) findViewById(paramBundle[i])).setOnClickListener(this.lengthButtonsListener);
            i += 1;
        }
        ((Button) findViewById(2131427405)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View paramAnonymousView) {
                GeneratePasswordActivity.this.fillPassword();
            }
        });
        ((Button) findViewById(2131427400)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View paramAnonymousView) {
                paramAnonymousView = (EditText) GeneratePasswordActivity.this.findViewById(2131427404);
                Intent localIntent = new Intent();
                localIntent.putExtra("com.keepassdroid.password.generated_password", paramAnonymousView.getText().toString());
                GeneratePasswordActivity.this.setResult(1001, localIntent);
                GeneratePasswordActivity.this.finish();
            }
        });
        ((Button) findViewById(2131427401)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View paramAnonymousView) {
                GeneratePasswordActivity.this.setResult(0);
                GeneratePasswordActivity.this.finish();
            }
        });
        fillPassword();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/GeneratePasswordActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */