package com.keepassdroid;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import com.keepassdroid.app.App;
import com.keepassdroid.compat.BackupManagerCompat;
import com.keepassdroid.compat.ClipDataCompat;
import com.keepassdroid.compat.EditorCompat;
import com.keepassdroid.compat.StorageAF;
import com.keepassdroid.database.edit.LoadDB;
import com.keepassdroid.database.edit.OnFinish;
import com.keepassdroid.dialog.PasswordEncodingDialogHelper;
import com.keepassdroid.fileselect.BrowserDialog;
import com.keepassdroid.settings.AppSettingsActivity;
import com.keepassdroid.utils.EmptyUtils;
import com.keepassdroid.utils.Interaction;
import com.keepassdroid.utils.UriUtil;
import com.keepassdroid.utils.Util;

import java.io.File;
import java.io.FileNotFoundException;

public class PasswordActivity
        extends LockingActivity {
    public static final int GET_CONTENT = 257;
    public static final String KEY_DEFAULT_FILENAME = "defaultFileName";
    private static final int FILE_BROWSE = 256;
    private static final String KEY_FILENAME = "fileName";
    private static final String KEY_KEYFILE = "keyFile";
    private static final String KEY_LAUNCH_IMMEDIATELY = "launchImmediately";
    private static final String KEY_PASSWORD = "password";
    private static final int OPEN_DOC = 258;
    private static final String VIEW_INTENT = "android.intent.action.VIEW";

    static {
        if (!PasswordActivity.class.desiredAssertionStatus()) {
        }
        for (boolean bool = true; ; bool = false) {
            $assertionsDisabled = bool;
            return;
        }
    }

    SharedPreferences prefs;
    private Uri mDbUri = null;
    private Uri mKeyUri = null;
    private boolean mRememberKeyfile;

    public static void Launch(Activity paramActivity, String paramString)
            throws FileNotFoundException {
        Launch(paramActivity, paramString, "");
    }

    public static void Launch(Activity paramActivity, String paramString1, String paramString2)
            throws FileNotFoundException {
        if (EmptyUtils.isNullOrEmpty(paramString1)) {
            throw new FileNotFoundException();
        }
        Object localObject = UriUtil.parseDefaultFile(paramString1);
        String str = ((Uri) localObject).getScheme();
        if ((!EmptyUtils.isNullOrEmpty(str)) && (str.equalsIgnoreCase("file")) && (!new File(((Uri) localObject).getPath()).exists())) {
            throw new FileNotFoundException();
        }
        localObject = new Intent(paramActivity, PasswordActivity.class);
        ((Intent) localObject).putExtra("fileName", paramString1);
        ((Intent) localObject).putExtra("keyFile", paramString2);
        paramActivity.startActivityForResult((Intent) localObject, 0);
    }

    private void errorMessage(int paramInt) {
        Toast.makeText(this, paramInt, 1).show();
    }

    private String getEditText(int paramInt) {
        return Util.getEditText(this, paramInt);
    }

    private Uri getKeyFile(Uri paramUri) {
        if (this.mRememberKeyfile) {
            return App.getFileHistory().getFileByName(paramUri);
        }
        return null;
    }

    private void loadDatabase(String paramString, Uri paramUri) {
        if ((paramString.length() == 0) && ((paramUri == null) || (paramUri.toString().length() == 0))) {
            errorMessage(2131099712);
            return;
        }
        Database localDatabase = App.getDB();
        localDatabase.clear();
        App.clearShutdown();
        Handler localHandler = new Handler();
        new ProgressTask(this, new LoadDB(localDatabase, this, this.mDbUri, paramString, paramUri, new AfterLoad(localHandler, localDatabase)), 2131099740).run();
    }

    private void loadDatabase(String paramString1, String paramString2) {
        loadDatabase(paramString1, UriUtil.parseDefaultFile(paramString2));
    }

    private void populateView() {
        if (this.mDbUri == null) {
            str = "";
            setEditText(2131427434, str);
            if (this.mKeyUri != null) {
                break label46;
            }
        }
        label46:
        for (String str = ""; ; str = this.mKeyUri.toString()) {
            setEditText(2131427437, str);
            return;
            str = this.mDbUri.toString();
            break;
        }
    }

    private void retrieveSettings() {
        String str = this.prefs.getString("defaultFileName", "");
        if ((!EmptyUtils.isNullOrEmpty(this.mDbUri.getPath())) && (UriUtil.equalsDefaultfile(this.mDbUri, str))) {
            ((CheckBox) findViewById(2131427435)).setChecked(true);
        }
    }

    private void setEditText(int paramInt, String paramString) {
        TextView localTextView = (TextView) findViewById(paramInt);
        assert (localTextView == null);
        if (localTextView != null) {
            localTextView.setText(paramString);
        }
    }

    protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent) {
        super.onActivityResult(paramInt1, paramInt2, paramIntent);
        switch (paramInt1) {
        }
        do {
            do {
                do {
                    do {
                        return;
                        setEditText(2131427404, "");
                        App.getDB().clear();
                        return;
                        setResult(1);
                        setEditText(2131427404, "");
                        finish();
                        App.getDB().clear();
                        return;
                    } while (paramInt2 != -1);
                    paramIntent = paramIntent.getDataString();
                } while (paramIntent == null);
                ((EditText) findViewById(2131427437)).setText(paramIntent);
                this.mKeyUri = UriUtil.parseDefaultFile(paramIntent);
                return;
            } while ((paramInt2 != -1) || (paramIntent == null));
            localObject = paramIntent.getData();
        } while (localObject == null);
        paramIntent = (Intent) localObject;
        if (paramInt1 == 257) {
            paramIntent = UriUtil.translate(this, (Uri) localObject);
        }
        Object localObject = paramIntent.toString();
        if (localObject != null) {
            ((EditText) findViewById(2131427437)).setText((CharSequence) localObject);
        }
        this.mKeyUri = paramIntent;
    }

    protected void onCreate(Bundle paramBundle) {
        super.onCreate(paramBundle);
        paramBundle = getIntent();
        this.prefs = PreferenceManager.getDefaultSharedPreferences(this);
        this.mRememberKeyfile = this.prefs.getBoolean(getString(2131099838), getResources().getBoolean(2131230720));
        setContentView(2130903062);
        new InitTask(null).execute(new Intent[]{paramBundle});
    }

    public boolean onCreateOptionsMenu(Menu paramMenu) {
        super.onCreateOptionsMenu(paramMenu);
        getMenuInflater().inflate(2131361796, paramMenu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem paramMenuItem) {
        switch (paramMenuItem.getItemId()) {
            default:
                return super.onOptionsItemSelected(paramMenuItem);
            case 2131427449:
                new AboutDialog(this).show();
                return true;
        }
        AppSettingsActivity.Launch(this);
        return true;
    }

    protected void onResume() {
        super.onResume();
        if (App.isShutdown()) {
            ((TextView) findViewById(2131427404)).setText("");
        }
        App.clearShutdown();
    }

    private final class AfterLoad
            extends OnFinish {
        private Database db;

        public AfterLoad(Handler paramHandler, Database paramDatabase) {
            super();
            this.db = paramDatabase;
        }

        public void run() {
            if (this.db.passwordEncodingError) {
                new PasswordEncodingDialogHelper().show(PasswordActivity.this, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt) {
                        GroupActivity.Launch(PasswordActivity.this);
                    }
                });
                return;
            }
            if (this.mSuccess) {
                GroupActivity.Launch(PasswordActivity.this);
                return;
            }
            displayMessage(PasswordActivity.this);
        }
    }

    private class DefaultCheckChange
            implements CompoundButton.OnCheckedChangeListener {
        private DefaultCheckChange() {
        }

        public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean) {
            if (paramBoolean) {
            }
            for (paramCompoundButton = PasswordActivity.this.mDbUri.toString(); ; paramCompoundButton = "") {
                SharedPreferences.Editor localEditor = PasswordActivity.this.prefs.edit();
                localEditor.putString("defaultFileName", paramCompoundButton);
                EditorCompat.apply(localEditor);
                new BackupManagerCompat(PasswordActivity.this).dataChanged();
                return;
            }
        }
    }

    private class InitTask
            extends AsyncTask<Intent, Void, Integer> {
        boolean launch_immediately = false;
        String password = "";

        private InitTask() {
        }

        protected Integer doInBackground(Intent... paramVarArgs) {
            paramVarArgs = paramVarArgs[0];
            Object localObject = paramVarArgs.getAction();
            if ((localObject != null) && (((String) localObject).equals("android.intent.action.VIEW"))) {
                localObject = paramVarArgs.getData();
                PasswordActivity.access$102(PasswordActivity.this, (Uri) localObject);
                PasswordActivity.access$402(PasswordActivity.this, ClipDataCompat.getUriFromIntent(paramVarArgs, "keyFile"));
                if (localObject == null) {
                    return Integer.valueOf(2131099701);
                }
                if (((Uri) localObject).getScheme().equals("file")) {
                    localObject = ((Uri) localObject).getPath();
                    if (((String) localObject).length() == 0) {
                        return Integer.valueOf(2131099650);
                    }
                    if (!new File((String) localObject).exists()) {
                        return Integer.valueOf(2131099650);
                    }
                    if (PasswordActivity.this.mKeyUri == null) {
                        PasswordActivity.access$402(PasswordActivity.this, PasswordActivity.this.getKeyFile(PasswordActivity.this.mDbUri));
                    }
                    this.password = paramVarArgs.getStringExtra("password");
                    this.launch_immediately = paramVarArgs.getBooleanExtra("launchImmediately", false);
                }
            }
            for (; ; ) {
                return null;
                if (((Uri) localObject).getScheme().equals("content")) {
                    if (PasswordActivity.this.mKeyUri != null) {
                        break;
                    }
                    PasswordActivity.access$402(PasswordActivity.this, PasswordActivity.this.getKeyFile(PasswordActivity.this.mDbUri));
                    break;
                }
                return Integer.valueOf(2131099701);
                PasswordActivity.access$102(PasswordActivity.this, UriUtil.parseDefaultFile(paramVarArgs.getStringExtra("fileName")));
                PasswordActivity.access$402(PasswordActivity.this, UriUtil.parseDefaultFile(paramVarArgs.getStringExtra("keyFile")));
                this.password = paramVarArgs.getStringExtra("password");
                this.launch_immediately = paramVarArgs.getBooleanExtra("launchImmediately", false);
                if ((PasswordActivity.this.mKeyUri == null) || (PasswordActivity.this.mKeyUri.toString().length() == 0)) {
                    PasswordActivity.access$402(PasswordActivity.this, PasswordActivity.this.getKeyFile(PasswordActivity.this.mDbUri));
                }
            }
        }

        public void onPostExecute(Integer paramInteger) {
            if (paramInteger != null) {
                Toast.makeText(PasswordActivity.this, paramInteger.intValue(), 1).show();
                PasswordActivity.this.finish();
            }
            do {
                return;
                PasswordActivity.this.populateView();
                ((Button) PasswordActivity.this.findViewById(2131427438)).setOnClickListener(new PasswordActivity.OkClickHandler(PasswordActivity.this, null));
                ((CheckBox) PasswordActivity.this.findViewById(2131427439)).setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                    public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean) {
                        paramAnonymousCompoundButton = (TextView) PasswordActivity.this.findViewById(2131427404);
                        if (paramAnonymousBoolean) {
                            paramAnonymousCompoundButton.setInputType(145);
                            return;
                        }
                        paramAnonymousCompoundButton.setInputType(129);
                    }
                });
                if (this.password != null) {
                    ((TextView) PasswordActivity.this.findViewById(2131427404)).setText(this.password);
                }
                ((CheckBox) PasswordActivity.this.findViewById(2131427435)).setOnCheckedChangeListener(new PasswordActivity.DefaultCheckChange(PasswordActivity.this, null));
                ((ImageButton) PasswordActivity.this.findViewById(2131427397)).setOnClickListener(new View.OnClickListener() {
                    private void lookForOpenIntentsFilePicker() {
                        if (Interaction.isIntentAvailable(PasswordActivity.this, "org.openintents.action.PICK_FILE")) {
                            Intent localIntent = new Intent("org.openintents.action.PICK_FILE");
                            for (; ; ) {
                                try {
                                    if ((PasswordActivity.this.mDbUri != null) && (PasswordActivity.this.mDbUri.toString().length() > 0) && (PasswordActivity.this.mDbUri.getScheme().equals("file"))) {
                                        File localFile = new File(PasswordActivity.this.mDbUri.getPath()).getParentFile();
                                        if (localFile != null) {
                                            localIntent.setData(Uri.parse("file://" + localFile.getAbsolutePath()));
                                        }
                                    }
                                } catch (Exception localException) {
                                    continue;
                                }
                                try {
                                    PasswordActivity.this.startActivityForResult(localIntent, 256);
                                    return;
                                } catch (ActivityNotFoundException localActivityNotFoundException) {
                                    showBrowserDialog();
                                    return;
                                }
                            }
                        }
                        showBrowserDialog();
                    }

                    private void showBrowserDialog() {
                        new BrowserDialog(PasswordActivity.this).show();
                    }

                    public void onClick(View paramAnonymousView) {
                        if (StorageAF.useStorageFramework(PasswordActivity.this)) {
                            paramAnonymousView = new Intent(StorageAF.ACTION_OPEN_DOCUMENT);
                            paramAnonymousView.addCategory("android.intent.category.OPENABLE");
                            paramAnonymousView.setType("*/*");
                            PasswordActivity.this.startActivityForResult(paramAnonymousView, 258);
                            return;
                        }
                        paramAnonymousView = new Intent("android.intent.action.GET_CONTENT");
                        paramAnonymousView.addCategory("android.intent.category.OPENABLE");
                        paramAnonymousView.setType("*/*");
                        try {
                            PasswordActivity.this.startActivityForResult(paramAnonymousView, 257);
                            return;
                        } catch (ActivityNotFoundException paramAnonymousView) {
                            lookForOpenIntentsFilePicker();
                        }
                    }
                });
                PasswordActivity.this.retrieveSettings();
            } while (!this.launch_immediately);
            PasswordActivity.this.loadDatabase(this.password, PasswordActivity.this.mKeyUri);
        }
    }

    private class OkClickHandler
            implements View.OnClickListener {
        private OkClickHandler() {
        }

        public void onClick(View paramView) {
            paramView = PasswordActivity.this.getEditText(2131427404);
            String str = PasswordActivity.this.getEditText(2131427437);
            PasswordActivity.this.loadDatabase(paramView, str);
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/PasswordActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */