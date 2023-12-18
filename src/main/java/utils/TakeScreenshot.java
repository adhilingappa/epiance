package utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.sikuli.script.Screen;

public class TakeScreenshot {

	/**
	 * This method will take screenshot and saves in screenshots folder with test
	 * case name
	 * 
	 * @param screenshotName
	 * @return
	 */
	public static String captureScreenShot(String screenshotName) {
		BufferedImage img = new Screen().capture().getImage();

		String path = "screenshots\\" + screenshotName + ".png";
		File outputfile = new File(path);
		try {
			ImageIO.write(img, "png", outputfile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return outputfile.getAbsolutePath();
	}

}
