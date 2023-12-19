package homework2;
import static org.junit.jupiter.api.Assertions.*;
class MyTimeTest {
    @org.junit.jupiter.api.Test
    void toUniversalString() {
        assertEquals("15:00:00",new MyTime(15).toUniversalString());
        assertEquals("23:45:50",new MyTime(23,45,50).toUniversalString());
        System.out.println(new MyTime(11,45,66).toUniversalString());
        System.out.println(new MyTime(25,70,0).toUniversalString());
    }
    @org.junit.jupiter.api.Test
    void testToString() {
        assertEquals("03:25:00 PM",new MyTime(15,25).toString());
        assertEquals("12:10:45 PM",new MyTime(12,10,45).toString());
        assertEquals("07:00:00 AM",new MyTime(7).toString());
    }
    @org.junit.jupiter.api.Test
    void incrementHour() {
        MyTime test1=new MyTime(23,45,50);
        test1.incrementHour();
        assertEquals("00:45:50 AM",test1.toString());
        MyTime test2=new MyTime(14,11);
        test2.incrementHour();
        assertEquals("15:11:00",test2.toUniversalString());
    }
    @org.junit.jupiter.api.Test
    void incrementMinute() {
        MyTime test1=new MyTime(23,59,59);
        test1.incrementMinute();
        assertEquals("00:00:59 AM",test1.toString());
        MyTime test2=new MyTime(19,1);
        test2.incrementMinute();
        assertEquals("19:02:00",test2.toUniversalString());
        MyTime test3=new MyTime(15,59);
        test3.incrementMinute();
        assertEquals("04:00:00 PM",test3.toString());
    }
    @org.junit.jupiter.api.Test
    void incrementSecond() {
        MyTime test1=new MyTime(23,59,59);
        test1.incrementSecond();
        assertEquals("00:00:00 AM",test1.toString());
        MyTime test2=new MyTime(11,45,14);
        test2.incrementSecond();
        assertEquals("11:45:15",test2.toUniversalString());
        MyTime test3=new MyTime(15,59,59);
        test3.incrementSecond();
        assertEquals("04:00:00 PM",test3.toString());
    }
}