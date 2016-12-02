package org.apache.commons.collections.iterators;

import org.apache.commons.collections.ResettableIterator;

import java.util.Iterator;

public class EmptyIterator
        extends AbstractEmptyIterator
        implements ResettableIterator {
    public static final ResettableIterator RESETTABLE_INSTANCE = new EmptyIterator();
    public static final Iterator INSTANCE = RESETTABLE_INSTANCE;
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/iterators/EmptyIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */