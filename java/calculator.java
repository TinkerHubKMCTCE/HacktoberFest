public class Minicalculator {
    public static void main(String[]args){
                double dub =add(5,2);
                System.out.println(dub);
        
		double dub2 = mul(5,2);
		System.out.println(dub2);
		
		double dub3 = sub(5,2);
		System.out.println(dub3);
		
		double dub4 = mod(5,2);
		System.out.println(dub4);
	        
	        double dub5 = div(5,2);
		System.out.println(dub5);
	    
		double d = area(4);
		System.out.println(d);
		
		double d2 = area(5,7);
		System.out.println(d2);
    }
	 
    public static double add(int x,int y) {
		int c = x+y;
		double d = (double)c;
		switch(c) {
		case 0:
			return 0;
		default:
			return d;
		}
	}
    public static double mul(int x,int y) {
		int a = x * y;
		double d = (double) a;
		
	   switch(a){
	    case 0:
	        return 0;
	    default:
	        return d;
	    }
	    
    }
    public static double sub(int x,int y) {
		int s = x + y;
		double b = (double)s;
		switch(s) {
		case 0:
			return 0;
        default:
        	return b;
		}
	}
    public static double mod(int x,int y) {
		int p = x%y;
		double d = (double)p;
		switch(p) {
		case 0:
			return 0;
		default:
			return d;
		}
    }
	   
	public static double div(int x,int y) {
		int r = x/y;
		double d = (double)r;
		switch(r) {
		case 0:
			return 0;
		default:
			return d;
		}
	}
	public static double area(int radius) {
		double pi = 3.14;
		double area = pi * radius * radius;
		if(radius < 0) {
			return -1;
		}else {
			return area;
		}
		      
	}
	public static double area(double x,double y) {
		double l=0;
		double b = 0;		
		double areaRect = x * y;
		if(x<0 || y<0) {
		      return -1;
		}
		else {
			return areaRect;
		}
	}
	

}
   
        
	 
   	
	

		
   
