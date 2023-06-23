package Alarm;

public class AlarmDup extends Exception{
    private String description;
    public AlarmDup(String description) {
        this.description = description;
    }
    public String getMessage() {
        return "Already exist: " + description;
    }
}
