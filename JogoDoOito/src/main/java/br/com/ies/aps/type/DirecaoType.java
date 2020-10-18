package br.com.ies.aps.type;

public enum DirecaoType {

	CIMA(-1,0), BAIXO(1,0), DIREITA(0,1), ESQUERDA(0,-1);
	
	private Integer linha;
	private Integer coluna;
	
	private DirecaoType(Integer linha, Integer coluna) {
		this.linha = linha;
		this.coluna = coluna;
	}
	
	public Integer getLinha() {
		return linha;
	}
	public Integer getColuna() {
		return coluna;
	}
	
}
