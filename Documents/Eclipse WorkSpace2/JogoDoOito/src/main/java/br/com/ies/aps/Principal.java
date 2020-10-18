package br.com.ies.aps;

import java.awt.EventQueue;

import br.com.ies.aps.frame.FrameJogoOito;
import br.com.ies.aps.listener.KeyListener;
import br.com.ies.aps.manager.GameManager;

public class Principal {

	public static void main(String[] args) {
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FrameJogoOito frame = new FrameJogoOito();
					GameManager gameManager = new GameManager(frame);
					
					gameManager.embaralharCasas();
					
					frame.setVisible(true);
					frame.addKeyListener(new KeyListener(gameManager));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		
	}
	
}
