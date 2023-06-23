package Alarm;

public class Date {
    private final int day, month, year;
    public Date(int d, int m, int y) { day = d; month = m; year = y; };

    @Override public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Date other = (Date)obj;
        return day == other.day && month ==other.month && year == other.year;
    }
    @Override public String toString() {
        return day+"-"+month+"-"+year+" ("+getWeekDay()+")";
    }

    public WeekDay getWeekDay(){
        // fórmula do calendário de Zeller
        int q, m, y, h, j;
        q = day;
        m = (month - 3 + 4800) % 4800;
        y = (year + m / 12) % 400;
        m %= 12;
        j = (q + 2 * m + 3 * (m + 1) / 5 + y + y / 4 - y / 100 + y / 400) % 7;
        return WeekDay.values()[j];
    }
}
