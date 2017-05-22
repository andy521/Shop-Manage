package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tools.HSession;

public class Ins {
	public static void INS(Object obj) {
		Session session=HSession.getSession();
		Transaction tx=session.beginTransaction();
		try {
			session.save(obj);
			tx.commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			HSession.closeSession();
		}
		
		
	}
	
}
