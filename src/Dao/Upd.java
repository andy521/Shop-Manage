package Dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tools.HSession;

public class Upd
{
	public static void UPD(Object obj)
	{
		Session session = HSession.getSession();
		Transaction tx = session.beginTransaction();
		try
		{
			session.saveOrUpdate(obj);
			tx.commit();
		}
		catch (HibernateException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
	}

	public static void upd(String sql)
	{
		Session session = HSession.getSession();
		try
		{
			Query query = session.createSQLQuery(sql);

			query.executeUpdate();
			session.flush();
			session.clear();
		}
		catch (HibernateException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
	}
}
