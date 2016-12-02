package org.apache.commons.collections.iterators;

import java.util.NoSuchElementException;

abstract class AbstractEmptyIterator {
    public void add(Object paramObject) {
        throw new UnsupportedOperationException("add() not supported for empty Iterator");
    }

    public Object getKey() {
        throw new IllegalStateException("Iterator contains no elements");
    }

    public Object getValue() {
        throw new IllegalStateException("Iterator contains no elements");
    }

    public boolean hasNext() {
        return false;
    }

    public boolean hasPrevious() {
        return false;
    }

    public Object next() {
        throw new NoSuchElementException("Iterator contains no elements");
    }

    public int nextIndex() {
        return 0;
    }

    public Object previous() {
        throw new NoSuchElementException("Iterator contains no elements");
    }

    public int previousIndex() {
        return -1;
    }

    public void remove() {
        throw new IllegalStateException("Iterator contains no elements");
    }

    public void reset() {
    }

    public void set(Object paramObject) {
        throw new IllegalStateException("Iterator contains no elements");
    }

    public Object setValue(Object paramObject) {
        throw new IllegalStateException("Iterator contains no elements");
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/iterators/AbstractEmptyIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */