package org.apache.commons.collections.keyvalue;

public abstract class AbstractMapEntry
        extends AbstractKeyValue
        implements Map.Entry {
    protected AbstractMapEntry(Object paramObject1, Object paramObject2) {
        super(paramObject1, paramObject2);
    }

    public boolean equals(Object paramObject) {
        if (paramObject == this) {
        }
        do {
            return true;
            if (!(paramObject instanceof Map.Entry)) {
                return false;
            }
            paramObject = (Map.Entry) paramObject;
            if (getKey() != null) {
                break label55;
            }
            if (((Map.Entry) paramObject).getKey() != null) {
                break;
            }
            if (getValue() != null) {
                break label74;
            }
        } while (((Map.Entry) paramObject).getValue() == null);
        label55:
        label74:
        while (!getValue().equals(((Map.Entry) paramObject).getValue())) {
            do {
                return false;
            } while (!getKey().equals(((Map.Entry) paramObject).getKey()));
            break;
        }
        return true;
    }

    public int hashCode() {
        int j = 0;
        int i;
        if (getKey() == null) {
            i = 0;
            if (getValue() != null) {
                break label33;
            }
        }
        for (; ; ) {
            return i ^ j;
            i = getKey().hashCode();
            break;
            label33:
            j = getValue().hashCode();
        }
    }

    public Object setValue(Object paramObject) {
        Object localObject = this.value;
        this.value = paramObject;
        return localObject;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/keyvalue/AbstractMapEntry.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */