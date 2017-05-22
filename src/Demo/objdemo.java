package Demo;

import java.util.List;

import obj.Peruse;
import obj.Shop;
import obj.Users;
import Dao.Sel;

public class objdemo {

	public static void main(String[] args) {
		//join fetch
		
		// TODO Auto-generated method stub
//		List<Peruse> aList=Sel.HSQL("from Peruse a join fetch a.users x where x.usersid='111'");
//		for (Peruse peruse : aList) {
//			System.out.println(peruse.getUsers().getUsername());
//			System.out.println(peruse.getUses().getUseid());
//			System.out.println("===============");
//		}
//		for (Peruse peruse : aList) {
//			System.out.println(peruse.getId());
//			System.out.println(peruse.getUsers().getUsername());
//			System.out.println(peruse.getUses().getUseid());
//			System.out.println(peruse.getUses().getName());
//			System.out.println("=================");
//		}
		
		
		
		//count
		
		System.out.println(Sel.count("Logs"));
	}

}
