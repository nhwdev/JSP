package ex12.el;

public class Compute {
	public static int add(String x, String y) {
		try {
			int a = Integer.parseInt(x);
			int b = Integer.parseInt(y);
			return a + b;
		} catch (Exception e) {
		}
		return 0;
	}
}
