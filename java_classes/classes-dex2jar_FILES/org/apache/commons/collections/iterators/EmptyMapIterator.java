package org.apache.commons.collections.iterators;

import org.apache.commons.collections.MapIterator;
import org.apache.commons.collections.ResettableIterator;

public class EmptyMapIterator
  extends AbstractEmptyIterator
  implements MapIterator, ResettableIterator
{
  public static final MapIterator INSTANCE = new EmptyMapIterator();
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/apache/commons/collections/iterators/EmptyMapIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */