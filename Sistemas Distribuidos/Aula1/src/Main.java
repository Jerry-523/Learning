
public class Main {
    public static void main(String[] args) {

        Student marco = new Student("Marco", 23);
        Student ana = new Student("Ana");
        Student maria = new Student("Maria");

        marco.study();
        ana.study();
        maria.study();

        marco.setAge(24);
        System.out.println("Student " + marco.name + " with age " + marco.getAge());

    }
}