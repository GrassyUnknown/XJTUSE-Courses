package homework2;

import java.awt.Graphics;
import java.awt.Color;

public class MyCircle implements Drawable,AreaMeasurable {
	private int x;
	private int y;
	private int r;
	private Color color = Color.black;
	public MyCircle(int x, int y, int r, Color color) {//Ordinary constructor
		this.x = x;
		this.y = y;
		this.r = r;
		this.color = color;
	}
	public MyCircle(int r, Color color) {//Without coordinates
		this.x = r;
		this.y = r;
		this.r = r;
		this.color = color;
	}
	public MyCircle(int x, int y, int r) {//Without color
		this.x = x;
		this.y = y;
		this.r = r;
	}
	public MyCircle(int r) {//Without coordinates and color
		this.x = r;
		this.y = r;
		this.r = r;
	}
	public void draw(Graphics g)
	{
		g.setColor(color);
		g.drawOval(x-r,y-r,2*r,2*r);
	}
	public double getArea()
	{
		return r*r*Math.PI;
	}
}
