public class Student {
    String name;
    int age;

    public Student(String name){
        this.name = name;
    }
    public Student(String name, int age){
        this.name = name;
        this.age = age;
    }

    public void setAge(int age){
        this.age = age;
    }
    public int getAge(){
        return this.age;
    }

    public void study(){
        System.out.println("Student " + this.name + "is studying...");
    }
}
