package br.com.ies.aps.listener;

import java.awt.event.KeyEvent;

import br.com.ies.aps.manager.GameManager;
import br.com.ies.aps.type.DirecaoType;

public class KeyListener implements java.awt.event.KeyListener {
	
	private GameManager gameManager;

	public KeyListener(GameManager gameManager) {
		this.gameManager = gameManager;
	}

	@Override
	public void keyTyped(KeyEvent e) {

	}

	@Override
	public void keyPressed(KeyEvent e) {

	}

	@Override
	public void keyReleased(KeyEvent e) {
		int teclaApertada = e.getKeyCode();

		switch(teclaApertada) {

		case 37:
			gameManager.mover(DirecaoType.ESQUERDA);
			break;
		case 38:
			gameManager.mover(DirecaoType.CIMA);
			break;
		case 39:
			gameManager.mover(DirecaoType.DIREITA);
			break;
		case 40:
			gameManager.mover(DirecaoType.BAIXO);
			break;
		}
		
	}

}
