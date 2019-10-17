package com.duongminhtai.utils;

import java.io.IOException;
import java.util.Properties;

public class PropertiesUtil {
	public static Properties readProperties() {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		Properties properties = new Properties();
		try {
			properties.load(classLoader.getResourceAsStream("com/duongminhtai/config/database.properties"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return properties;
	}
}
