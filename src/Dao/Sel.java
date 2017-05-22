package Dao;

import java.util.List;



import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.collections.map.StaticBucketMap;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;

import tools.HSession;

public class Sel {
	public static List HSQL(String hql) {
		Session session=HSession.getSession();
		Transaction tx=session.beginTransaction();
		List list=null;
		try {
			Query query=session.createQuery(hql);
			 list=query.list();
			tx.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return list;
	}
	
	public static Object getHQL(Class a,String id) {
		Session session=HSession.getSession();
		Object aObject=null;
		try {
			aObject=session.get(a, id);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return aObject;
	}
	
	public static Object getObj(String hql) {
		Session session=HSession.getSession();
		Transaction tx=session.beginTransaction();
		Object aObject=null;
		List list=null;
		try {
			Query query=session.createQuery(hql);
			 list=query.list();
			tx.commit();
			if(list!=null&&list.size()>0)
			{
				aObject=list.get(0);
			}
			else {
				aObject=null;
			}
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return aObject;
		
	}
	
	/**
	 * 
	 * @param hql hql语句
	 * @param page 页数
	 * @return 查询结果list
	 */
	public static List HSQL(String hql,int page,int num)
	{
		Session session=HSession.getSession();
		Transaction tx=session.beginTransaction();
		List list=null;
		try {
			Query query=session.createQuery(hql).setMaxResults(num).setFirstResult((page-1)*10);
			 list=query.list();
			tx.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return list;
	}
	
	/**
	 * 
	 * @param hql hql语句
	 * @param page 页数
	 * @param values 预编译字段的字段与值
	 * @return 查询结果list
	 */
	public static List HSQL(String hql,int page,String[][] values,int num)
	{
		Session session=HSession.getSession();
		Transaction tx=session.beginTransaction();
		List list=null;
		try {
			Query query=session.createQuery(hql).setMaxResults(num).setFirstResult((page-1)*10);
			for (int i = 0; i < values.length; i++) {
				query.setString(values[i][0], values[i][1]);
			}
			list=query.list();
			tx.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return list;
	}

	/**
	 * 
	 * @param sql sql语句
	 * @param page 页数
	 * @return 查询结果list
	 */
	public static List SSQL(String sql,int page) 
	{
		Session session=HSession.getSession();
		Transaction tx=session.beginTransaction();
		List list=null;
		try {
			Query query=session.createSQLQuery(sql).setMaxResults(10).setFirstResult((page-1)*10);
			 list=query.list();
			tx.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return list;
	}
	public static List SSQL(String sql) 
	{
		Session session=HSession.getSession();
		Transaction tx=session.beginTransaction();
		List list=null;
		try {
			Query query=session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);;
			list=query.list();
			tx.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return list;
	}
	
	public static int count (String objectname) {
		Session session=HSession.getSession();
		String hql = "select count(*) from "+objectname+" as user";  
		 Query query =  session.createQuery(hql);
		 int a=((Long) query.uniqueResult()).intValue();
		 HSession.closeSession();
		 return a;  
		
	}
	
	public static int SQLcount (String sql) {
		Session session=HSession.getSession();
		Transaction tx=session.beginTransaction();
		int a=0;
		try {
			Query query=session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);;
			 a=(int)((Map)query.list().get(0)).get("count");
			tx.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return a;
		
	}

	public static JSONArray json(String hql)
	{
		List list=null;
		JSONArray json = new JSONArray();
		try {
			 list=SSQL(hql);
//			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			json=JSONArray.fromObject(list.toArray());
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		return json;
	}
}
