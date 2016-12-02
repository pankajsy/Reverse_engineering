package com.keepassdroid.database;

import com.keepassdroid.app.App;
import com.keepassdroid.utils.Types;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

public class PwDate
        implements Cloneable {
    private static final int DATE_SIZE = 5;
    private byte[] cDate;
    private boolean cDateBuilt = false;
    private Date jDate;
    private boolean jDateBuilt = false;

    private PwDate() {
    }

    public PwDate(long paramLong) {
        this.jDate = new Date(paramLong);
        this.jDateBuilt = true;
    }

    public PwDate(Date paramDate) {
        this.jDate = paramDate;
        this.jDateBuilt = true;
    }

    public PwDate(byte[] paramArrayOfByte, int paramInt) {
        this.cDate = new byte[5];
        System.arraycopy(paramArrayOfByte, paramInt, this.cDate, 0, 5);
        this.cDateBuilt = true;
    }

    public static boolean IsSameDate(Date paramDate1, Date paramDate2) {
        Calendar localCalendar = Calendar.getInstance();
        localCalendar.setTime(paramDate1);
        localCalendar.set(14, 0);
        paramDate1 = Calendar.getInstance();
        paramDate1.setTime(paramDate2);
        paramDate1.set(14, 0);
        return (localCalendar.get(1) == paramDate1.get(1)) && (localCalendar.get(2) == paramDate1.get(2)) && (localCalendar.get(5) == paramDate1.get(5)) && (localCalendar.get(10) == paramDate1.get(10)) && (localCalendar.get(12) == paramDate1.get(12)) && (localCalendar.get(13) == paramDate1.get(13));
    }

    public static Date readTime(byte[] paramArrayOfByte, int paramInt, Calendar paramCalendar) {
        int i = Types.readUByte(paramArrayOfByte, paramInt);
        int j = Types.readUByte(paramArrayOfByte, paramInt + 1);
        int k = Types.readUByte(paramArrayOfByte, paramInt + 2);
        int m = Types.readUByte(paramArrayOfByte, paramInt + 3);
        paramInt = Types.readUByte(paramArrayOfByte, paramInt + 4);
        paramArrayOfByte = paramCalendar;
        if (paramCalendar == null) {
            paramArrayOfByte = Calendar.getInstance();
        }
        paramArrayOfByte.set(i << 6 | j >> 2, ((j & 0x3) << 2 | k >> 6) - 1, k >> 1 & 0x1F, (k & 0x1) << 4 | m >> 4, (m & 0xF) << 2 | paramInt >> 6, paramInt & 0x3F);
        return paramArrayOfByte.getTime();
    }

    public static byte[] writeTime(Date paramDate) {
        return writeTime(paramDate, null);
    }

    public static byte[] writeTime(Date paramDate, Calendar paramCalendar) {
        if (paramDate == null) {
            return null;
        }
        Calendar localCalendar = paramCalendar;
        if (paramCalendar == null) {
            localCalendar = Calendar.getInstance();
        }
        localCalendar.setTime(paramDate);
        int i = localCalendar.get(1);
        int j = localCalendar.get(2) + 1;
        int k = localCalendar.get(5);
        int m = localCalendar.get(11);
        int n = localCalendar.get(12);
        int i1 = localCalendar.get(13);
        return new byte[]{Types.writeUByte(i >> 6 & 0x3F), Types.writeUByte((i & 0x3F) << 2 | j >> 2 & 0x3), (byte) ((j & 0x3) << 6 | (k - 1 & 0x1F) << 1 | m >> 4 & 0x1), (byte) ((m & 0xF) << 4 | n >> 2 & 0xF), (byte) ((n & 0x3) << 6 | i1 & 0x3F)};
    }

    public Object clone() {
        PwDate localPwDate = new PwDate();
        if (this.cDateBuilt) {
            byte[] arrayOfByte = new byte[5];
            System.arraycopy(this.cDate, 0, arrayOfByte, 0, 5);
            localPwDate.cDate = arrayOfByte;
            localPwDate.cDateBuilt = true;
        }
        if (this.jDateBuilt) {
            localPwDate.jDate = ((Date) this.jDate.clone());
            localPwDate.jDateBuilt = true;
        }
        return localPwDate;
    }

    public boolean equals(Object paramObject) {
        boolean bool2 = false;
        boolean bool1;
        if (this == paramObject) {
            bool1 = true;
        }
        do {
            do {
                return bool1;
                bool1 = bool2;
            } while (paramObject == null);
            bool1 = bool2;
        } while (getClass() != paramObject.getClass());
        paramObject = (PwDate) paramObject;
        if ((this.cDateBuilt) && (((PwDate) paramObject).cDateBuilt)) {
            return Arrays.equals(this.cDate, ((PwDate) paramObject).cDate);
        }
        if ((this.jDateBuilt) && (((PwDate) paramObject).jDateBuilt)) {
            return IsSameDate(this.jDate, ((PwDate) paramObject).jDate);
        }
        if ((this.cDateBuilt) && (((PwDate) paramObject).jDateBuilt)) {
            return Arrays.equals(((PwDate) paramObject).getCDate(), this.cDate);
        }
        return IsSameDate(((PwDate) paramObject).getJDate(), this.jDate);
    }

    public byte[] getCDate() {
        if (!this.cDateBuilt) {
            this.cDate = writeTime(this.jDate, App.getCalendar());
            this.cDateBuilt = true;
        }
        return this.cDate;
    }

    public Date getJDate() {
        if (!this.jDateBuilt) {
            this.jDate = readTime(this.cDate, 0, App.getCalendar());
            this.jDateBuilt = true;
        }
        return this.jDate;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */