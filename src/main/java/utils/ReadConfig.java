package utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * The ReadConfigProperty class is used to read the configuration details from
 * config properties file
 * 
 * @author Dhanush
 *
 */
public class ReadConfig {

	private static final Logger log = LogManager.getLogger(ReadConfig.class);
	static List<String> contentFromConfigFile = new ArrayList<String>();
	static List<String> listOfSuiteNames = new ArrayList<String>();
	static Map<String, String> map = new HashMap<String, String>();
	public static String configpath;
	static Properties properties = null;

	/**
	 * Get value from config properties file by providing key
	 */
	public static String getConfigValue(String key) {

		FileInputStream fis = null;
		try {
			fis = new FileInputStream("./config/config.properties");
			properties = new Properties();
			properties.load(fis);
		} catch (FileNotFoundException fnfe) {
			log.error("Exception in getConfigValues :- " + fnfe.getMessage());
		} catch (IOException ioe) {
			log.error("Exception in getConfigValues :- " + ioe.getMessage());
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				log.error("Exception in getConfigValues :- " + e.getMessage());
			}
		}
		return properties.getProperty(key);
	}

	/**
	 * Get Workbook paths in config properties file which contains key name(Not
	 * using Main.xlsx is replaced for this) TestSuite_SHEETPATH
	 */
	public Map<String, String> getTestSuiteSheetPath() {
		String line;
		if (properties == null) {
			try {
				File file = new File("./config/config.properties");
				FileInputStream fileInput = new FileInputStream(file);
				@SuppressWarnings("resource")
				BufferedReader buffReader = new BufferedReader(new InputStreamReader(fileInput));
				while ((line = buffReader.readLine()) != null) {

					String[] temp3 = line.split("=");
					if (temp3.length > 1) {
						String key = temp3[0];
						String value = temp3[1];

						if (key.contains("TestSuite_SHEETPATH")) {
							map.put(key, value);
						}
					}
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				log.getName();
				log.error(e.getLocalizedMessage());
				log.error(e.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
				log.getName();
				log.error(e.getLocalizedMessage());
				log.error(e.getMessage());
			}
		}
		return map;
	}
}
