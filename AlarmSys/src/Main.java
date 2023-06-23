import Alarm.*;

public class Main {
    public static void main(String[] args) {

        Alarm a1 = new SingleAlarm("POO", new Date(23,7,2023), 23);
        Alarm a2 = new DailyAlarm("Acordar", 7, WeekDay.WorkDays);
        Alarm a3 = new DailyAlarm("Estudar", 10, WeekDay.WorkDays);
        Alarm a4 = new DailyAlarm("Trabalhar", 8, WeekDay.WorkDays);
        AlarmSys as = new AlarmSys();
        try {
            as.start(a1).start(a2).start(a3).start(a4).run();
        } catch (AlarmDup e) { System.out.println(e.getMessage());}
    }
}