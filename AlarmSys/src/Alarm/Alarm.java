package Alarm;

public interface Alarm {
    boolean trigger(int hour, Date dt, AlarmSys as);
    boolean equalName(Alarm al);
}
