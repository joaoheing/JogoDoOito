package br.com.ies.aps.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.ies.aps.entity.JogadaEntity;
import br.com.ies.aps.util.HibernateUtil;

public class JogadaDao {

	
	public JogadaDao() {
		HibernateUtil.carregaSessionFactory();
	}
	
	public JogadaEntity salvaJogada(JogadaEntity jogada) {
		Transaction transaction = null;

		try(Session session = HibernateUtil.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();

			session.save(jogada);

			transaction.commit();

			return jogada;

		}catch(Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}
