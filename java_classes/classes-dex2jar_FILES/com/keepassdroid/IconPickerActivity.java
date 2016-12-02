package com.keepassdroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.TextView;
import com.keepassdroid.icons.Icons;

public class IconPickerActivity
  extends LockCloseActivity
{
  public static final String KEY_ICON_ID = "icon_id";
  
  public static void Launch(Activity paramActivity)
  {
    paramActivity.startActivityForResult(new Intent(paramActivity, IconPickerActivity.class), 0);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903061);
    paramBundle = (GridView)findViewById(2131427432);
    paramBundle.setAdapter(new ImageAdapter(this));
    paramBundle.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        paramAnonymousAdapterView = new Intent();
        paramAnonymousAdapterView.putExtra("icon_id", paramAnonymousInt);
        IconPickerActivity.this.setResult(1000, paramAnonymousAdapterView);
        IconPickerActivity.this.finish();
      }
    });
  }
  
  public class ImageAdapter
    extends BaseAdapter
  {
    Context mContext;
    
    public ImageAdapter(Context paramContext)
    {
      this.mContext = paramContext;
    }
    
    public int getCount()
    {
      return Icons.count();
    }
    
    public Object getItem(int paramInt)
    {
      return null;
    }
    
    public long getItemId(int paramInt)
    {
      return 0L;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (paramView == null) {
        paramView = ((LayoutInflater)IconPickerActivity.this.getSystemService("layout_inflater")).inflate(2130903060, paramViewGroup, false);
      }
      for (;;)
      {
        ((TextView)paramView.findViewById(2131427431)).setText("" + paramInt);
        ((ImageView)paramView.findViewById(2131427430)).setImageResource(Icons.iconToResId(paramInt));
        return paramView;
      }
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/IconPickerActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */