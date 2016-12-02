package org.apache.commons.collections.iterators;

import java.util.Iterator;
import org.apache.commons.collections.ResettableIterator;

public class EmptyIterator
  extends AbstractEmptyIterator
  implements ResettableIterator
{
  public static final Iterator INSTANCE = RESETTABLE_INSTANCE;
  public static final ResettableIterator RESETTABLE_INSTANCE = new EmptyIterator();
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/iterators/EmptyIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */