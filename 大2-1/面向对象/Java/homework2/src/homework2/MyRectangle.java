package homework2;

import java.awt.Graphics;
import java.awt.Color;

public class MyRectangle implements Drawable,AreaMeasurable {
	private int x = 0;
	private int y = 0;
	private int width = 1;
	private int height = 1;
	private Color color = Color.black;
	public MyRectangle(){}
	public MyRectangle(int x,int y,int width,int height,Color color){//Ordinary constructor
		this.x=x;
		this.y=y;
		this.width=width;
		this.height=height;
		this.color=color;
	}
	public MyRectangle(int x,int y,int width,int height){//Ordinary constructor without color
		this.x=x;
		this.y=y;
		this.width=width;
		this.height=height;
	}
	public MyRectangle(int width,int height,Color color){//Ordinary constructor without coordinates
		this.width=width;
		this.height=height;
		this.color=color;
	}
	public MyRectangle(int width,int height){//Ordinary constructor without coordinates and color
		this.width=width;
		this.height=height;
	}
	public MyRectangle(int x,int y,int sideLength,Color color){//Square constructor
		this.x=x;
		this.y=y;
		this.width=sideLength;
		this.height=sideLength;
		this.color=color;
	}
	public MyRectangle(int sideLength,Color color){//Square constructor without coordinates
		this.width=sideLength;
		this.height=sideLength;
		this.color=color;
	}

	public void draw(Graphics g)
	{
		g.setColor(color);
		g.drawRect(x,y,width,height);
	}
	public double getArea()
	{
		return width*height;
	}
}
