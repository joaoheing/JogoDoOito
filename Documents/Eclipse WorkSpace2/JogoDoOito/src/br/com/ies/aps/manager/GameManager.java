package br.com.ies.aps.manager;

import java.util.LinkedList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Random;
import java.util.stream.IntStream;

import br.com.ies.aps.frame.FrameJogoOito;
import br.com.ies.aps.model.Casa;
import br.com.ies.aps.model.Jogo;
import br.com.ies.aps.type.DirecaoType;
import br.com.ies.aps.util.Constants;

public class GameManager {

	private FrameJogoOito frameJogoOito;
	
	private Jogo jogo;

	public GameManager(FrameJogoOito frameJogoOito) {
		this.frameJogoOito = frameJogoOito;
		jogo = new Jogo();
	}

	public void embaralharCasas() {
		List<Integer> listaCasas = new LinkedList<Integer>();
		
		IntStream
				.range(0, (int) Math.pow(Constants.TAMANHO_MATRIZ_JOGO, 2))
				.forEach(valor -> listaCasas.add(valor));

		for(int x = 0; x < Constants.TAMANHO_MATRIZ_JOGO; x++) {
			for(int y = 0; y < Constants.TAMANHO_MATRIZ_JOGO; y++) {

				Integer numeroRandomico = listaCasas.get(new Random().nextInt(listaCasas.size()));
				jogo.adicionaCasa(numeroRandomico, new Casa.Builder()
						.withLinha(x)
						.withColuna(y)
						.build());
				listaCasas.remove(numeroRandomico);
				
			}
		}
		
		frameJogoOito.alterarCampos(jogo);

	}

	public void mover(DirecaoType direcao) {
		try {
			Casa casaZero = jogo.retornaCasa(0);

			jogo.retornaCasa(new Casa.Builder()
					.withLinha(casaZero.getLinha() - (direcao.getLinha() * - 1))	
					.withColuna(casaZero.getColuna() - (direcao.getColuna() * - 1))
					.build())
							.setLinha(casaZero.getLinha())
							.setColuna(casaZero.getColuna());

			casaZero.setLinha(casaZero.getLinha() + direcao.getLinha())
					.setColuna(casaZero.getColuna() + direcao.getColuna());

			frameJogoOito.alterarCampos(jogo);
			
		}catch(NoSuchElementException e) {
		}
	}
	
	public boolean verificarFimJogo() {
		int index = 0;
		
		for(int l = 0; l < Constants.TAMANHO_MATRIZ_JOGO; l++) {
			for(int c = 0; c < Constants.TAMANHO_MATRIZ_JOGO; c++) {
				
				if (jogo.retornaValor(new Casa.Builder()
						.withLinha(l)	
						.withColuna(c)
						.build())  != index) return false;
				
				index++;
			}
		}
		
		return true;
		
	}

}
