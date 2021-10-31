public class Minicalculator {
    public static void main(String[]args){
        double dub =add(4,2);
        System.out.println(dub);
        
		double dub2 = mul(4,2);
		System.out.println(dub2);
		
		double dub3 = sub(4,2);
		System.out.println(dub3);
		
		double dub4 = mod(4,2);
		System.out.println(dub4);
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
   	
	

		
   
