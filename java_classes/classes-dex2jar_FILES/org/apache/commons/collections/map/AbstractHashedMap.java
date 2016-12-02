package org.apache.commons.collections.map;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;
import org.apache.commons.collections.IterableMap;
import org.apache.commons.collections.KeyValue;
import org.apache.commons.collections.MapIterator;
import org.apache.commons.collections.iterators.EmptyIterator;
import org.apache.commons.collections.iterators.EmptyMapIterator;

public class AbstractHashedMap
  extends AbstractMap
  implements IterableMap
{
  protected static final int DEFAULT_CAPACITY = 16;
  protected static final float DEFAULT_LOAD_FACTOR = 0.75F;
  protected static final int DEFAULT_THRESHOLD = 12;
  protected static final String GETKEY_INVALID = "getKey() can only be called after next() and before remove()";
  protected static final String GETVALUE_INVALID = "getValue() can only be called after next() and before remove()";
  protected static final int MAXIMUM_CAPACITY = 1073741824;
  protected static final String NO_NEXT_ENTRY = "No next() entry in the iteration";
  protected static final String NO_PREVIOUS_ENTRY = "No previous() entry in the iteration";
  protected static final Object NULL = new Object();
  protected static final String REMOVE_INVALID = "remove() can only be called once after next()";
  protected static final String SETVALUE_INVALID = "setValue() can only be called after next() and before remove()";
  protected transient HashEntry[] data;
  protected transient EntrySet entrySet;
  protected transient KeySet keySet;
  protected transient float loadFactor;
  protected transient int modCount;
  protected transient int size;
  protected transient int threshold;
  protected transient Values values;
  
  protected AbstractHashedMap() {}
  
  protected AbstractHashedMap(int paramInt)
  {
    this(paramInt, 0.75F);
  }
  
  protected AbstractHashedMap(int paramInt, float paramFloat)
  {
    if (paramInt < 1) {
      throw new IllegalArgumentException("Initial capacity must be greater than 0");
    }
    if ((paramFloat <= 0.0F) || (Float.isNaN(paramFloat))) {
      throw new IllegalArgumentException("Load factor must be greater than 0");
    }
    this.loadFactor = paramFloat;
    paramInt = calculateNewCapacity(paramInt);
    this.threshold = calculateThreshold(paramInt, paramFloat);
    this.data = new HashEntry[paramInt];
    init();
  }
  
  protected AbstractHashedMap(int paramInt1, float paramFloat, int paramInt2)
  {
    this.loadFactor = paramFloat;
    this.data = new HashEntry[paramInt1];
    this.threshold = paramInt2;
    init();
  }
  
  protected AbstractHashedMap(Map paramMap)
  {
    this(Math.max(paramMap.size() * 2, 16), 0.75F);
    putAll(paramMap);
  }
  
  protected void addEntry(HashEntry paramHashEntry, int paramInt)
  {
    this.data[paramInt] = paramHashEntry;
  }
  
  protected void addMapping(int paramInt1, int paramInt2, Object paramObject1, Object paramObject2)
  {
    this.modCount += 1;
    addEntry(createEntry(this.data[paramInt1], paramInt2, paramObject1, paramObject2), paramInt1);
    this.size += 1;
    checkCapacity();
  }
  
  protected int calculateNewCapacity(int paramInt)
  {
    int i = 1;
    if (paramInt > 1073741824) {
      paramInt = 1073741824;
    }
    do
    {
      return paramInt;
      while (i < paramInt) {
        i <<= 1;
      }
      paramInt = i;
    } while (i <= 1073741824);
    return 1073741824;
  }
  
  protected int calculateThreshold(int paramInt, float paramFloat)
  {
    return (int)(paramInt * paramFloat);
  }
  
  protected void checkCapacity()
  {
    if (this.size >= this.threshold)
    {
      int i = this.data.length * 2;
      if (i <= 1073741824) {
        ensureCapacity(i);
      }
    }
  }
  
  public void clear()
  {
    this.modCount += 1;
    HashEntry[] arrayOfHashEntry = this.data;
    int i = arrayOfHashEntry.length - 1;
    while (i >= 0)
    {
      arrayOfHashEntry[i] = null;
      i -= 1;
    }
    this.size = 0;
  }
  
  protected Object clone()
  {
    try
    {
      AbstractHashedMap localAbstractHashedMap = (AbstractHashedMap)super.clone();
      localAbstractHashedMap.data = new HashEntry[this.data.length];
      localAbstractHashedMap.entrySet = null;
      localAbstractHashedMap.keySet = null;
      localAbstractHashedMap.values = null;
      localAbstractHashedMap.modCount = 0;
      localAbstractHashedMap.size = 0;
      localAbstractHashedMap.init();
      localAbstractHashedMap.putAll(this);
      return localAbstractHashedMap;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException) {}
    return null;
  }
  
  public boolean containsKey(Object paramObject)
  {
    Object localObject = convertKey(paramObject);
    int i = hash(localObject);
    for (paramObject = this.data[hashIndex(i, this.data.length)]; paramObject != null; paramObject = ((HashEntry)paramObject).next) {
      if ((((HashEntry)paramObject).hashCode == i) && (isEqualKey(localObject, ((HashEntry)paramObject).key))) {
        return true;
      }
    }
    return false;
  }
  
  public boolean containsValue(Object paramObject)
  {
    if (paramObject == null)
    {
      i = 0;
      j = this.data.length;
      while (i < j)
      {
        for (paramObject = this.data[i]; paramObject != null; paramObject = ((HashEntry)paramObject).next) {
          if (((HashEntry)paramObject).getValue() == null) {
            return true;
          }
        }
        i += 1;
      }
    }
    int i = 0;
    int j = this.data.length;
    for (;;)
    {
      if (i >= j) {
        break label108;
      }
      for (HashEntry localHashEntry = this.data[i];; localHashEntry = localHashEntry.next)
      {
        if (localHashEntry == null) {
          break label101;
        }
        if (isEqualValue(paramObject, localHashEntry.getValue())) {
          break;
        }
      }
      label101:
      i += 1;
    }
    label108:
    return false;
  }
  
  protected Object convertKey(Object paramObject)
  {
    Object localObject = paramObject;
    if (paramObject == null) {
      localObject = NULL;
    }
    return localObject;
  }
  
  protected HashEntry createEntry(HashEntry paramHashEntry, int paramInt, Object paramObject1, Object paramObject2)
  {
    return new HashEntry(paramHashEntry, paramInt, paramObject1, paramObject2);
  }
  
  protected Iterator createEntrySetIterator()
  {
    if (size() == 0) {
      return EmptyIterator.INSTANCE;
    }
    return new EntrySetIterator(this);
  }
  
  protected Iterator createKeySetIterator()
  {
    if (size() == 0) {
      return EmptyIterator.INSTANCE;
    }
    return new KeySetIterator(this);
  }
  
  protected Iterator createValuesIterator()
  {
    if (size() == 0) {
      return EmptyIterator.INSTANCE;
    }
    return new ValuesIterator(this);
  }
  
  protected void destroyEntry(HashEntry paramHashEntry)
  {
    paramHashEntry.next = null;
    paramHashEntry.key = null;
    paramHashEntry.value = null;
  }
  
  protected void doReadObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    this.loadFactor = paramObjectInputStream.readFloat();
    int i = paramObjectInputStream.readInt();
    int j = paramObjectInputStream.readInt();
    init();
    this.threshold = calculateThreshold(i, this.loadFactor);
    this.data = new HashEntry[i];
    i = 0;
    while (i < j)
    {
      put(paramObjectInputStream.readObject(), paramObjectInputStream.readObject());
      i += 1;
    }
  }
  
  protected void doWriteObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeFloat(this.loadFactor);
    paramObjectOutputStream.writeInt(this.data.length);
    paramObjectOutputStream.writeInt(this.size);
    MapIterator localMapIterator = mapIterator();
    while (localMapIterator.hasNext())
    {
      paramObjectOutputStream.writeObject(localMapIterator.next());
      paramObjectOutputStream.writeObject(localMapIterator.getValue());
    }
  }
  
  protected void ensureCapacity(int paramInt)
  {
    int i = this.data.length;
    if (paramInt <= i) {
      return;
    }
    if (this.size == 0)
    {
      this.threshold = calculateThreshold(paramInt, this.loadFactor);
      this.data = new HashEntry[paramInt];
      return;
    }
    HashEntry[] arrayOfHashEntry1 = this.data;
    HashEntry[] arrayOfHashEntry2 = new HashEntry[paramInt];
    this.modCount += 1;
    i -= 1;
    while (i >= 0)
    {
      Object localObject = arrayOfHashEntry1[i];
      if (localObject != null)
      {
        arrayOfHashEntry1[i] = null;
        HashEntry localHashEntry;
        do
        {
          localHashEntry = ((HashEntry)localObject).next;
          int j = hashIndex(((HashEntry)localObject).hashCode, paramInt);
          ((HashEntry)localObject).next = arrayOfHashEntry2[j];
          arrayOfHashEntry2[j] = localObject;
          localObject = localHashEntry;
        } while (localHashEntry != null);
      }
      i -= 1;
    }
    this.threshold = calculateThreshold(paramInt, this.loadFactor);
    this.data = arrayOfHashEntry2;
  }
  
  protected int entryHashCode(HashEntry paramHashEntry)
  {
    return paramHashEntry.hashCode;
  }
  
  protected Object entryKey(HashEntry paramHashEntry)
  {
    return paramHashEntry.key;
  }
  
  protected HashEntry entryNext(HashEntry paramHashEntry)
  {
    return paramHashEntry.next;
  }
  
  public Set entrySet()
  {
    if (this.entrySet == null) {
      this.entrySet = new EntrySet(this);
    }
    return this.entrySet;
  }
  
  protected Object entryValue(HashEntry paramHashEntry)
  {
    return paramHashEntry.value;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof Map)) {
        return false;
      }
      paramObject = (Map)paramObject;
      if (((Map)paramObject).size() != size()) {
        return false;
      }
      MapIterator localMapIterator = mapIterator();
      try
      {
        label96:
        boolean bool;
        do
        {
          Object localObject1;
          Object localObject2;
          do
          {
            if (!localMapIterator.hasNext()) {
              break;
            }
            localObject1 = localMapIterator.next();
            localObject2 = localMapIterator.getValue();
            if (localObject2 != null) {
              break label96;
            }
            if (((Map)paramObject).get(localObject1) != null) {
              break label122;
            }
          } while (((Map)paramObject).containsKey(localObject1));
          break label122;
          bool = localObject2.equals(((Map)paramObject).get(localObject1));
        } while (bool);
        return false;
      }
      catch (ClassCastException paramObject)
      {
        return false;
      }
      catch (NullPointerException paramObject)
      {
        return false;
      }
    }
    label122:
    return false;
  }
  
  public Object get(Object paramObject)
  {
    Object localObject = convertKey(paramObject);
    int i = hash(localObject);
    for (paramObject = this.data[hashIndex(i, this.data.length)]; paramObject != null; paramObject = ((HashEntry)paramObject).next) {
      if ((((HashEntry)paramObject).hashCode == i) && (isEqualKey(localObject, ((HashEntry)paramObject).key))) {
        return ((HashEntry)paramObject).getValue();
      }
    }
    return null;
  }
  
  protected HashEntry getEntry(Object paramObject)
  {
    Object localObject = convertKey(paramObject);
    int i = hash(localObject);
    for (paramObject = this.data[hashIndex(i, this.data.length)]; paramObject != null; paramObject = ((HashEntry)paramObject).next) {
      if ((((HashEntry)paramObject).hashCode == i) && (isEqualKey(localObject, ((HashEntry)paramObject).key))) {
        return (HashEntry)paramObject;
      }
    }
    return null;
  }
  
  protected int hash(Object paramObject)
  {
    int i = paramObject.hashCode();
    i += (i << 9 ^ 0xFFFFFFFF);
    i ^= i >>> 14;
    i += (i << 4);
    return i ^ i >>> 10;
  }
  
  public int hashCode()
  {
    int i = 0;
    Iterator localIterator = createEntrySetIterator();
    while (localIterator.hasNext()) {
      i += localIterator.next().hashCode();
    }
    return i;
  }
  
  protected int hashIndex(int paramInt1, int paramInt2)
  {
    return paramInt2 - 1 & paramInt1;
  }
  
  protected void init() {}
  
  public boolean isEmpty()
  {
    return this.size == 0;
  }
  
  protected boolean isEqualKey(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || (paramObject1.equals(paramObject2));
  }
  
  protected boolean isEqualValue(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || (paramObject1.equals(paramObject2));
  }
  
  public Set keySet()
  {
    if (this.keySet == null) {
      this.keySet = new KeySet(this);
    }
    return this.keySet;
  }
  
  public MapIterator mapIterator()
  {
    if (this.size == 0) {
      return EmptyMapIterator.INSTANCE;
    }
    return new HashMapIterator(this);
  }
  
  public Object put(Object paramObject1, Object paramObject2)
  {
    Object localObject = convertKey(paramObject1);
    int i = hash(localObject);
    int j = hashIndex(i, this.data.length);
    for (paramObject1 = this.data[j]; paramObject1 != null; paramObject1 = ((HashEntry)paramObject1).next) {
      if ((((HashEntry)paramObject1).hashCode == i) && (isEqualKey(localObject, ((HashEntry)paramObject1).key)))
      {
        localObject = ((HashEntry)paramObject1).getValue();
        updateEntry((HashEntry)paramObject1, paramObject2);
        return localObject;
      }
    }
    addMapping(j, i, localObject, paramObject2);
    return null;
  }
  
  public void putAll(Map paramMap)
  {
    int i = paramMap.size();
    if (i == 0) {}
    for (;;)
    {
      return;
      ensureCapacity(calculateNewCapacity((int)((this.size + i) / this.loadFactor + 1.0F)));
      paramMap = paramMap.entrySet().iterator();
      while (paramMap.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap.next();
        put(localEntry.getKey(), localEntry.getValue());
      }
    }
  }
  
  public Object remove(Object paramObject)
  {
    Object localObject2 = convertKey(paramObject);
    int i = hash(localObject2);
    int j = hashIndex(i, this.data.length);
    paramObject = this.data[j];
    Object localObject1 = null;
    while (paramObject != null)
    {
      if ((((HashEntry)paramObject).hashCode == i) && (isEqualKey(localObject2, ((HashEntry)paramObject).key)))
      {
        localObject2 = ((HashEntry)paramObject).getValue();
        removeMapping((HashEntry)paramObject, j, (HashEntry)localObject1);
        return localObject2;
      }
      localObject1 = paramObject;
      paramObject = ((HashEntry)paramObject).next;
    }
    return null;
  }
  
  protected void removeEntry(HashEntry paramHashEntry1, int paramInt, HashEntry paramHashEntry2)
  {
    if (paramHashEntry2 == null)
    {
      this.data[paramInt] = paramHashEntry1.next;
      return;
    }
    paramHashEntry2.next = paramHashEntry1.next;
  }
  
  protected void removeMapping(HashEntry paramHashEntry1, int paramInt, HashEntry paramHashEntry2)
  {
    this.modCount += 1;
    removeEntry(paramHashEntry1, paramInt, paramHashEntry2);
    this.size -= 1;
    destroyEntry(paramHashEntry1);
  }
  
  protected void reuseEntry(HashEntry paramHashEntry, int paramInt1, int paramInt2, Object paramObject1, Object paramObject2)
  {
    paramHashEntry.next = this.data[paramInt1];
    paramHashEntry.hashCode = paramInt2;
    paramHashEntry.key = paramObject1;
    paramHashEntry.value = paramObject2;
  }
  
  public int size()
  {
    return this.size;
  }
  
  public String toString()
  {
    if (size() == 0) {
      return "{}";
    }
    StringBuffer localStringBuffer = new StringBuffer(size() * 32);
    localStringBuffer.append('{');
    MapIterator localMapIterator = mapIterator();
    boolean bool1 = localMapIterator.hasNext();
    while (bool1)
    {
      Object localObject3 = localMapIterator.next();
      Object localObject2 = localMapIterator.getValue();
      Object localObject1 = localObject3;
      if (localObject3 == this) {
        localObject1 = "(this Map)";
      }
      localObject3 = localStringBuffer.append(localObject1).append('=');
      localObject1 = localObject2;
      if (localObject2 == this) {
        localObject1 = "(this Map)";
      }
      ((StringBuffer)localObject3).append(localObject1);
      boolean bool2 = localMapIterator.hasNext();
      bool1 = bool2;
      if (bool2)
      {
        localStringBuffer.append(',').append(' ');
        bool1 = bool2;
      }
    }
    localStringBuffer.append('}');
    return localStringBuffer.toString();
  }
  
  protected void updateEntry(HashEntry paramHashEntry, Object paramObject)
  {
    paramHashEntry.setValue(paramObject);
  }
  
  public Collection values()
  {
    if (this.values == null) {
      this.values = new Values(this);
    }
    return this.values;
  }
  
  protected static class EntrySet
    extends AbstractSet
  {
    protected final AbstractHashedMap parent;
    
    protected EntrySet(AbstractHashedMap paramAbstractHashedMap)
    {
      this.parent = paramAbstractHashedMap;
    }
    
    public void clear()
    {
      this.parent.clear();
    }
    
    public boolean contains(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof Map.Entry))
      {
        paramObject = (Map.Entry)paramObject;
        AbstractHashedMap.HashEntry localHashEntry = this.parent.getEntry(((Map.Entry)paramObject).getKey());
        bool1 = bool2;
        if (localHashEntry != null)
        {
          bool1 = bool2;
          if (localHashEntry.equals(paramObject)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public Iterator iterator()
    {
      return this.parent.createEntrySetIterator();
    }
    
    public boolean remove(Object paramObject)
    {
      if (!(paramObject instanceof Map.Entry)) {}
      while (!contains(paramObject)) {
        return false;
      }
      paramObject = ((Map.Entry)paramObject).getKey();
      this.parent.remove(paramObject);
      return true;
    }
    
    public int size()
    {
      return this.parent.size();
    }
  }
  
  protected static class EntrySetIterator
    extends AbstractHashedMap.HashIterator
  {
    protected EntrySetIterator(AbstractHashedMap paramAbstractHashedMap)
    {
      super();
    }
    
    public Object next()
    {
      return super.nextEntry();
    }
  }
  
  protected static class HashEntry
    implements Map.Entry, KeyValue
  {
    protected int hashCode;
    protected Object key;
    protected HashEntry next;
    protected Object value;
    
    protected HashEntry(HashEntry paramHashEntry, int paramInt, Object paramObject1, Object paramObject2)
    {
      this.next = paramHashEntry;
      this.hashCode = paramInt;
      this.key = paramObject1;
      this.value = paramObject2;
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {}
      do
      {
        return true;
        if (!(paramObject instanceof Map.Entry)) {
          return false;
        }
        paramObject = (Map.Entry)paramObject;
        if (getKey() != null) {
          break label55;
        }
        if (((Map.Entry)paramObject).getKey() != null) {
          break;
        }
        if (getValue() != null) {
          break label74;
        }
      } while (((Map.Entry)paramObject).getValue() == null);
      label55:
      label74:
      while (!getValue().equals(((Map.Entry)paramObject).getValue()))
      {
        do
        {
          return false;
        } while (!getKey().equals(((Map.Entry)paramObject).getKey()));
        break;
      }
      return true;
    }
    
    public Object getKey()
    {
      if (this.key == AbstractHashedMap.NULL) {
        return null;
      }
      return this.key;
    }
    
    public Object getValue()
    {
      return this.value;
    }
    
    public int hashCode()
    {
      int j = 0;
      int i;
      if (getKey() == null)
      {
        i = 0;
        if (getValue() != null) {
          break label33;
        }
      }
      for (;;)
      {
        return i ^ j;
        i = getKey().hashCode();
        break;
        label33:
        j = getValue().hashCode();
      }
    }
    
    public Object setValue(Object paramObject)
    {
      Object localObject = this.value;
      this.value = paramObject;
      return localObject;
    }
    
    public String toString()
    {
      return getKey() + '=' + getValue();
    }
  }
  
  protected static abstract class HashIterator
    implements Iterator
  {
    protected int expectedModCount;
    protected int hashIndex;
    protected AbstractHashedMap.HashEntry last;
    protected AbstractHashedMap.HashEntry next;
    protected final AbstractHashedMap parent;
    
    protected HashIterator(AbstractHashedMap paramAbstractHashedMap)
    {
      this.parent = paramAbstractHashedMap;
      AbstractHashedMap.HashEntry[] arrayOfHashEntry = paramAbstractHashedMap.data;
      int i = arrayOfHashEntry.length;
      for (AbstractHashedMap.HashEntry localHashEntry = null; (i > 0) && (localHashEntry == null); localHashEntry = arrayOfHashEntry[i]) {
        i -= 1;
      }
      this.next = localHashEntry;
      this.hashIndex = i;
      this.expectedModCount = paramAbstractHashedMap.modCount;
    }
    
    protected AbstractHashedMap.HashEntry currentEntry()
    {
      return this.last;
    }
    
    public boolean hasNext()
    {
      return this.next != null;
    }
    
    protected AbstractHashedMap.HashEntry nextEntry()
    {
      if (this.parent.modCount != this.expectedModCount) {
        throw new ConcurrentModificationException();
      }
      AbstractHashedMap.HashEntry localHashEntry2 = this.next;
      if (localHashEntry2 == null) {
        throw new NoSuchElementException("No next() entry in the iteration");
      }
      AbstractHashedMap.HashEntry[] arrayOfHashEntry = this.parent.data;
      int i = this.hashIndex;
      for (AbstractHashedMap.HashEntry localHashEntry1 = localHashEntry2.next; (localHashEntry1 == null) && (i > 0); localHashEntry1 = arrayOfHashEntry[i]) {
        i -= 1;
      }
      this.next = localHashEntry1;
      this.hashIndex = i;
      this.last = localHashEntry2;
      return localHashEntry2;
    }
    
    public void remove()
    {
      if (this.last == null) {
        throw new IllegalStateException("remove() can only be called once after next()");
      }
      if (this.parent.modCount != this.expectedModCount) {
        throw new ConcurrentModificationException();
      }
      this.parent.remove(this.last.getKey());
      this.last = null;
      this.expectedModCount = this.parent.modCount;
    }
    
    public String toString()
    {
      if (this.last != null) {
        return "Iterator[" + this.last.getKey() + "=" + this.last.getValue() + "]";
      }
      return "Iterator[]";
    }
  }
  
  protected static class HashMapIterator
    extends AbstractHashedMap.HashIterator
    implements MapIterator
  {
    protected HashMapIterator(AbstractHashedMap paramAbstractHashedMap)
    {
      super();
    }
    
    public Object getKey()
    {
      AbstractHashedMap.HashEntry localHashEntry = currentEntry();
      if (localHashEntry == null) {
        throw new IllegalStateException("getKey() can only be called after next() and before remove()");
      }
      return localHashEntry.getKey();
    }
    
    public Object getValue()
    {
      AbstractHashedMap.HashEntry localHashEntry = currentEntry();
      if (localHashEntry == null) {
        throw new IllegalStateException("getValue() can only be called after next() and before remove()");
      }
      return localHashEntry.getValue();
    }
    
    public Object next()
    {
      return super.nextEntry().getKey();
    }
    
    public Object setValue(Object paramObject)
    {
      AbstractHashedMap.HashEntry localHashEntry = currentEntry();
      if (localHashEntry == null) {
        throw new IllegalStateException("setValue() can only be called after next() and before remove()");
      }
      return localHashEntry.setValue(paramObject);
    }
  }
  
  protected static class KeySet
    extends AbstractSet
  {
    protected final AbstractHashedMap parent;
    
    protected KeySet(AbstractHashedMap paramAbstractHashedMap)
    {
      this.parent = paramAbstractHashedMap;
    }
    
    public void clear()
    {
      this.parent.clear();
    }
    
    public boolean contains(Object paramObject)
    {
      return this.parent.containsKey(paramObject);
    }
    
    public Iterator iterator()
    {
      return this.parent.createKeySetIterator();
    }
    
    public boolean remove(Object paramObject)
    {
      boolean bool = this.parent.containsKey(paramObject);
      this.parent.remove(paramObject);
      return bool;
    }
    
    public int size()
    {
      return this.parent.size();
    }
  }
  
  protected static class KeySetIterator
    extends AbstractHashedMap.EntrySetIterator
  {
    protected KeySetIterator(AbstractHashedMap paramAbstractHashedMap)
    {
      super();
    }
    
    public Object next()
    {
      return super.nextEntry().getKey();
    }
  }
  
  protected static class Values
    extends AbstractCollection
  {
    protected final AbstractHashedMap parent;
    
    protected Values(AbstractHashedMap paramAbstractHashedMap)
    {
      this.parent = paramAbstractHashedMap;
    }
    
    public void clear()
    {
      this.parent.clear();
    }
    
    public boolean contains(Object paramObject)
    {
      return this.parent.containsValue(paramObject);
    }
    
    public Iterator iterator()
    {
      return this.parent.createValuesIterator();
    }
    
    public int size()
    {
      return this.parent.size();
    }
  }
  
  protected static class ValuesIterator
    extends AbstractHashedMap.HashIterator
  {
    protected ValuesIterator(AbstractHashedMap paramAbstractHashedMap)
    {
      super();
    }
    
    public Object next()
    {
      return super.nextEntry().getValue();
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/map/AbstractHashedMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */