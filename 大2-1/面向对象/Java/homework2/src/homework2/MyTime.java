package homework2;

import java.awt.*;

public class MyTime implements Drawable {
    //variable and initialization
    private int hour=0,minute=0,second=0;
    //constructor
    public MyTime(){}
    public MyTime(int hour){
        this.hour=hour;
    }
    public MyTime(int hour,int minute){
        this.hour=hour;
        this.minute=minute;
    }
    public MyTime(int hour,int minute,int second){
        this.hour=hour;
        this.minute=minute;
        this.second=second;
    }
    public MyTime(MyTime time){
        this.hour=time.hour;
        this.minute=time.minute;
        this.second=time.second;
    }
    public String toUniversalString(){
        if(hour>23){
            System.out.println("hour must be 0-23");
        }
        if(minute>59){
            System.out.println("minute must be 0-59");
        }
        if(second>59){
            System.out.println("second must be 0-59");
        }
        if(hour<24&&minute<60&&second<60){
            return String.format("%02d:%02d:%02d",hour,minute,second);
        }
        else{
            return "";
        }
    }
    public String toString(){
        if(hour<24&&minute<60&&second<60){
            if(hour<12){//a.m.
                return String.format("%02d:%02d:%02d AM",hour,minute,second);
            }
            else if(hour>12){//p.m.
                return String.format("%02d:%02d:%02d PM",hour-12,minute,second);
            }
            else if(hour==12){//moon
                return String.format("%02d:%02d:%02d PM",hour,minute,second);
            }
        }
        return "";
    }
    public void incrementHour(){
        hour++;
        if(hour==24){
            hour=0;
        }
    }
    public void incrementMinute(){
        minute++;
        if(minute==60){
            minute=0;
            incrementHour();
        }
    }
    public void incrementSecond(){
        second++;
        if(second==60){
            second=0;
            incrementMinute();
        }
    }
    public void draw(Graphics g){
        g.drawOval(50,50,200,200);
        g.drawString("12", 145, 60);
        g.drawString("3", 242, 150);
        g.drawString("6", 150, 248);
        g.drawString("9", 52, 150);
        g.drawLine(150, 150, (int)(150+50*Math.sin(Math.abs(hour-12)/12*Math.PI)), (int)(150+50*Math.cos(Math.abs(hour-12)/12*Math.PI)));
        g.drawLine(150, 150, (int)(150+100*Math.sin(minute/60*Math.PI)), (int)(150+100*Math.cos(Math.abs(minute)/60*Math.PI)));
        g.drawLine(150, 150, (int)(150+140*Math.sin(second/60)*Math.PI), (int)(150+140*Math.cos(Math.abs(second)/60*Math.PI)));
    }
}