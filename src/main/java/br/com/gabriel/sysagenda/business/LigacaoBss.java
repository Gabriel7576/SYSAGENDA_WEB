package br.com.gabriel.sysagenda.business;

import java.util.List;

import br.com.gabriel.sysagenda.dao.LigacaoDao;
import br.com.gabriel.sysagenda.domain.Ligacao;
import br.com.gabriel.sysagenda.domain.LigacaoId;

public class LigacaoBss {

	LigacaoDao dao = new LigacaoDao();

	public void adicionaLigacao(Ligacao ligacao) {

		dao.adiciona(ligacao);
	}

	public List<Ligacao> getlista() {

		return dao.lista();
	}

	public Ligacao getLigacao(LigacaoId id) {

		return dao.getLigacao(id);
	}

	public void alteraLigacao(Ligacao ligacao) {

		dao.alterar(ligacao);
	}

	public void deletaLigacoes(int codContato) {

		dao.deletaTodas(codContato);
	}

	public void deletaLigacao(LigacaoId ligacaoid) {

		dao.deletaUma(ligacaoid);
	}

	public Integer getCodLigacao(Integer codContato) {

		return dao.getUtlCodLigacao(codContato) + 1;
	}

}
