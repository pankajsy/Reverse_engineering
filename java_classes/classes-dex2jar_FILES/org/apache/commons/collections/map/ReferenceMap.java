package org.apache.commons.collections.map;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class ReferenceMap
  extends AbstractReferenceMap
  implements Serializable
{
  private static final long serialVersionUID = 1555089888138299607L;
  
  public ReferenceMap()
  {
    super(0, 1, 16, 0.75F, false);
  }
  
  public ReferenceMap(int paramInt1, int paramInt2)
  {
    super(paramInt1, paramInt2, 16, 0.75F, false);
  }
  
  public ReferenceMap(int paramInt1, int paramInt2, int paramInt3, float paramFloat)
  {
    super(paramInt1, paramInt2, paramInt3, paramFloat, false);
  }
  
  public ReferenceMap(int paramInt1, int paramInt2, int paramInt3, float paramFloat, boolean paramBoolean)
  {
    super(paramInt1, paramInt2, paramInt3, paramFloat, paramBoolean);
  }
  
  public ReferenceMap(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    super(paramInt1, paramInt2, 16, 0.75F, paramBoolean);
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    doReadObject(paramObjectInputStream);
  }
  
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    doWriteObject(paramObjectOutputStream);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/map/ReferenceMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */