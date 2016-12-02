package org.apache.commons.collections.keyvalue;

import org.apache.commons.collections.KeyValue;

public abstract class AbstractKeyValue
        implements KeyValue {
    protected Object key;
    protected Object value;

    protected AbstractKeyValue(Object paramObject1, Object paramObject2) {
        this.key = paramObject1;
        this.value = paramObject2;
    }

    public Object getKey() {
        return this.key;
    }

    public Object getValue() {
        return this.value;
    }

    public String toString() {
        return getKey() + '=' + getValue();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/keyvalue/AbstractKeyValue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */