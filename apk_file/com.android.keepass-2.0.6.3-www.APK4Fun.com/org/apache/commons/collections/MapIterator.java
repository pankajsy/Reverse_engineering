package org.apache.commons.collections;

import java.util.Iterator;

public abstract interface MapIterator
        extends Iterator {
    public abstract Object getKey();

    public abstract Object getValue();

    public abstract boolean hasNext();

    public abstract Object next();

    public abstract void remove();

    public abstract Object setValue(Object paramObject);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/MapIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */