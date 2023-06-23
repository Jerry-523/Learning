package Alarm;

public class SingleAlarm extends BaseAlarm {
    private Date date;

    public SingleAlarm(String name, Date date, int hour) {
        super(name, hour);
        this.date = date;
    }

    @Override
    public boolean trigger(int hour, Date dt, AlarmSys as) {
        if (getHour() == hour && date.equals(dt)) {
            as.stop(this);
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        return super.toString() + " " + date.toString() + " (" + date.getWeekDay() + ")";
    }
}

