package com.keepassdroid.database;

import com.keepassdroid.database.security.ProtectedBinary;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class BinaryPool
{
  private HashMap<String, ProtectedBinary> pool = new HashMap();
  
  static
  {
    if (!BinaryPool.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public BinaryPool() {}
  
  public BinaryPool(PwGroupV4 paramPwGroupV4)
  {
    build(paramPwGroupV4);
  }
  
  private void build(PwGroupV4 paramPwGroupV4)
  {
    paramPwGroupV4.preOrderTraverseTree(null, new AddBinaries(null));
  }
  
  private void poolAdd(ProtectedBinary paramProtectedBinary)
  {
    assert (paramProtectedBinary != null);
    if (poolFind(paramProtectedBinary) != null) {
      return;
    }
    this.pool.put(String.valueOf(this.pool.size()), paramProtectedBinary);
  }
  
  private void poolAdd(Map<String, ProtectedBinary> paramMap)
  {
    paramMap = paramMap.values().iterator();
    while (paramMap.hasNext()) {
      poolAdd((ProtectedBinary)paramMap.next());
    }
  }
  
  public Set<Map.Entry<String, ProtectedBinary>> entrySet()
  {
    return this.pool.entrySet();
  }
  
  public ProtectedBinary get(String paramString)
  {
    return (ProtectedBinary)this.pool.get(paramString);
  }
  
  public String poolFind(ProtectedBinary paramProtectedBinary)
  {
    Iterator localIterator = this.pool.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (((ProtectedBinary)localEntry.getValue()).equals(paramProtectedBinary)) {
        return (String)localEntry.getKey();
      }
    }
    return null;
  }
  
  public ProtectedBinary put(String paramString, ProtectedBinary paramProtectedBinary)
  {
    return (ProtectedBinary)this.pool.put(paramString, paramProtectedBinary);
  }
  
  private class AddBinaries
    extends EntryHandler<PwEntryV4>
  {
    private AddBinaries() {}
    
    public boolean operate(PwEntryV4 paramPwEntryV4)
    {
      Iterator localIterator = paramPwEntryV4.history.iterator();
      while (localIterator.hasNext())
      {
        PwEntryV4 localPwEntryV4 = (PwEntryV4)localIterator.next();
        BinaryPool.this.poolAdd(localPwEntryV4.binaries);
      }
      BinaryPool.this.poolAdd(paramPwEntryV4.binaries);
      return true;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/BinaryPool.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */