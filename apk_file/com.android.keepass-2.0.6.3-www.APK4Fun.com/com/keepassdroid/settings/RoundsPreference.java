package com.keepassdroid.settings;

import android.content.Context;
import android.os.Handler;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

import com.keepassdroid.app.App;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.edit.OnFinish;

public class RoundsPreference
        extends DialogPreference {
    private PwDatabase mPM;
    private TextView mRoundsView;

    public RoundsPreference(Context paramContext, AttributeSet paramAttributeSet) {
        super(paramContext, paramAttributeSet);
    }

    public RoundsPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt) {
        super(paramContext, paramAttributeSet, paramInt);
    }

    protected View onCreateDialogView() {
        View localView = super.onCreateDialogView();
        this.mRoundsView = ((TextView) localView.findViewById(2131427343));
        this.mPM = App.getDB().pm;
        long l = this.mPM.getNumRounds();
        this.mRoundsView.setText(Long.toString(l));
        return localView;
    }

    /* Error */
    protected void onDialogClosed(boolean paramBoolean) {
        // Byte code:
        //   0: aload_0
        //   1: iload_1
        //   2: invokespecial 71	android/preference/DialogPreference:onDialogClosed	(Z)V
        //   5: iload_1
        //   6: ifeq +105 -> 111
        //   9: aload_0
        //   10: getfield 38	com/keepassdroid/settings/RoundsPreference:mRoundsView	Landroid/widget/TextView;
        //   13: invokevirtual 75	android/widget/TextView:getText	()Ljava/lang/CharSequence;
        //   16: invokeinterface 80 1 0
        //   21: invokestatic 86	java/lang/Integer:parseInt	(Ljava/lang/String;)I
        //   24: istore_2
        //   25: iload_2
        //   26: istore_3
        //   27: iload_2
        //   28: iconst_1
        //   29: if_icmpge +5 -> 34
        //   32: iconst_1
        //   33: istore_3
        //   34: aload_0
        //   35: getfield 23	com/keepassdroid/settings/RoundsPreference:mPM	Lcom/keepassdroid/database/PwDatabase;
        //   38: invokevirtual 55	com/keepassdroid/database/PwDatabase:getNumRounds	()J
        //   41: lstore 4
        //   43: aload_0
        //   44: getfield 23	com/keepassdroid/settings/RoundsPreference:mPM	Lcom/keepassdroid/database/PwDatabase;
        //   47: iload_3
        //   48: i2l
        //   49: invokevirtual 90	com/keepassdroid/database/PwDatabase:setNumRounds	(J)V
        //   52: new 92	android/os/Handler
        //   55: dup
        //   56: invokespecial 95	android/os/Handler:<init>	()V
        //   59: astore 6
        //   61: new 97	com/keepassdroid/database/edit/SaveDB
        //   64: dup
        //   65: aload_0
        //   66: invokevirtual 101	com/keepassdroid/settings/RoundsPreference:getContext	()Landroid/content/Context;
        //   69: invokestatic 44	com/keepassdroid/app/App:getDB	()Lcom/keepassdroid/Database;
        //   72: new 6	com/keepassdroid/settings/RoundsPreference$AfterSave
        //   75: dup
        //   76: aload_0
        //   77: aload_0
        //   78: invokevirtual 101	com/keepassdroid/settings/RoundsPreference:getContext	()Landroid/content/Context;
        //   81: aload 6
        //   83: lload 4
        //   85: invokespecial 104	com/keepassdroid/settings/RoundsPreference$AfterSave:<init>	(Lcom/keepassdroid/settings/RoundsPreference;Landroid/content/Context;Landroid/os/Handler;J)V
        //   88: invokespecial 107	com/keepassdroid/database/edit/SaveDB:<init>	(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;)V
        //   91: astore 6
        //   93: new 109	com/keepassdroid/ProgressTask
        //   96: dup
        //   97: aload_0
        //   98: invokevirtual 101	com/keepassdroid/settings/RoundsPreference:getContext	()Landroid/content/Context;
        //   101: aload 6
        //   103: ldc 110
        //   105: invokespecial 113	com/keepassdroid/ProgressTask:<init>	(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V
        //   108: invokevirtual 116	com/keepassdroid/ProgressTask:run	()V
        //   111: return
        //   112: astore 6
        //   114: aload_0
        //   115: invokevirtual 101	com/keepassdroid/settings/RoundsPreference:getContext	()Landroid/content/Context;
        //   118: ldc 117
        //   120: iconst_1
        //   121: invokestatic 123	android/widget/Toast:makeText	(Landroid/content/Context;II)Landroid/widget/Toast;
        //   124: invokevirtual 126	android/widget/Toast:show	()V
        //   127: return
        //   128: astore 6
        //   130: aload_0
        //   131: invokevirtual 101	com/keepassdroid/settings/RoundsPreference:getContext	()Landroid/content/Context;
        //   134: ldc 127
        //   136: iconst_1
        //   137: invokestatic 123	android/widget/Toast:makeText	(Landroid/content/Context;II)Landroid/widget/Toast;
        //   140: invokevirtual 126	android/widget/Toast:show	()V
        //   143: aload_0
        //   144: getfield 23	com/keepassdroid/settings/RoundsPreference:mPM	Lcom/keepassdroid/database/PwDatabase;
        //   147: ldc2_w 128
        //   150: invokevirtual 90	com/keepassdroid/database/PwDatabase:setNumRounds	(J)V
        //   153: goto -101 -> 52
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	156	0	this	RoundsPreference
        //   0	156	1	paramBoolean	boolean
        //   24	6	2	i	int
        //   26	22	3	j	int
        //   41	43	4	l	long
        //   59	43	6	localObject	Object
        //   112	1	6	localNumberFormatException1	NumberFormatException
        //   128	1	6	localNumberFormatException2	NumberFormatException
        // Exception table:
        //   from	to	target	type
        //   9	25	112	java/lang/NumberFormatException
        //   43	52	128	java/lang/NumberFormatException
    }

    private class AfterSave
            extends OnFinish {
        private Context mCtx;
        private long mOldRounds;

        public AfterSave(Context paramContext, Handler paramHandler, long paramLong) {
            super();
            this.mCtx = paramContext;
            this.mOldRounds = paramLong;
        }

        public void run() {
            if (this.mSuccess) {
                Preference.OnPreferenceChangeListener localOnPreferenceChangeListener = RoundsPreference.this.getOnPreferenceChangeListener();
                if (localOnPreferenceChangeListener != null) {
                    localOnPreferenceChangeListener.onPreferenceChange(RoundsPreference.this, null);
                }
            }
            for (; ; ) {
                super.run();
                return;
                displayMessage(this.mCtx);
                RoundsPreference.this.mPM.setNumRounds(this.mOldRounds);
            }
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/settings/RoundsPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */