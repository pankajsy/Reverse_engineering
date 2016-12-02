package org.apache.commons.collections.keyvalue;

import java.util.Map.Entry;
import org.apache.commons.collections.KeyValue;

public final class DefaultMapEntry
  extends AbstractMapEntry
{
  public DefaultMapEntry(Object paramObject1, Object paramObject2)
  {
    super(paramObject1, paramObject2);
  }
  
  public DefaultMapEntry(Map.Entry paramEntry)
  {
    super(paramEntry.getKey(), paramEntry.getValue());
  }
  
  public DefaultMapEntry(KeyValue paramKeyValue)
  {
    super(paramKeyValue.getKey(), paramKeyValue.getValue());
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/keyvalue/DefaultMapEntry.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */