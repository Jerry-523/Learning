package Alarm;

public enum WeekDay {
    MON, TUE, WED, THU, FRI, SAT, SUN;
    public static WeekDay[] WorkDays = {MON, TUE, WED, THU, FRI};
    public boolean isOneOf (WeekDay[] wds) {
        for (WeekDay wd : wds) if (wd == this) return true;
        return false;
    }
    public static String toString(WeekDay[] days) {
        StringBuilder str = new StringBuilder("{ ");
        for (WeekDay day : days) str.append(day).append(" ");
        return str.append("}").toString();
    }
}

