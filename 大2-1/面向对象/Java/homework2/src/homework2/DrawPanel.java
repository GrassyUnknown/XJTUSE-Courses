package homework2;

import javax.swing.JPanel;
import java.awt.Color;
import java.awt.Graphics;

public class DrawPanel extends JPanel {

	private static final long serialVersionUID = 1L;
	private Drawable[] drawables;
	private int type;
	
	private static final int NONE = 0;
	private static final int GRAPH = 1;
	private static final int NULL = 2;
	private static final int NOTARRAY = 3;
	
	public DrawPanel()
	{
		setBackground(Color.BLACK);
		type = NONE;
	}

	public DrawPanel(Drawable[] drawables){
		setBackground(Color.WHITE);
		if (drawables == null)
		{
			type = NULL;
			return;
		}
		if (!drawables.getClass().isArray())
		{
			type = NOTARRAY;
			return;
		}
		this.drawables = drawables;
		type = GRAPH;
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		switch(type){
		case GRAPH:
			for(Drawable drawable : drawables)
				drawable.draw(g);
			break;
		case NULL:
			g.drawString("在DrawPanel的构造函数中，你传递的引用参数是NULL。", 50, 50);
			break;
		case NOTARRAY:
			g.drawString("在DrawPanle的构造函数中，你传递的引用参数必须是某个形状的数组类型。", 50, 50);
			break;
		}
	}	
}
