package org.apache.commons.collections.map;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;
import org.apache.commons.collections.MapIterator;
import org.apache.commons.collections.keyvalue.DefaultMapEntry;

public abstract class AbstractReferenceMap
  extends AbstractHashedMap
{
  public static final int HARD = 0;
  public static final int SOFT = 1;
  public static final int WEAK = 2;
  protected int keyType;
  protected boolean purgeValues;
  private transient ReferenceQueue queue;
  protected int valueType;
  
  protected AbstractReferenceMap() {}
  
  protected AbstractReferenceMap(int paramInt1, int paramInt2, int paramInt3, float paramFloat, boolean paramBoolean)
  {
    super(paramInt3, paramFloat);
    verify("keyType", paramInt1);
    verify("valueType", paramInt2);
    this.keyType = paramInt1;
    this.valueType = paramInt2;
    this.purgeValues = paramBoolean;
  }
  
  private static void verify(String paramString, int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 2)) {
      throw new IllegalArgumentException(paramString + " must be HARD, SOFT, WEAK.");
    }
  }
  
  public void clear()
  {
    super.clear();
    while (this.queue.poll() != null) {}
  }
  
  public boolean containsKey(Object paramObject)
  {
    purgeBeforeRead();
    paramObject = getEntry(paramObject);
    if (paramObject == null) {}
    while (((Map.Entry)paramObject).getValue() == null) {
      return false;
    }
    return true;
  }
  
  public boolean containsValue(Object paramObject)
  {
    purgeBeforeRead();
    if (paramObject == null) {
      return false;
    }
    return super.containsValue(paramObject);
  }
  
  protected AbstractHashedMap.HashEntry createEntry(AbstractHashedMap.HashEntry paramHashEntry, int paramInt, Object paramObject1, Object paramObject2)
  {
    return new ReferenceEntry(this, paramHashEntry, paramInt, paramObject1, paramObject2);
  }
  
  protected Iterator createEntrySetIterator()
  {
    return new ReferenceEntrySetIterator(this);
  }
  
  protected Iterator createKeySetIterator()
  {
    return new ReferenceKeySetIterator(this);
  }
  
  protected Iterator createValuesIterator()
  {
    return new ReferenceValuesIterator(this);
  }
  
  protected void doReadObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    this.keyType = paramObjectInputStream.readInt();
    this.valueType = paramObjectInputStream.readInt();
    this.purgeValues = paramObjectInputStream.readBoolean();
    this.loadFactor = paramObjectInputStream.readFloat();
    int i = paramObjectInputStream.readInt();
    init();
    this.data = new AbstractHashedMap.HashEntry[i];
    for (;;)
    {
      Object localObject = paramObjectInputStream.readObject();
      if (localObject == null)
      {
        this.threshold = calculateThreshold(this.data.length, this.loadFactor);
        return;
      }
      put(localObject, paramObjectInputStream.readObject());
    }
  }
  
  protected void doWriteObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeInt(this.keyType);
    paramObjectOutputStream.writeInt(this.valueType);
    paramObjectOutputStream.writeBoolean(this.purgeValues);
    paramObjectOutputStream.writeFloat(this.loadFactor);
    paramObjectOutputStream.writeInt(this.data.length);
    MapIterator localMapIterator = mapIterator();
    while (localMapIterator.hasNext())
    {
      paramObjectOutputStream.writeObject(localMapIterator.next());
      paramObjectOutputStream.writeObject(localMapIterator.getValue());
    }
    paramObjectOutputStream.writeObject(null);
  }
  
  public Set entrySet()
  {
    if (this.entrySet == null) {
      this.entrySet = new ReferenceEntrySet(this);
    }
    return this.entrySet;
  }
  
  public Object get(Object paramObject)
  {
    purgeBeforeRead();
    paramObject = getEntry(paramObject);
    if (paramObject == null) {
      return null;
    }
    return ((Map.Entry)paramObject).getValue();
  }
  
  protected AbstractHashedMap.HashEntry getEntry(Object paramObject)
  {
    if (paramObject == null) {
      return null;
    }
    return super.getEntry(paramObject);
  }
  
  protected int hashEntry(Object paramObject1, Object paramObject2)
  {
    int j = 0;
    int i;
    if (paramObject1 == null)
    {
      i = 0;
      if (paramObject2 != null) {
        break label26;
      }
    }
    for (;;)
    {
      return j ^ i;
      i = paramObject1.hashCode();
      break;
      label26:
      j = paramObject2.hashCode();
    }
  }
  
  protected void init()
  {
    this.queue = new ReferenceQueue();
  }
  
  public boolean isEmpty()
  {
    purgeBeforeRead();
    return super.isEmpty();
  }
  
  protected boolean isEqualKey(Object paramObject1, Object paramObject2)
  {
    Object localObject = paramObject2;
    if (this.keyType > 0) {
      localObject = ((Reference)paramObject2).get();
    }
    return (paramObject1 == localObject) || (paramObject1.equals(localObject));
  }
  
  public Set keySet()
  {
    if (this.keySet == null) {
      this.keySet = new ReferenceKeySet(this);
    }
    return this.keySet;
  }
  
  public MapIterator mapIterator()
  {
    return new ReferenceMapIterator(this);
  }
  
  protected void purge()
  {
    for (Reference localReference = this.queue.poll(); localReference != null; localReference = this.queue.poll()) {
      purge(localReference);
    }
  }
  
  protected void purge(Reference paramReference)
  {
    int i = hashIndex(paramReference.hashCode(), this.data.length);
    Object localObject = null;
    for (AbstractHashedMap.HashEntry localHashEntry = this.data[i];; localHashEntry = localHashEntry.next)
    {
      if (localHashEntry != null)
      {
        if (!((ReferenceEntry)localHashEntry).purge(paramReference)) {
          break label77;
        }
        if (localObject != null) {
          break label65;
        }
        this.data[i] = localHashEntry.next;
      }
      for (;;)
      {
        this.size -= 1;
        return;
        label65:
        ((AbstractHashedMap.HashEntry)localObject).next = localHashEntry.next;
      }
      label77:
      localObject = localHashEntry;
    }
  }
  
  protected void purgeBeforeRead()
  {
    purge();
  }
  
  protected void purgeBeforeWrite()
  {
    purge();
  }
  
  public Object put(Object paramObject1, Object paramObject2)
  {
    if (paramObject1 == null) {
      throw new NullPointerException("null keys not allowed");
    }
    if (paramObject2 == null) {
      throw new NullPointerException("null values not allowed");
    }
    purgeBeforeWrite();
    return super.put(paramObject1, paramObject2);
  }
  
  public Object remove(Object paramObject)
  {
    if (paramObject == null) {
      return null;
    }
    purgeBeforeWrite();
    return super.remove(paramObject);
  }
  
  public int size()
  {
    purgeBeforeRead();
    return super.size();
  }
  
  public Collection values()
  {
    if (this.values == null) {
      this.values = new ReferenceValues(this);
    }
    return this.values;
  }
  
  protected static class ReferenceEntry
    extends AbstractHashedMap.HashEntry
  {
    protected final AbstractReferenceMap parent;
    
    public ReferenceEntry(AbstractReferenceMap paramAbstractReferenceMap, AbstractHashedMap.HashEntry paramHashEntry, int paramInt, Object paramObject1, Object paramObject2)
    {
      super(paramInt, null, null);
      this.parent = paramAbstractReferenceMap;
      this.key = toReference(paramAbstractReferenceMap.keyType, paramObject1, paramInt);
      this.value = toReference(paramAbstractReferenceMap.valueType, paramObject2, paramInt);
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {}
      Object localObject;
      do
      {
        return true;
        if (!(paramObject instanceof Map.Entry)) {
          return false;
        }
        localObject = (Map.Entry)paramObject;
        paramObject = ((Map.Entry)localObject).getKey();
        localObject = ((Map.Entry)localObject).getValue();
        if ((paramObject == null) || (localObject == null)) {
          return false;
        }
      } while ((this.parent.isEqualKey(paramObject, this.key)) && (this.parent.isEqualValue(localObject, getValue())));
      return false;
    }
    
    public Object getKey()
    {
      if (this.parent.keyType > 0) {
        return ((Reference)this.key).get();
      }
      return this.key;
    }
    
    public Object getValue()
    {
      if (this.parent.valueType > 0) {
        return ((Reference)this.value).get();
      }
      return this.value;
    }
    
    public int hashCode()
    {
      return this.parent.hashEntry(getKey(), getValue());
    }
    
    protected ReferenceEntry next()
    {
      return (ReferenceEntry)this.next;
    }
    
    boolean purge(Reference paramReference)
    {
      int i;
      boolean bool;
      if ((this.parent.keyType > 0) && (this.key == paramReference))
      {
        i = 1;
        if ((i == 0) && ((this.parent.valueType <= 0) || (this.value != paramReference))) {
          break label95;
        }
        bool = true;
        label44:
        if (bool)
        {
          if (this.parent.keyType > 0) {
            ((Reference)this.key).clear();
          }
          if (this.parent.valueType <= 0) {
            break label100;
          }
          ((Reference)this.value).clear();
        }
      }
      label95:
      label100:
      while (!this.parent.purgeValues)
      {
        return bool;
        i = 0;
        break;
        bool = false;
        break label44;
      }
      this.value = null;
      return bool;
    }
    
    public Object setValue(Object paramObject)
    {
      Object localObject = getValue();
      if (this.parent.valueType > 0) {
        ((Reference)this.value).clear();
      }
      this.value = toReference(this.parent.valueType, paramObject, this.hashCode);
      return localObject;
    }
    
    protected Object toReference(int paramInt1, Object paramObject, int paramInt2)
    {
      Object localObject = paramObject;
      switch (paramInt1)
      {
      default: 
        throw new Error();
      case 1: 
        localObject = new AbstractReferenceMap.SoftRef(paramInt2, paramObject, this.parent.queue);
      case 0: 
        return localObject;
      }
      return new AbstractReferenceMap.WeakRef(paramInt2, paramObject, this.parent.queue);
    }
  }
  
  static class ReferenceEntrySet
    extends AbstractHashedMap.EntrySet
  {
    protected ReferenceEntrySet(AbstractHashedMap paramAbstractHashedMap)
    {
      super();
    }
    
    public Object[] toArray()
    {
      return toArray(new Object[0]);
    }
    
    public Object[] toArray(Object[] paramArrayOfObject)
    {
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localArrayList.add(new DefaultMapEntry(localEntry.getKey(), localEntry.getValue()));
      }
      return localArrayList.toArray(paramArrayOfObject);
    }
  }
  
  static class ReferenceEntrySetIterator
    implements Iterator
  {
    Object currentKey;
    Object currentValue;
    AbstractReferenceMap.ReferenceEntry entry;
    int expectedModCount;
    int index;
    Object nextKey;
    Object nextValue;
    final AbstractReferenceMap parent;
    AbstractReferenceMap.ReferenceEntry previous;
    
    public ReferenceEntrySetIterator(AbstractReferenceMap paramAbstractReferenceMap)
    {
      this.parent = paramAbstractReferenceMap;
      if (paramAbstractReferenceMap.size() != 0) {}
      for (int i = paramAbstractReferenceMap.data.length;; i = 0)
      {
        this.index = i;
        this.expectedModCount = paramAbstractReferenceMap.modCount;
        return;
      }
    }
    
    private void checkMod()
    {
      if (this.parent.modCount != this.expectedModCount) {
        throw new ConcurrentModificationException();
      }
    }
    
    private boolean nextNull()
    {
      return (this.nextKey == null) || (this.nextValue == null);
    }
    
    protected AbstractReferenceMap.ReferenceEntry currentEntry()
    {
      checkMod();
      return this.previous;
    }
    
    public boolean hasNext()
    {
      checkMod();
      while (nextNull())
      {
        AbstractReferenceMap.ReferenceEntry localReferenceEntry = this.entry;
        int i = this.index;
        while ((localReferenceEntry == null) && (i > 0))
        {
          i -= 1;
          localReferenceEntry = (AbstractReferenceMap.ReferenceEntry)this.parent.data[i];
        }
        this.entry = localReferenceEntry;
        this.index = i;
        if (localReferenceEntry == null)
        {
          this.currentKey = null;
          this.currentValue = null;
          return false;
        }
        this.nextKey = localReferenceEntry.getKey();
        this.nextValue = localReferenceEntry.getValue();
        if (nextNull()) {
          this.entry = this.entry.next();
        }
      }
      return true;
    }
    
    public Object next()
    {
      return nextEntry();
    }
    
    protected AbstractReferenceMap.ReferenceEntry nextEntry()
    {
      checkMod();
      if ((nextNull()) && (!hasNext())) {
        throw new NoSuchElementException();
      }
      this.previous = this.entry;
      this.entry = this.entry.next();
      this.currentKey = this.nextKey;
      this.currentValue = this.nextValue;
      this.nextKey = null;
      this.nextValue = null;
      return this.previous;
    }
    
    public void remove()
    {
      checkMod();
      if (this.previous == null) {
        throw new IllegalStateException();
      }
      this.parent.remove(this.currentKey);
      this.previous = null;
      this.currentKey = null;
      this.currentValue = null;
      this.expectedModCount = this.parent.modCount;
    }
  }
  
  static class ReferenceKeySet
    extends AbstractHashedMap.KeySet
  {
    protected ReferenceKeySet(AbstractHashedMap paramAbstractHashedMap)
    {
      super();
    }
    
    public Object[] toArray()
    {
      return toArray(new Object[0]);
    }
    
    public Object[] toArray(Object[] paramArrayOfObject)
    {
      ArrayList localArrayList = new ArrayList(this.parent.size());
      Iterator localIterator = iterator();
      while (localIterator.hasNext()) {
        localArrayList.add(localIterator.next());
      }
      return localArrayList.toArray(paramArrayOfObject);
    }
  }
  
  static class ReferenceKeySetIterator
    extends AbstractReferenceMap.ReferenceEntrySetIterator
  {
    ReferenceKeySetIterator(AbstractReferenceMap paramAbstractReferenceMap)
    {
      super();
    }
    
    public Object next()
    {
      return nextEntry().getKey();
    }
  }
  
  static class ReferenceMapIterator
    extends AbstractReferenceMap.ReferenceEntrySetIterator
    implements MapIterator
  {
    protected ReferenceMapIterator(AbstractReferenceMap paramAbstractReferenceMap)
    {
      super();
    }
    
    public Object getKey()
    {
      AbstractReferenceMap.ReferenceEntry localReferenceEntry = currentEntry();
      if (localReferenceEntry == null) {
        throw new IllegalStateException("getKey() can only be called after next() and before remove()");
      }
      return localReferenceEntry.getKey();
    }
    
    public Object getValue()
    {
      AbstractReferenceMap.ReferenceEntry localReferenceEntry = currentEntry();
      if (localReferenceEntry == null) {
        throw new IllegalStateException("getValue() can only be called after next() and before remove()");
      }
      return localReferenceEntry.getValue();
    }
    
    public Object next()
    {
      return nextEntry().getKey();
    }
    
    public Object setValue(Object paramObject)
    {
      AbstractReferenceMap.ReferenceEntry localReferenceEntry = currentEntry();
      if (localReferenceEntry == null) {
        throw new IllegalStateException("setValue() can only be called after next() and before remove()");
      }
      return localReferenceEntry.setValue(paramObject);
    }
  }
  
  static class ReferenceValues
    extends AbstractHashedMap.Values
  {
    protected ReferenceValues(AbstractHashedMap paramAbstractHashedMap)
    {
      super();
    }
    
    public Object[] toArray()
    {
      return toArray(new Object[0]);
    }
    
    public Object[] toArray(Object[] paramArrayOfObject)
    {
      ArrayList localArrayList = new ArrayList(this.parent.size());
      Iterator localIterator = iterator();
      while (localIterator.hasNext()) {
        localArrayList.add(localIterator.next());
      }
      return localArrayList.toArray(paramArrayOfObject);
    }
  }
  
  static class ReferenceValuesIterator
    extends AbstractReferenceMap.ReferenceEntrySetIterator
  {
    ReferenceValuesIterator(AbstractReferenceMap paramAbstractReferenceMap)
    {
      super();
    }
    
    public Object next()
    {
      return nextEntry().getValue();
    }
  }
  
  static class SoftRef
    extends SoftReference
  {
    private int hash;
    
    public SoftRef(int paramInt, Object paramObject, ReferenceQueue paramReferenceQueue)
    {
      super(paramReferenceQueue);
      this.hash = paramInt;
    }
    
    public int hashCode()
    {
      return this.hash;
    }
  }
  
  static class WeakRef
    extends WeakReference
  {
    private int hash;
    
    public WeakRef(int paramInt, Object paramObject, ReferenceQueue paramReferenceQueue)
    {
      super(paramReferenceQueue);
      this.hash = paramInt;
    }
    
    public int hashCode()
    {
      return this.hash;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/map/AbstractReferenceMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */