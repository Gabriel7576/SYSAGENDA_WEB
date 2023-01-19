package br.com.gabriel.sysagenda.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import br.com.gabriel.sysagenda.business.LigacaoBss;
import br.com.gabriel.sysagenda.domain.Ligacao;
import br.com.gabriel.sysagenda.domain.LigacaoId;
import br.com.gabriel.sysagenda.factory.ConnectionFactory;

public class LigacaoDao {

	private EntityManager em;
	private UserTransaction userTransaction;

	public LigacaoDao() {
		em = ConnectionFactory.getEntityManager();
		userTransaction = ConnectionFactory.getUserTransaction();
	}

	public void adiciona(Ligacao ligacao) {
		try {
			userTransaction.begin();
			em.persist(ligacao);
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

	public Ligacao getLigacao(LigacaoId id) {

		try {
			return em.find(Ligacao.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Ligacao> lista() {
		try {
			Query query = em.createQuery("select o from Ligacao o");
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public void alterar(Ligacao ligacao) {
		try {
			userTransaction.begin();
			em.merge(ligacao);
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

	public void deletaUma(LigacaoId ligacaoid) {
		try {
			userTransaction.begin();
			em.remove(new LigacaoBss().getLigacao(ligacaoid));
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

	public void deletaTodas(int codContato) {
		try {

			userTransaction.begin();
			Query query = em.createQuery("delete from Ligacao l where id.codContato = :codContato");
			query.setParameter("codContato", codContato);
			query.executeUpdate();
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

	public Integer getUtlCodLigacao(Integer codContato) {
		try {
			Query query = em
					.createQuery("select nvl(max(id.codLigacao), 0) from Ligacao where id.codContato = :codContato");
			query.setParameter("codContato", codContato);
			return (Integer) query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
