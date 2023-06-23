package Alarm;

public abstract class BaseAlarm implements Alarm {
    private String name;
    private int hour;

    public BaseAlarm(String name, int hour) {   //construtor
        this.name = name;
        this.hour = hour;
    }

    public int getHour() {
        return hour;
    }

    @Override
    public boolean equalName(Alarm al) {
        if (al instanceof BaseAlarm) {
            BaseAlarm otherAlarm = (BaseAlarm) al;
            return this.name.equals(otherAlarm.name);
        }
        return false;
    }

    @Override
    public String toString() {
        return name + ": " + hour + "h";
    }
}

