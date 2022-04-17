package mimemi.mvc.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.util.Date;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		System.out.println(dateFormat.format(date));
	}

}
