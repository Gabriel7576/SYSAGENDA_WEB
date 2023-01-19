package br.com.gabriel.sysagenda.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import br.com.gabriel.sysagenda.domain.Contato;
import br.com.gabriel.sysagenda.factory.ConnectionFactory;

public class ContatoDao {

	private EntityManager em;
	private UserTransaction userTransaction;

	public ContatoDao() {

		em = ConnectionFactory.getEntityManager();
		userTransaction = ConnectionFactory.getUserTransaction();
	}

	public void adiciona(Contato contato) {

		try {
			userTransaction.begin();
			em.persist(contato);
			userTransaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				userTransaction.rollback();
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (SecurityException e1) {
				e1.printStackTrace();
			} catch (SystemException e1) {
				e1.printStackTrace();
			}
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Contato> lista() {

		try {
			Query query = em.createQuery("select o from Contato o order by codContato");
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public Contato getContato(Integer codContato) {

		try {
			return em.find(Contato.class, codContato);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public void altera(Contato contato) {

		try {
			userTransaction.begin();
			em.merge(contato);
			userTransaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				userTransaction.rollback();
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (SecurityException e1) {
				e1.printStackTrace();
			} catch (SystemException e1) {
				e1.printStackTrace();
			}
			throw new RuntimeException(e);
		}
	}

	public void deleta(int codContato) {

		try {
			userTransaction.begin();
			em.remove(getContato(codContato));
			userTransaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				userTransaction.rollback();
			} catch (IllegalStateException | SecurityException | SystemException e1) {
				e1.printStackTrace();
			}
			throw new RuntimeException(e);
		}
	}

	public Integer getUtlCodContato() {

		try {
			Query query = em.createQuery("select max(codContato) from Contato");
			return (Integer) query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
