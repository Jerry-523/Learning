package Alarm;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

public class AlarmSys implements Iterable<Alarm> {
    private List<Alarm> alarms = new ArrayList<>();

    public AlarmSys start(Alarm al) throws AlarmDup {
        for (Alarm existingAlarm : alarms) {
            if (existingAlarm.equalName(al)) {
                throw new AlarmDup(existingAlarm.toString());
            }
        }
        alarms.add(al);
        return this;
    }

    public void stop(Alarm al) {
        alarms.remove(al);
    }

    public void run() {
        Date currentDate = getCurrentDate();
        List<Alarm> alarmsCopy = new ArrayList<>(alarms);

        for (int hour = 0; hour < 24; hour++) {
            for (Alarm al : alarmsCopy) {
                if (al.trigger(hour, currentDate, this)) {
                    System.out.println(currentDate + " " + hour + "h -> " + al);
                }
            }
        }
    }

    private static Date getCurrentDate() {
        Calendar calendar = new GregorianCalendar();
        int currentDay = calendar.get(Calendar.DAY_OF_MONTH);
        int currentMonth = calendar.get(Calendar.MONTH) + 1;
        int currentYear = calendar.get(Calendar.YEAR);
        Date currentDate = new Date(currentDay, currentMonth, currentYear);
        return currentDate;
    }

    @Override
    public Iterator<Alarm> iterator() {
        return alarms.iterator();
    }
}


