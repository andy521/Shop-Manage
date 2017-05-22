package aa;

import tools.MD5;

public class aa
{

	public static void main(String[] args)
	{
		// TODO Auto-generated method stub
		//		List aList;
		//		String sqlString="SELECT g.kind,sum(a.number) as number FROM shopManage.dbo.logs AS a JOIN shopManage.dbo.goods g on a.goodsid = g.goodsid  where a.upkind like '%sale%' group by g.kind";
		//		System.out.println(sqlString);
		//		aList=Sel.SSQL(sqlString);
		//		System.out.println(aList);
		System.out.println(MD5.MD5_32("naah546969"));

	}

}
