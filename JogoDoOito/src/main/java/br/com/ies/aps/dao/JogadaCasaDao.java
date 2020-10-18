package br.com.ies.aps.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.ies.aps.entity.JogadaCasaEntity;
import br.com.ies.aps.util.HibernateUtil;

public class JogadaCasaDao {


	public JogadaCasaEntity salvaJogadaCasa(JogadaCasaEntity jogadaCasa) {
		Transaction transaction = null;

		try(Session session = HibernateUtil.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();

			session.save(jogadaCasa);

			transaction.commit();

			return jogadaCasa;

		}catch(Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}
