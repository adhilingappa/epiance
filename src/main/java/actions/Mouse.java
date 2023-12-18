package actions;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;

import utils.Timer;

/**
 * This class will consists of mouse action methods
 * 
 * @author Dhanush
 *
 */
public class Mouse {

	/**
	 * This method will scroll Down for given steps
	 * 
	 * @param steps
	 */
	public static void scrollDown(String steps) {
		Robot robot = Keyboard.getRobot();
		int step = Integer.parseInt(steps);
		robot.mouseWheel(step);
		Timer.waitTime(500);
		robot.waitForIdle();
	}

	/**
	 * This method will scroll Up for given steps
	 * 
	 * @param steps
	 */
	public static void scrollUp(String steps) {
		Robot robot = Keyboard.getRobot();
		int step = Integer.parseInt(steps);
		robot.mouseWheel(-step);
		Timer.waitTime(500);
		robot.waitForIdle();
	}
	
	/**
	 * this method used to draw region 
	 * @param startX
	 * @param startY
	 * @param endX
	 * @param endY
	 * @author Adhilingappa
	 */
	public void drawRegion(int startX, int startY, int endX, int endY) {
		
		try {
			Robot robot = new Robot();
			robot.setAutoDelay(100);
			
			robot.mouseMove(startX, startY);
			robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
			robot.mouseMove(endX, startY);
			robot.mouseMove(endX, endY);
			Timer.waitTime(1000);
			robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
		} catch (AWTException e) {
			System.err.println("exception error in draw region");
			e.printStackTrace();
		}
	}

}
