package tools;

import obj.Goods;
import Dao.Ins;
import Dao.Sel;

public class jiaoben {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		Goods goods=new Goods();
		long a=6900000000000L;
		
		for(a=6900000000039L;a<6999999999999L;a++)
		{
			System.out.println(Long.toString(a));
			goods=tm.getTm(Long.toString(a));
			if(goods.getName().indexOf("目前没有该产品信息")!=-1)
			{
				
			}
			else 
			{
				//数据库查不到，能抓到时
				Ins.INS(goods);
				System.out.println("Yes!");
				
			}
			
		}
		
		
		

	}

}
